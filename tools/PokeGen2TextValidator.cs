using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;

namespace PokeGen2TextValidator
{
    internal class PokeGen2TextValidator
    {
		// Program.cs
        public static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                PrintHelpText();
                return 0;
            }

            ASMFile source = GetASMFile(args[0]);
			if (source == null)
			{
				return 0;
			}
			
            Console.WriteLine("Validating file: " + source.File.Name + " Type: " + source.Type);

			bool problem = false;
			foreach (KeyValuePair<string, Block> pair in source.blocks)
			{
				Validator validator = new Validator(pair.Value);
				string message = validator.Validate();
				if (!string.IsNullOrWhiteSpace(message))
				{
					if (message.Contains("Error"))
					{
						problem = true;
					}
					Console.Write(message);
				}
			}

			Console.WriteLine("Result: " + (problem ? "Failed!\n" : "Passed!\n"));
			return problem ? 1 : 0;
        }

        private static void PrintHelpText()
        {
            Console.WriteLine("Usage: PokeGen2TextValidator <Source>");
            Console.WriteLine("<Source>: File to validate");
        }

        private static ASMFile GetASMFile(string path)
        {
            path = path.Replace("\\", "/");
            if (!path.EndsWith(".asm"))
            {
                Console.WriteLine("File " + path + " is not an asm file!");
                return null;
            }
            if (!File.Exists(path))
            {
                Console.WriteLine("File " + path + " not found!");
                return null;
            }
            return new ASMFile(path);
        }
    }

    // ASMFile.cs
    public enum FileType
    {
        /// <summary>
        /// Unknown or miscellaneous data. No string validation will be available.
        /// </summary>
        Misc = 0,
        /// <summary>
        /// Text for a textbox. Limit 18 chars per line of text.
        /// </summary>
        TextBox = 1,
        /// <summary>
        /// Pokédex entry.
        /// </summary>
        Pokedex = 2,
        /// <summary>
        /// Pokémon names.
        /// </summary>
        Pokemon = 3,
        /// <summary>
        /// Move names.
        /// </summary>
        Move = 4,
        /// <summary>
        /// Item names.
        /// </summary>
        Item = 5,
        /// <summary>
        /// Type names.
        /// </summary>
        Type = 6,
        /// <summary>
        /// Map landmarks. Town, route, dungeon names.
        /// </summary>
        Landmark = 7,
        /// <summary>
        /// Trainer class names.
        /// </summary>
        TrainerClass = 8,
    }

    internal class ASMFile : IEnumerable<Block>
    {

        public String Name { get; private set; }
        public FileInfo File { get; private set; }
        public FileType Type { get; private set; }
        public Dictionary<string, Block> blocks;

        public ASMFile(string path)
        {
            File = new FileInfo(path);
            Name = File.Name;
            Type = GetType(path);
            blocks = new Dictionary<string, Block>();

            string[] lines = System.IO.File.ReadAllLines(path);
            ParseBlocks(lines);
        }

        public void Add(Block block)
        {
            blocks.Add(block.Name, block);
        }

        public static FileType GetType(string path)
        {
            if (path.Contains("data/pokemon/dex_entries"))
            {
                return FileType.Pokedex;
            }
            else if (path.Contains("data/pokemon/names.asm"))
            {
                return FileType.Pokemon;
            }
            else if (path.Contains("data/moves/names.asm"))
            {
                return FileType.Move;
            }
            else if (path.Contains("data/items/names.asm"))
            {
                return FileType.Item;
            }
            else if (path.Contains("data/types/names.asm")
                || path.Contains("data/types/search_strings.asm")
                )
            {
                return FileType.Type;
            }
            else if (path.Contains("data/maps/landmarks.asm"))
            {
                return FileType.Landmark;
            }
            else if (path.Contains("data/trainers/class_names.asm"))
            {
                return FileType.TrainerClass;
            }
            else if (path.EndsWith("data/battle_tower/trainer_text.asm")
                || path.EndsWith("data/items/descriptions.asm")
                || path.EndsWith("data/moves/descriptions.asm")
                || path.EndsWith("data/text/battle.asm")
                || path.EndsWith("data/text/common_1.asm")
                || path.EndsWith("data/text/common_2.asm")
                || path.EndsWith("data/text/common_3.asm")
                || path.EndsWith("data/text/std_text.asm")
                || path.EndsWith("data/text/unused_sweet_honey.asm")
                || path.Contains("data/phone/text/")
                || path.StartsWith("maps/")
                )
            {
                return FileType.TextBox;
            }

            return FileType.Misc;
        }

        private void ParseBlocks(string[] lines)
        {
            StringBuilder sb = new StringBuilder();
            Block currentBlock = new Block("default", Type);
            for (int i = 0; i < lines.Length; ++i)
            {
                string line = lines[i];
                if (!string.IsNullOrWhiteSpace(line))
                {
                    sb.Clear();
                    bool inQuotes = false;
                    string comment = "";
                    for (int j = 0; j < line.Length; ++j)
                    {
                        if (line[j] == '\"')
                        {
                            inQuotes = !inQuotes;
                        }
                        else if (!inQuotes)
                        {
                            if (line[j] == ';')
                            {
                                comment = line.Substring(j + 1).Trim();
                                break;
                            }
                        }

                        sb.Append(line[j]);
                    }
                    string sanitized = sb.ToString().Trim();

                    if (!string.IsNullOrWhiteSpace(sanitized))
                    {
                        Line newLine = new Line(i, sanitized, comment);
                        if (!sanitized.StartsWith(".") && sanitized.EndsWith(":"))
                        {
                            blocks[currentBlock.Name] = currentBlock;
                            currentBlock = new Block(sanitized, Type);
                        }
                        currentBlock.Add(newLine);
                    }
                }
            }

            blocks[currentBlock.Name] = currentBlock;
        }

        public IEnumerator<Block> GetEnumerator()
        {
            foreach (KeyValuePair<string, Block> pair in blocks)
            {
                yield return pair.Value;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            foreach (KeyValuePair<string, Block> pair in blocks)
            {
                yield return pair.Value;
            }
        }
    }

    // Block.cs
    internal class Block
    {
        public List<Line> lines;
        public FileType Type { get; set; }
        public string Name { get; private set; }

        public Block(string name, FileType type = FileType.Misc)
        {
            lines = new List<Line>();
            Name = name;
            Type = type;
        }

        public Block(string name, Line line, FileType type = FileType.Misc) : this(name, type)
        {
            Name = name;
            lines.Add(line);
        }

        public Block(string name, List<Line> lines, FileType type = FileType.Misc)
        {
            Name = name;
            this.lines = lines;
            Type = type;
        }

        public void Add(Line line)
        {
            lines.Add(line);
        }

        public List<FormattedText> GetFormattedTexts()
        {
            List<FormattedText> formattedTexts = new List<FormattedText>();

            FormattedText text = new FormattedText();
            for (int i = 0; i < lines.Count; i++)
            {
                Line line = lines[i];
                Line nextLine = null;
                if (i < lines.Count - 1)
                {
                    nextLine = lines[i + 1];
                }

                if (line.Text.StartsWith("INCLUDE"))
                {
                    continue;
                }

                switch (Type)
                {
                    case FileType.TextBox:
                    {
                        if (line.Text.StartsWith("text "))
                        {
                            if (line.formattedText != null)
                            {
                                text.Add(line.formattedText.Text);

                                if (TextboxMissingTerminator(line, nextLine))
                                {
                                    line.Error("Error: Line " + (line.Number + 1) + " needs terminator character! " + line.Text + "<--");
                                }
                            }
                        }
                        else if (line.Text.StartsWith("line ") || line.Text.StartsWith("para ") || line.Text.StartsWith("cont ") || line.Text.StartsWith("text_low") || line.Text.StartsWith("next "))
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = new FormattedText();
                            }
                            if (line.formattedText != null)
                            {
                                text.Add(line.formattedText.Text);

                                if (TextboxMissingTerminator(line, nextLine))
                                {
                                    line.Error("Error: Line " + (line.Number + 1) + " needs terminator character! " + line.Text + "<--");
                                }
                            }
                        }
                        else if (line.Text.StartsWith("text_decimal"))
                        {
                            string[] split = line.Text.Split(' ');
                            int length;
                            if (int.TryParse(split[split.Length - 1], out length))
                            {
                                for (int j = 0; j < length; ++j)
                                {
                                    text.Add(((char)('0' + j)).ToString());
                                }
                            }
                        }
                        else if (line.Text.StartsWith("text_ram"))
                        {
                            string[] split = line.Text.Split(' ');
                            if (split.Length > 1)
                            {
                                if (FormattedText.ramLengths.ContainsKey(split[1]))
                                {
                                    for (int j = 0; j < FormattedText.ramLengths[split[1]]; ++j)
                                    {
                                        text.Add(split[1][j % split[1].Length].ToString());
                                    }
                                }
                                else if (line.Comment.Contains("MaxLength "))
                                {
                                    string[] commentWords = line.Comment.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                                    int length = -1;
                                    for (int j = 0; j < commentWords.Length; ++j)
                                    {
                                        if (commentWords[j] == "MaxLength" && j <= commentWords.Length - 2)
                                        {
                                            if (!int.TryParse(commentWords[j + 1], out length))
                                            {
                                                length = -1;
                                                FieldInfo[] fields = typeof(Validator).GetFields(BindingFlags.Public | BindingFlags.Static);
                                                foreach (FieldInfo field in fields)
                                                {
                                                    if (field.Name == commentWords[j + 1])
                                                    {
                                                        length = (int)field.GetValue(null);
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    if (length >= 0)
                                    {
                                        for (int j = 0; j < length; ++j)
                                        {
                                            text.Add(split[1][j % split[1].Length].ToString());
                                        }
                                    }
                                    else
                                    {
                                        text.Add(split[1], true);
                                    }
                                }
                                else
                                {
                                    text.Add(split[1], true);
                                }
                            }
                            else
                            {
                                text.Add(split[1], true);
                            }
                        }
                        else if (line.Text.StartsWith("prompt") || line.Text.StartsWith("done") || line.Text.StartsWith("text_end"))
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = new FormattedText();
                            }
                        }
                        break;
                    }
                    case FileType.Pokedex:
                    {
                        if (line.Text.StartsWith("db ") || line.Text.StartsWith("next ") || line.Text.StartsWith("page "))
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = new FormattedText();
                            }
                            if (line.formattedText != null)
                            {
                                text.Add(line.formattedText.Text);
                            }
                        }
                        break;
                    }
                    case FileType.Move:
                    case FileType.Item:
                    case FileType.TrainerClass:
                    {
                        if (line.Text.StartsWith("li "))
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = new FormattedText();
                            }
                            if (line.formattedText != null)
                            {
                                text.Add(line.formattedText.Text);
                            }
                        }
                        break;
                    }
                    case FileType.Type:
                    case FileType.Landmark:
                    case FileType.Pokemon:
                    {
                        if (line.Text.Contains("db \""))
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = new FormattedText();
                            }
                            if (line.formattedText != null)
                            {
                                text.Add(line.formattedText.Text);
                            }
                        }
                        break;
                    }
                    default:
                    {
                        // Just add every found string
                        if (line.formattedText != null)
                        {
                            text.Add(line.formattedText.Text);
                            formattedTexts.Add(text);
                            text = new FormattedText();
                        }
                        break;
                    }
                }
            }

            if (!string.IsNullOrWhiteSpace(text?.Text))
            {
                formattedTexts.Add(text);
            }

            return formattedTexts;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Name).Append(" {\n");
            foreach (Line line in lines)
            {
                sb.Append('\t').Append(line.Text).Append("\n");
            }
            sb.Append('}');
            return sb.ToString();
        }

        public static bool TextboxMissingTerminator(Line line, Line nextLine)
        {
            if (line == null || nextLine == null)
            {
                return false;
            }

            if (!nextLine.Text.StartsWith("line ") &&
                !nextLine.Text.StartsWith("para ") &&
                !nextLine.Text.StartsWith("cont ") &&
                !nextLine.Text.StartsWith("prompt") &&
                !nextLine.Text.StartsWith("done") &&
                !nextLine.Text.StartsWith("next") &&
                !nextLine.Text.StartsWith("if") &&
                !nextLine.Text.StartsWith("else") &&
                !nextLine.Text.StartsWith("endc") &&
                !line.formattedText.Text.EndsWith("@"))
            {
                return true;
            }

            return false;
        }
    }
	
	// Line.cs
    internal class Line
    {
        public int Number { get; private set; }
        public string Text { get; private set; }
        public string Comment { get; private set; }
        public string ErrorMessage { get; private set; }
        public FormattedText formattedText;

        public Line(int number, string text, string comment = "")
        {
            Number = number;
            Text = text;

            string stringLiteral = GetFormattedText();
            if (stringLiteral != null)
            {
                formattedText = new FormattedText(stringLiteral);
            }
            Comment = comment;
        }

        public string GetFormattedText()
        {
            if (Text.Contains('\"'))
            {
                StringBuilder sb = new StringBuilder();
                bool inQuotes = false;
                for (int j = 0; j < Text.Length; ++j)
                {
                    if (Text[j] == '\"')
                    {
                        inQuotes = !inQuotes;
                        continue;
                    }

                    if (inQuotes)
                    {
                        sb.Append(Text[j]);
                    }
                    else
                    {
                        if (Text[j] == ';')
                        {
                            break;
                        }
                    }
                }

                return sb.ToString();
            }

            return null;
        }

        public void Error(string message)
        {
            ErrorMessage = message;
        }

        public override string ToString()
        {
            return Text;
        }
    }
	
	// FormattedText.cs
    internal class FormattedText
    {
        public static readonly Dictionary<string, int> maxLengths = new Dictionary<string, int>
        {
            { "<NULL>", 0 },
            { "<PLAY_G>", 7 },
            { "<MOBILE>", 1 },
            { "<CR>", 1 },
            { "<BSP>", 1 },
            { "<LF>", 1 },
            { "<POKE>", 2 },
            { "<WBR>", 0 },
            { "<RED>", 3 },
            { "<GREEN>", 5 },
            { "<ENEMY>", 17 }, // Composed of "Trainer Class + Name"
            { "<MOM>", 3 },
            { "<PKMN>", 2 },
            { "<_CONT>", 0 },
            { "<SCROLL>", 0 },
            { "<NEXT>", 0 },
            { "<LINE>", 0 },
            { "@", 0 },
            { "<PARA>", 0 },
            { "<PLAYER>", 7 },
            { "<RIVAL>", 7 },
            { "#", 4 },
            { "<CONT>", 0 },
            { "<……>", 2 },
            { "<DONE>", 0 },
            { "<PROMPT>", 0 },
            { "<TARGET>", 17 }, // Can be "Enemy Pokemon"
            { "<USER>", 17 }, // Can be "Enemy Pokemon"
            { "<PC>", 2 },
            { "<TM>", 2 },
            { "<TRAINER>" , 7 },
            { "<ROCKET>", 6 },
            { "<DEXEND>", 0 },
            { "<BOLD_A>", 1 },
            { "<BOLD_B>", 1 },
            { "<BOLD_C>", 1 },
            { "<BOLD_D>", 1 },
            { "<BOLD_E>", 1 },
            { "<BOLD_F>", 1 },
            { "<BOLD_G>", 1 },
            { "<BOLD_H>", 1 },
            { "<BOLD_I>", 1 },
            { "<BOLD_V>", 1 },
            { "<BOLD_S>", 1 },
            { "<BOLD_L>", 1 },
            { "<BOLD_M>", 1 },
            { "<COLON>", 1 },
            { "<PO>", 1 },
            { "<KE>", 1 },
            { "<LV>", 1 },
            { "<DO>", 1 },
            { "<ID>", 1 },
            { "'d", 1 },
            { "'l", 1 },
            { "'m", 1 },
            { "'r", 1 },
            { "'s", 1 },
            { "'t", 1 },
            { "'v", 1 },
            { "{d:NUM_TMS}", 2 },
            { "{d:BLUE_CARD_POINT_CAP}", 2 },
            { "{d:BUG_CONTEST_BALLS}", 2 },
            { "{d:BUG_CONTEST_MINUTES}", 2 },
            { "{d:ROUTE39FARMHOUSE_MILK_PRICE}", 3 },
            { "{d:ROUTE43GATE_TOLL}", 4 },
            { "{d:NUM_UNOWN}", 2 },
        };
        public static readonly Dictionary<string, int> ramLengths = new Dictionary<string, int>
        {
            { "wSeerCaughtLevelString", 3 },

            { "wPlayerTrademonSenderName", Validator.MaxPlayerNameLength },
            { "wOTTrademonSenderName", Validator.MaxPlayerNameLength },
            { "wPlayerName", Validator.MaxPlayerNameLength },
            { "wMysteryGiftPartnerName", Validator.MaxPlayerNameLength },
            { "wMysteryGiftPlayerName", Validator.MaxPlayerNameLength },
            { "wMysteryGiftCardHolderName", Validator.MaxPlayerNameLength },
            { "wMagikarpRecordHoldersName", Validator.MaxPlayerNameLength },
            { "wSeerOT", Validator.MaxPlayerNameLength },
            { "wMobileParticipant1Nickname", Validator.MaxPlayerNameLength },
            { "wMobileParticipant2Nickname", Validator.MaxPlayerNameLength },
            { "wMobileParticipant3Nickname", Validator.MaxPlayerNameLength },
            { "wSeerTimeOfDay", 7 },

            { "wBugContestWinnerName", Validator.MaxTrainerNameLength },

            { "wEnemyMonNickname", Validator.MaxPokemonNameLength },
            { "wBattleMonNickname", Validator.MaxPokemonNameLength },
            { "wPlayerTrademonSpeciesName", Validator.MaxPokemonNameLength },
            { "wOTTrademonSpeciesName", Validator.MaxPokemonNameLength },
            { "wBreedMon2Nickname", Validator.MaxPokemonNameLength },
            { "wBreedMon1Nickname", Validator.MaxPokemonNameLength },
            { "wBufferTrademonNickname", Validator.MaxPokemonNameLength },
            { "wSeerNickname", Validator.MaxPokemonNameLength },

            { "wSeerCaughtLocation", Validator.MaxLandmarkLength },
        };

        public static char Terminator = '@';

        /// <summary>
        /// Raw text.
        /// </summary>
        public string Text { get; private set; }
        /// <summary>
        /// The remaining text after the formatted strings are stripped out.
        /// </summary>
        public string Unformatted { get; private set; }
        /// <summary>
        /// Length of text, including maximum lengths of formatted parts.
        /// </summary>
        public int Length { get; private set; }
        /// <summary>
        /// Can length of text be reliably determined?
        /// </summary>
        public bool LengthUnknown { get; private set; }
        /// <summary>
        /// Does the text have an '@' terminator?
        /// </summary>
        public bool IsTerminated { get; private set; }

        public FormattedText()
        {
            Text = string.Empty;
            Unformatted = string.Empty;
        }

        public FormattedText(string text, bool lengthUnknown = false)
        {
            Add(text);
            LengthUnknown = lengthUnknown;
        }

        public void Add(string text, bool lengthUnknown = false)
        {
            Text += text;

            foreach (KeyValuePair<string, int> pair in maxLengths)
            {
                if (text.Contains(pair.Key))
                {
                    Length += pair.Value;
                    text = text.Replace(pair.Key, string.Empty);
                }
            }

            Length += text.Length;
            Unformatted = text;
            LengthUnknown |= lengthUnknown;
            IsTerminated = Text.EndsWith("@");
        }

        public override string ToString()
        {
            return Text;
        }
    }
	
	// Validator.cs
    internal class Validator
    {
        public const int MaxTextboxLength = 18;
        public const int MaxPlayerNameLength = 7;
        public const int MaxTrainerNameLength = 10; // "ANN & ANNE"
        public const int MaxTrainerClassNameLength = 13; // "POKéMON PROF."
        public const int MaxPokemonNameLength = 10;
        public const int MaxMoveNameLength = 12;
        public const int MaxItemNameLength = 12;
        public const int MaxTypeNameLength = 8;
        public const int MaxStatNameLength = 8;
        public const int MaxBagPocketNameLength = 11;
        public const int MaxDecorationNameLength = 17;

        public const int MaxPokedexLength = 18;
        public const int MaxSpeciesNameLength = 11;

        public const int MaxLandmarkLineLength = 11;
        public const int MaxLandmarkLength = 17;

        public const string PrintableChars = "“”·… ′″ABCDEFGHIJKLMNOPQRSTUVWXYZ():;[]abcdefghijklmnopqrstuvwxyzàèùßçÄÖÜäöüëïâôûêîÏË←ÈÉ'-+?!.&é→▷▶▼♂¥×/,♀0123456789";

        private Block _block;

        public Validator(Block block)
        {
            _block = block;
        }

        public Validator(List<Line> lines)
        {
            _block = new Block(lines[0].Text, lines);
        }

        public string Validate()
        {
            StringBuilder sb = new StringBuilder();
            int maxLength = -1;
            bool mustTerminate = false;
            switch (_block.Type)
            {
                case FileType.TextBox:
                {
                    maxLength = MaxTextboxLength;
                    break;
                }
                case FileType.Pokedex:
                {
                    maxLength = MaxPokedexLength;
                    break;
                }
                case FileType.Item:
                {
                    maxLength = MaxItemNameLength;
                    break;
                }
                case FileType.Pokemon:
                {
                    maxLength = MaxPokemonNameLength;
                    break;
                }
                case FileType.Move:
                {
                    maxLength = MaxMoveNameLength;
                    break;
                }
                case FileType.Type:
                {
                    mustTerminate = true;
                    maxLength = MaxTypeNameLength;
                    break;
                }
                case FileType.Landmark:
                {
                    mustTerminate = true;
                    maxLength = MaxLandmarkLength;
                    break;
                }
                case FileType.TrainerClass:
                {
                    maxLength = MaxTrainerClassNameLength;
                    break;
                }
            }

            List<FormattedText> text = _block.GetFormattedTexts();
            for (int i = 0; i < text.Count; ++i)
            {
                FormattedText formattedText = text[i];
                if (string.IsNullOrWhiteSpace(formattedText?.Text) || formattedText.Text.StartsWith("INCLUDE"))
                {
                    continue;
                }

                foreach (char c in formattedText.Unformatted)
                {
                    if (!PrintableChars.Contains(c.ToString()))
                    {
                        sb.Append(GetUnmappedCharErrorMessage(formattedText, c));
                    }
                }

                if (_block.Type == FileType.Pokedex)
                {
                    if (i == 0)
                    {
                        // First string is species name
                        string message = GetLengthValidationMessage(formattedText, MaxSpeciesNameLength);
                        if (!string.IsNullOrEmpty(message))
                        {
                            sb.Append(message);
                        }
                        if (!formattedText.Text.EndsWith(FormattedText.Terminator.ToString()))
                        {
                            sb.Append(GetTerminatorErrorMessage(formattedText));
                        }
                    }
                    else
                    {
                        if (i == text.Count - 1)
                        {
                            // last string is last line of entry
                            if (!formattedText.Text.EndsWith(FormattedText.Terminator.ToString()))
                            {
                                sb.Append(GetTerminatorErrorMessage(formattedText));
                            }
                        }
                        string message = GetLengthValidationMessage(formattedText, maxLength);
                        if (!string.IsNullOrEmpty(message))
                        {
                            sb.Append(message);
                        }
                    }
                }
                else if (_block.Type == FileType.Pokemon)
                {
                    if (formattedText.Text.Length != MaxPokemonNameLength)
                    {
                        sb.Append(GetLengthExactlyErrorMessage(formattedText, MaxPokemonNameLength));
                    }
                }
                else if (_block.Type != FileType.Misc)
                {
                    string message = GetLengthValidationMessage(formattedText, maxLength);
                    if (!string.IsNullOrEmpty(message))
                    {
                        sb.Append(message);
                    }
                }

                if (mustTerminate)
                {
                    if (!formattedText.Text.EndsWith(FormattedText.Terminator.ToString()))
                    {
                        sb.Append(GetTerminatorErrorMessage(formattedText));
                    }
                }

                if (_block.Type == FileType.Landmark)
                {
                    string message = GetLandmarkLineValidationMessage(formattedText, MaxLandmarkLineLength);
                    if (!string.IsNullOrWhiteSpace(message))
                    {
                        sb.Append(message);
                    }
                }
            }

            foreach (Line line in _block.lines)
            {
                if (line.ErrorMessage != null)
                {
                    sb.Append('\t').Append(line.ErrorMessage).Append('\n');
                }
            }

            return sb.Length > 0 ? sb.ToString() : null;
        }

        private string GetLengthValidationMessage(FormattedText formattedText, int maxLength)
        {
            StringBuilder sb = new StringBuilder();

            // Length validation
            if (formattedText.LengthUnknown)
            {
                sb.Append(GetCannotGetLengthMessage(formattedText));
            }
            else if (maxLength > 0 && formattedText.Length > maxLength)
            {
                sb.Append(GetLengthErrorMessage(formattedText, maxLength));
            }

            return sb.Length > 0 ? sb.ToString() : null;
        }

        private string GetCannotGetLengthMessage(FormattedText formattedText)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tWarning: Cannot determine length of \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" automatically. Please add MaxLength annotation.\n").ToString();
        }

        private string GetLengthErrorMessage(FormattedText formattedText, int maxLength)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" may be ").Append(formattedText.Length).Append(" chars! Text can be at most ").Append(maxLength).Append(" characters long.\n").ToString();
        }

        private string GetLandmarkLineValidationMessage(FormattedText formattedText, int maxLength)
        {
            int indexOfFirstBSP = formattedText.Text.IndexOf("<BSP>");

            if (indexOfFirstBSP > maxLength || (formattedText.Length - indexOfFirstBSP - 1) > maxLength)
            {
                StringBuilder sb = new StringBuilder();
                return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" has a line too long for a landmark name. Lines can be at most ").Append(maxLength).Append(" characters long. Consider using a <BSP>.\n").ToString();
            }
            return null;
        }

        private string GetTerminatorErrorMessage(FormattedText formattedText)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" is missing a terminator! Add @ to the end of the string.\n").ToString();
        }

        private string GetLengthExactlyErrorMessage(FormattedText formattedText, int length)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" must be exactly ").Append(length).Append(" chars long.\n").ToString();
        }

        private string GetUnmappedCharErrorMessage(FormattedText formattedText, char unmapped)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" contains unmapped character \'").Append(unmapped).Append("\'.\n").ToString();
        }

    }
}