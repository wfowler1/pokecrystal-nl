using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using System.Linq;

namespace PokeGen2TextValidator
{
    internal class PokeGen2TextValidator
    {
        // Program.cs
        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                PrintHelpText();
                return 0;
            }

            bool validate = true;
            bool compare = false;
            bool merge = false;
            bool silent = false;

            int currentArg = 0;
            bool stop = false;
            for (currentArg = 0; currentArg < args.Length; )
            {
                if (!args[currentArg].ToLowerInvariant().StartsWith("-"))
                {
                    break;
                }

                switch (args[currentArg])
                {
                    case "-s":
                    case "--silent":
                    {
                        silent = true;
                        break;
                    }
                    case "-v":
                    case "--validate":
                    {
                        validate = true;
                        compare = false;
                        merge = false;
                        stop = true;
                        break;
                    }
                    case "-vt":
                    case "--validatetrainers":
                    {
                        string path = ".";
                        if (args.Length > 1)
                        {
                            path = args[currentArg + 1];
                        }

                        StringBuilder sb = new StringBuilder();
                        ASMFile classesFile = new ASMFile(Path.Combine(path, "data/trainers/class_names.asm"));
                        ASMFile trainersFile = new ASMFile(Path.Combine(path, "data/trainers/parties.asm"));
                        sb.Append("Validating trainer classes and names\n");
                        TrainerDataValidator validator = new TrainerDataValidator(classesFile, trainersFile);
                        string message = validator.Validate();
                        bool problem = false;
                        if (!string.IsNullOrWhiteSpace(message))
                        {
                            if (message.Contains("Error"))
                            {
                                problem = true;
                            }
                            sb.Append(message);
                        }

                        sb.Append("Result: " + (problem ? "Failed!\n" : "Passed!\n"));
                        if (!silent || problem)
                        {
                            Console.WriteLine(sb.ToString());
                        }

                        problem |= Validate(classesFile, silent);
                        problem |= Validate(trainersFile, silent);

                        return problem ? 1 : 0;
                    }
                    case "-c":
                    case "--compare":
                    {
                        validate = false;
                        compare = true;
                        merge = false;
                        stop = true;
                        break;
                    }
                    case "-m":
                    case "--merge":
                    {
                        validate = false;
                        compare = false;
                        merge = true;
                        stop = true;
                        break;
                    }
                    default:
                    {
                        Console.WriteLine("Unknown option: " + args[currentArg]);
                        PrintHelpText();
                        return 1;
                    }
                }

                ++currentArg;
                if (stop)
                {
                    break;
                }
            }

            ASMFile source = GetASMFile(args[currentArg++]);
            if (source == null || source.Type == FileType.Ignore)
            {
                return 0;
            }

            if (validate)
            {
                return Validate(source, silent) ? 1 : 0;
            }
            else if (compare || merge)
            {
                ASMFile target = GetASMFile(args[currentArg++]);

                if (compare)
                {
                    Comparer comparer = new Comparer(source, target);
                    Console.WriteLine(comparer.Compare());
                }
                else if (merge)
                {
                    ASMFile baseSource = GetASMFile(args[currentArg++]);
                    ASMFile baseTarget = GetASMFile(args[currentArg++]);

                    if (source != null && baseSource != null && baseTarget != null)
                    {
                        Merger merger = new Merger(source, target, baseSource, baseTarget);
                        Console.WriteLine(merger.Merge());
                        File.WriteAllText(target.File.FullName, target.ToString());
                    }
                }
            }

            return 0;
        }

        private static void PrintHelpText()
        {
            Console.WriteLine("Usage: PokeGen2TextValidator [-vcm] Source [Target] [BaseSource] [BaseTarget]");
            Console.WriteLine("  Options:");
            Console.WriteLine("    -v, --validate:          Validate Source. Default behavior.");
            Console.WriteLine("    -vt, --ValidateTrainers: Validates trainer names to ensure they are not too long.");
            Console.WriteLine("    -c, --compare:           Compare Source to Target.");
            Console.WriteLine("    -m, --merge:             Compare BaseSource to BaseTarget, then merge matching blocks from Source into Target.");
            Console.WriteLine("    -s, --silent:            Validator silent mode. Only prints a message if a check failed (error or warning).");
            Console.WriteLine("  Source: Primary file to operate on.");
            Console.WriteLine("  Target: Target file to compare to Source. Required for compares and merges.");
            Console.WriteLine("  BaseSource: Original version of Source to compare to BaseTarget to see if merge from Source to Target should occur.");
            Console.WriteLine("  BaseTarget: Original version of Target to compare to BaseSource to see if merge from Source to Target should occur.");
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

        private static bool Validate(ASMFile asmFile, bool silent)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Validating file: " + asmFile.File.Name + " Type: " + asmFile.Type + " Source: " + asmFile.Source + "\n");

            bool problem = false;
            foreach (KeyValuePair<string, Block> pair in asmFile.blocks)
            {
                Validator validator = new Validator(pair.Value);
                string message = validator.Validate();
                if (!string.IsNullOrWhiteSpace(message))
                {
                    if (message.Contains("Error"))
                    {
                        problem = true;
                    }
                    sb.Append(message);
                }
            }

            sb.Append("Result: " + (problem ? "Failed!\n" : "Passed!\n"));
            if (!silent || problem)
            {
                Console.WriteLine(sb.ToString());
            }
            return problem;
        }
    }

    // ASMFile.cs
    public enum FileType
    {
        /// <summary> Invalid file, skip it. Generally these are files still containing unused Japanese text. </summary>
        Ignore = -1,
        /// <summary> Unknown or miscellaneous data. No string validation will be available. </summary>
        Misc = 0,
        /// <summary> Text for a textbox. Limit 18 chars per line of text. </summary>
        TextBox = 1,
        /// <summary> Pokédex entry. </summary>
        Pokedex = 2,
        /// <summary> Pokémon names. </summary>
        Pokemon = 3,
        /// <summary> Move names. </summary>
        Move = 4,
        /// <summary> Item names. </summary>
        Item = 5,
        /// <summary> Type names. </summary>
        Type = 6,
        /// <summary> Map landmarks. Town, route, dungeon names. </summary>
        Landmark = 7,
        /// <summary> Trainer class names. </summary>
        TrainerClass = 8,
        /// <summary> Trainer names. </summary>
        TrainerParty = 9,
        /// <summary> Text input </summary>
        Keyboard = 10,
    }

    public enum Source
    {
        Unknown = -1,
        RedBlue = 0,
        Yellow = 1,
        GoldSilver = 2,
        Crystal = 3
    }

    internal class ASMFile : IEnumerable<Block>
    {

        public string Name { get; private set; }
        public FileInfo File { get; private set; }
        public FileType Type { get; private set; }
        public Source Source { get; private set; }
        public Dictionary<string, Block> blocks;

        public ASMFile(string path)
        {
            File = new FileInfo(path);
            Name = File.Name;

            Source = Source.Unknown;
            if (File.FullName.Contains("pokered"))
            {
                Source = Source.RedBlue;
            }
            else if (File.FullName.Contains("pokeyellow"))
            {
                Source = Source.Yellow;
            }
            else if (File.FullName.Contains("pokegold"))
            {
                Source = Source.GoldSilver;
            }
            else if (File.FullName.Contains("pokecrystal"))
            {
                Source = Source.Crystal;
            }

            Type = GetType(File);
            blocks = new Dictionary<string, Block>();

            string[] lines = System.IO.File.ReadAllLines(path);
            ParseBlocks(lines);
        }

        public void Add(Block block)
        {
            blocks.Add(block.Name, block);
        }

        public FileType GetType(FileInfo fileInfo)
        {
            string path = fileInfo.FullName;
            path = path.Replace('\\', '/');

            if (path.Contains("data/pokemon/dex_entries/") ||
                path.EndsWith("data/pokemon/dex_text.asm"))
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
            else if (path.Contains("data/types/names.asm") ||
                path.Contains("data/types/search_strings.asm"))
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
            else if (path.EndsWith("data/battle_tower/trainer_text.asm") ||
                path.EndsWith("data/items/descriptions.asm") ||
                path.EndsWith("data/moves/descriptions.asm") ||
                path.EndsWith("data/text/battle.asm") ||
                path.EndsWith("data/text/common_1.asm") ||
                path.EndsWith("data/text/common_2.asm") ||
                path.EndsWith("data/text/common_3.asm") ||
                path.EndsWith("data/text/std_text.asm") ||
                path.EndsWith("data/text/unused_sweet_honey.asm") ||
                path.Contains("data/phone/text/") ||
                path.EndsWith("maps/" + fileInfo.Name) ||
                path.Contains("data/text/text_") ||
                path.Contains("data/battle_tower/trainer_text.asm") ||
                (Source <= Source.Yellow && path.Contains("text/")))
            {
                return FileType.TextBox;
            }
            else if (path.EndsWith("data/trainers/parties.asm"))
            {
                return FileType.TrainerParty;
            }
            else if (path.EndsWith("data/text/name_input_chars.asm") ||
                path.EndsWith("data/text/mail_input_chars.asm"))
            {
                return FileType.Keyboard;
            }
            else if (path.Contains("mobile/") ||
                path.Contains("macros/") ||
                path.Contains("asserts.asm") ||
                path.Contains("charmap.asm") ||
                path.Contains("debug_room.asm") ||
                path.Contains("unused"))
            {
                return FileType.Ignore;
            }

            return FileType.Misc;
        }

        private void ParseBlocks(string[] lines)
        {
            Block currentBlock = new Block("default", Type, Source);
            for (int i = 0; i < lines.Length; ++i)
            {
                Line line = new Line(i, lines[i]);

                if (!string.IsNullOrWhiteSpace(lines[i]))
                {
                    if (!line.Text.StartsWith(".") && line.Text.EndsWith(":"))
                    {
                        blocks[currentBlock.Name] = currentBlock;
                        currentBlock = new Block(line.Text, Type, Source);
                    }
                }
                currentBlock.Add(line);
            }

            blocks[currentBlock.Name] = currentBlock;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            foreach (Block block in blocks.Values)
            {
                foreach (Line line in block.lines)
                {
                    sb.Append(line.Raw).Append('\n');
                }
            }

            return sb.ToString();
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
        public Source Source { get; set; }
        public string Name { get; private set; }

        /// <summary>
        /// Finds unconditional replacement annotations and returns the name of the source block to use.
        /// </summary>
        /// <returns>Name of block in source to use. <c>null</c> if unspecified.</returns>
        public string ReplaceWith
        {
            get
            {
                string comment = lines[0].Comment;
                if (string.IsNullOrEmpty(comment))
                {
                    return null;
                }
                if (AlwaysReplace)
                {
                    return Name;
                }

                string[] commentTokens = comment.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < commentTokens.Length; ++i)
                {
                    if (commentTokens[i].ToLower() == "replacewith" && commentTokens.Length > i + 1)
                    {
                        return commentTokens[i + 1];
                    }
                }

                return null;
            }
        }

        /// <summary>
        /// Finds unconditional replacement annotation for a block with the same name.
        /// </summary>
        /// <returns>Whether this block is always annotated to be replaced.</returns>
        public bool AlwaysReplace
        {
            get
            {
                string comment = lines[0].Comment;
                if (string.IsNullOrEmpty(comment))
                {
                    return false;
                }

                string[] commentTokens = comment.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string commentToken in commentTokens)
                {
                    if (commentToken.ToLower() == "alwaysreplace")
                    {
                        return true;
                    }
                }

                return false;
            }
        }

        public Block(string name, FileType type = FileType.Misc, Source source = Source.Unknown)
        {
            lines = new List<Line>();
            Name = name;
            Type = type;
            Source = source;
        }

        public Block(string name, Line line, FileType type = FileType.Misc, Source source = Source.Unknown) : this(name, type, source)
        {
            Name = name;
            lines.Add(line);
        }

        public Block(string name, List<Line> lines, FileType type = FileType.Misc, Source source = Source.Unknown)
        {
            Name = name;
            this.lines = lines;
            Type = type;
            Source = source;
        }

        public void Add(Line line)
        {
            lines.Add(line);
        }

        public List<FormattedText> GetFormattedTexts()
        {
            List<FormattedText> formattedTexts = new List<FormattedText>();

            FormattedText text = null;
            for (int i = 0; i < lines.Count; i++)
            {
                Line line = lines[i];

                if ((line.Text.Contains("INCLUDE") || line.Text.Contains("INCBIN")) && line.Text.Contains("/"))
                {
                    continue;
                }
                if (line.Text.StartsWith("assert ") ||
                    line.Text.StartsWith("vc_assert ") ||
                    line.Text.StartsWith("fail") ||
                    line.Text.StartsWith("DEF ") ||
                    line.Text.StartsWith("SECTION ") ||
                    line.Text.StartsWith("REDEF ") ||
                    line.Text.StartsWith("MACRO ") ||
                    line.Text.StartsWith("charmap ") ||
                    line.Text.StartsWith("ENDM") ||
                    line.Text.StartsWith("if ") ||
                    line.Text.StartsWith("IF ") ||
                    line.Text.StartsWith("elif "))
                {
                    continue;
                }

                switch (Type)
                {
                    case FileType.TextBox:
                    {
                        string lineStrings = line.GetStrings();

                        if (line.Text.StartsWith("text "))
                        {
                            if (!string.IsNullOrWhiteSpace(lineStrings))
                            {
                                if (text == null)
                                {
                                    text = new FormattedText(line);
                                }
                                else
                                {
                                    text.Add(lineStrings);
                                }
                            }
                        }
                        else if (line.Text.StartsWith("line ") || line.Text.StartsWith("para ") || line.Text.StartsWith("cont ") || line.Text.StartsWith("text_low") || line.Text.StartsWith("next ") || line.Text.StartsWith("db "))
                        {
                            if (text != null)
                            {
                                formattedTexts.Add(text);
                                text = null;
                            }

                            if (!string.IsNullOrWhiteSpace(lineStrings) || line.Text.StartsWith("text_low"))
                            {
                                text = new FormattedText(line);
                            }
                        }
                        else if (line.Text.StartsWith("text_decimal"))
                        {
                            string[] split = line.Text.Split(' ');
                            int length;
                            if (int.TryParse(split[split.Length - 1], out length))
                            {
                                StringBuilder sb = new StringBuilder();
                                for (int j = 0; j < length; ++j)
                                {
                                    sb.Append(((char)('0' + j)).ToString());
                                }
                                if (sb.Length > 0)
                                {
                                    if (text == null)
                                    {
                                        text = new FormattedText(line.Number, "text", sb.ToString());
                                    }
                                    else
                                    {
                                        text.Add(sb.ToString());
                                    }
                                }
                            }
                        }
                        else if (line.Text.StartsWith("text_ram"))
                        {
                            string[] split = line.Text.Split(' ');

                            if (split.Length > 1)
                            {
                                StringBuilder sb = new StringBuilder();
                                bool lengthUnknown = false;

                                if (FormattedText.ramLengths.ContainsKey(split[1]))
                                {
                                    for (int j = 0; j < FormattedText.ramLengths[split[1]]; ++j)
                                    {
                                        sb.Append(split[1][j % split[1].Length].ToString());
                                    }
                                }
                                else if (line.Comment.Contains("MaxLength "))
                                {
                                    int length = line.MaxLength;
                                    if (length >= 0)
                                    {
                                        for (int j = 0; j < length; ++j)
                                        {
                                            sb.Append(split[1][j % split[1].Length].ToString());
                                        }
                                    }
                                    else
                                    {
                                        lengthUnknown = true;
                                        sb.Append(split[1]);
                                    }
                                }
                                else
                                {
                                    lengthUnknown = true;
                                    sb.Append(split[1]);
                                }

                                if (sb.Length > 0)
                                {
                                    if (text == null)
                                    {
                                        text = new FormattedText(line.Number, "text", sb.ToString(), lengthUnknown);
                                    }
                                    else
                                    {
                                        text.Add(sb.ToString(), lengthUnknown);
                                    }
                                }
                            }
                        }
                        else if (line.Text == "prompt" || line.Text == "done" || line.Text == "text_end")
                        {
                            if (!string.IsNullOrWhiteSpace(text?.Text))
                            {
                                formattedTexts.Add(text);
                                text = null;
                            }
                        }
                        break;
                    }
                    case FileType.Pokedex:
                    {
                        if (line.Text.StartsWith("db ") || line.Text.StartsWith("next ") || line.Text.StartsWith("page "))
                        {
                            if (text != null)
                            {
                                formattedTexts.Add(text);
                                text = null;
                            }

                            string lineStrings = line.GetStrings();

                            if (!string.IsNullOrWhiteSpace(lineStrings))
                            {
                                text = new FormattedText(line);
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
                            if (text != null)
                            {
                                formattedTexts.Add(text);
                                text = null;
                            }

                            string lineStrings = line.GetStrings();

                            if (!string.IsNullOrWhiteSpace(lineStrings))
                            {
                                text = new FormattedText(line);
                            }
                        }
                        break;
                    }
                    case FileType.Type:
                    case FileType.Landmark:
                    case FileType.Pokemon:
                    case FileType.TrainerParty:
                    {
                        if (line.Text.Contains("db \""))
                        {
                            if (text != null)
                            {
                                formattedTexts.Add(text);
                                text = null;
                            }

                            string lineStrings = line.GetStrings();

                            if (!string.IsNullOrWhiteSpace(lineStrings))
                            {
                                text = new FormattedText(line);
                            }
                        }
                        break;
                    }
                    default:
                    {
                        string lineStrings = line.GetStrings();

                        // Just add every found string
                        if (!string.IsNullOrWhiteSpace(lineStrings))
                        {
                            if (text != null)
                            {
                                formattedTexts.Add(text);
                            }
                            text = new FormattedText(line);
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

        /// <summary>
        /// Gets a List of strings in the <see cref="Line"/>s in this <see cref="Block"/>, with whitespace trimmed,
        /// with no comments and excluding empty strings.
        /// </summary>
        /// <returns>The list of strings.</returns>
        public List<string> GetLinesSanitized()
        {
            List<string> strings = new List<string>(lines.Count);
            foreach (Line line in lines)
            {
                string sanitized = line.Text.Trim();
                if (sanitized.Length > 0)
                {
                    strings.Add(sanitized);
                }
            }
            return strings;
        }
    }
    
    // Line.cs
    /// <summary> Class representing one line of code from an <see cref="ASMFile"/>. </summary>
    internal class Line
    {
        /// <summary> Line number in the file. </summary>
        public int Number { get; private set; }
        /// <inheritdoc cref="Raw"/>
        private string _raw;
        /// <summary> The raw text from this line with no preprocessing. </summary>
        public string Raw
        {
            get
            {
                return _raw;
            }
            set
            {
                _raw = value;
                StringBuilder sb = new StringBuilder();
                bool inQuotes = false;
                string comment = "";

                for (int j = 0; j < value.Length; ++j)
                {
                    if (value[j] == '\"')
                    {
                        inQuotes = !inQuotes;
                    }
                    else if (!inQuotes)
                    {
                        if (value[j] == ';')
                        {
                            comment = value.Substring(j + 1).Trim();
                            break;
                        }
                    }

                    sb.Append(value[j]);
                }

                Text = sb.ToString().Trim();
                Comment = comment;
            }
        }
        /// <summary> All text from the line, except the comment. </summary>
        public string Text { get; private set; }
        /// <summary> The comment from the line. </summary>
        public string Comment { get; private set; }

        /// <summary>
        /// Gives the annotated MaxLength of the line if provided.
        /// </summary>
        /// <returns>Annotated maximum possible length of the line. <c>-1</c> if unspecified.</returns>
        public int MaxLength
        {
            get
            {
                if (string.IsNullOrEmpty(Comment))
                {
                    return -1;
                }

                string[] commentTokens = Comment.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                int length = -1;
                for (int j = 0; j < commentTokens.Length; ++j)
                {
                    if (commentTokens[j] == "MaxLength" && j <= commentTokens.Length - 2)
                    {
                        if (!int.TryParse(commentTokens[j + 1], out length))
                        {
                            FieldInfo[] fields = typeof(Validator).GetFields(BindingFlags.Public | BindingFlags.Static);
                            foreach (FieldInfo field in fields)
                            {
                                if (field.Name == commentTokens[j + 1])
                                {
                                    length = (int)field.GetValue(null);
                                    break;
                                }
                            }
                        }
                    }
                }

                return length;
            }
        }

        /// <inheritdoc cref="Line(int, string, string)"/>
        /// <param name="text">All text from the line.</param>
        public Line(int number, string text)
        {
            Number = number;
            Raw = text;
        }

        /// <summary>
        /// Constructs a new <see cref="Line"/> object using the supplied data.
        /// </summary>
        /// <param name="number">Line number in the file.</param>
        /// <param name="code">The code in the line (without comments).</param>
        /// <param name="comment">The comment in the line.</param>
        public Line(int number, string code, string comment)
        {
            Number = number;
            Raw = code + " ; " + comment;
        }

        /// <summary>
        /// Gets all strings within quote marks on this line.
        /// </summary>
        /// <returns>All strings within quote marks on this line.</returns>
        public string GetStrings()
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

        public override string ToString()
        {
            return Text;
        }
    }
    
    // FormattedText.cs
    /// <summary> Class to represent one line of ingame text, even if strings are concatenated on multiple lines of code (with text_ram for example). </summary>
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
            { "<TARGET>", 17 }, // Can be "Enemy <Pokemon>"
            { "<USER>", 17 }, // Can be "Enemy <Pokemon>"
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
            { "<PK>", 1 },
            { "<MN>", 1 },
            { "<LV>", 1 },
            { "<DO>", 1 },
            { "<DOT>", 1 },
            { "<ID>", 1 },
            { "'d", 1 },
            { "'l", 1 },
            { "'m", 1 },
            { "'r", 1 },
            { "'s", 1 },
            { "'t", 1 },
            { "'v", 1 },
            { "'n", 1 },
            { "{d:NUM_TMS}", 2 },
            { "{d:BLUE_CARD_POINT_CAP}", 2 },
            { "{d:BUG_CONTEST_BALLS}", 2 },
            { "{d:BUG_CONTEST_MINUTES}", 2 },
            { "{d:ROUTE39FARMHOUSE_MILK_PRICE}", 3 },
            { "{d:ROUTE43GATE_TOLL}", 4 },
            { "{d:NUM_UNOWN}", 2 },
            { "{d:CELADONDEPTSTORE6F_FRESH_WATER_PRICE}", 3 },
            { "{d:CELADONDEPTSTORE6F_SODA_POP_PRICE}", 3 },
            { "{d:CELADONDEPTSTORE6F_LEMONADE_PRICE}", 3 },
            { "{d:CELADONGAMECORNERPRIZEROOM_TM32_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_TM29_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_TM15_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_PORYGON_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_MR_MIME_COINS}", 4 },
            { "{d:CELADONGAMECORNERPRIZEROOM_EEVEE_COINS}", 4 },
            { "{d:GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE}", 3 },
            { "{d:GOLDENRODDEPTSTORE6F_SODA_POP_PRICE}", 3 },
            { "{d:GOLDENRODDEPTSTORE6F_LEMONADE_PRICE}", 3 },
            { "{UNOWNWORD_{d:x}}", 7 },
            { "{d:MONS_PER_BOX}", 2 },
            { "<JP_18>", 2 },
            { "<JP_14>", 2 },
            { "<NI>", 2 },
            { "<TTE>", 2 },
            { "<WO>", 2 },
            { "<TA!>", 2 },
            { "<KOUGEKI>", 4 },
            { "<WA>", 2 },
            { "<NO>", 2 },
            { "<ROUTE>", 6 },
            { "<WATASHI>", 3 },
            { "<KOKO_WA>", 3 },
            { "<GA>", 2 },
        };
        public static readonly Dictionary<string, int> ramLengths = new Dictionary<string, int>
        {
            { "wBoxNumString", 2 },

            { "wSeerCaughtLevelString", 3 },

            { "wLinkEnemyTrainerName", Validator.MaxPlayerNameLength },
            { "wMagikarpRecordHoldersName", Validator.MaxPlayerNameLength },
            { "wMobileParticipant1Nickname", Validator.MaxPlayerNameLength },
            { "wMobileParticipant2Nickname", Validator.MaxPlayerNameLength },
            { "wMobileParticipant3Nickname", Validator.MaxPlayerNameLength },
            { "wMysteryGiftPartnerName", Validator.MaxPlayerNameLength },
            { "wMysteryGiftPlayerName", Validator.MaxPlayerNameLength },
            { "wMysteryGiftCardHolderName", Validator.MaxPlayerNameLength },
            { "wOTTrademonSenderName", Validator.MaxPlayerNameLength },
            { "wPlayerName", Validator.MaxPlayerNameLength },
            { "wPlayerTrademonSenderName", Validator.MaxPlayerNameLength },
            { "wSeerOT", Validator.MaxPlayerNameLength },
            { "wSeerTimeOfDay", 7 },

            { "wGymLeaderName", 8 },

            { "wBugContestWinnerName", Validator.MaxTrainerNameLength },
            { "wTrainerName", Validator.MaxTrainerNameLength },

            { "wBattleMonNick", Validator.MaxPokemonNameLength },
            { "wBattleMonNickname", Validator.MaxPokemonNameLength },
            { "wBreedMon1Nickname", Validator.MaxPokemonNameLength },
            { "wBreedMon2Nickname", Validator.MaxPokemonNameLength },
            { "wBoxMonNicks", Validator.MaxPokemonNameLength },
            { "wBufferTrademonNickname", Validator.MaxPokemonNameLength },
            { "wDayCareMonName", Validator.MaxPokemonNameLength },
            { "wEnemyMonNick", Validator.MaxPokemonNameLength },
            { "wEnemyMonNickname", Validator.MaxPokemonNameLength },
            { "wInGameTradeGiveMonName", Validator.MaxPokemonNameLength },
            { "wInGameTradeReceiveMonName", Validator.MaxPokemonNameLength },
            { "wLearnMoveMonName", Validator.MaxPokemonNameLength },
            { "wNameOfPlayerMonToBeTraded", Validator.MaxPokemonNameLength },
            { "wOTTrademonSpeciesName", Validator.MaxPokemonNameLength },
            { "wPlayerTrademonSpeciesName", Validator.MaxPokemonNameLength },
            { "wSeerNickname", Validator.MaxPokemonNameLength },

            { "wOaksAideRewardItemName", Validator.MaxItemNameLength },

            { "wSeerCaughtLocation", Validator.MaxLandmarkLength },
            { "wGymCityName", Validator.MaxLandmarkLength },
        };

        public const char Terminator = '@';

        /// <summary> The instruction starting this formatted text ("text", "db", "para" etc.). </summary>
        public string Instruction { get; private set; }
        /// <summary> The line number starting this formatted text (<see cref="Instruction"/>). </summary>
        public int LineNumber { get; private set; }
        /// <summary> Raw text. </summary>
        public string Text { get; private set; }
        /// <summary> The remaining text after the formatted strings are stripped out. </summary>
        public string Unformatted { get; private set; }
        /// <summary> Length of text, including maximum lengths of formatted parts. </summary>
        public int Length { get; private set; }
        /// <summary> Can length of text be reliably determined? </summary>
        public bool LengthUnknown { get; private set; }
        /// <summary> Does the text have an '@' terminator? </summary>
        public bool IsTerminated { get; private set; }

        public FormattedText(Line line)
        {
            Instruction = "";
            int indexOfSpace = line.Text.IndexOf(' ');
            if (indexOfSpace > 0)
            {
                string instruction = line.Text.Substring(0, indexOfSpace);
                if (!instruction.Contains("\""))
                {
                    Instruction = line.Text.Substring(0, indexOfSpace);
                }
            }
            else
            {
                if (!line.Text.Contains("\""))
                {
                    Instruction = line.Text;
                }
            }
            Add(line.GetStrings());
            LineNumber = line.Number;
        }

        public FormattedText(int lineNumber, string instruction, string text = "", bool lengthUnknown = false)
        {
            Instruction = instruction;
            LineNumber = lineNumber;
            Add(text);
            LengthUnknown = lengthUnknown;
        }

        /// <summary>
        /// Adds <paramref name="text"/> to this formatted text.
        /// </summary>
        /// <param name="text">The text to add.</param>
        /// <param name="lengthUnknown"><c>true</c> if something about this text makes it so length cannot be determined (text_ram with ambiguous length).</param>
        public void Add(string text, bool lengthUnknown = false)
        {
            if (text == null)
            {
                return;
            }

            Text += text;

            foreach (KeyValuePair<string, int> pair in maxLengths)
            {
                int lengthBefore = text.Length;
                text = text.Replace(pair.Key, string.Empty);
                Length += ((lengthBefore - text.Length) / pair.Key.Length) * pair.Value;
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
        public const int MaxRBYTextboxSecondLineLength = 17;
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

        public const string PrintableChars = "“”·… ABCDEFGHIJKLMNOPQRSTUVWXYZ():;[]abcdefghijklmnopqrstuvwxyzàèùßçÄÖÜäöüëïâôûêîÏË←ÈÉ'-+?!.&é→▷▶▼♂¥×/,♀0123456789┌─┐│└─┘◀⁂№▲■☎";

        private Block _block;
        private StringBuilder output;

        public Validator(Block block)
        {
            _block = block;
            output = new StringBuilder();
        }

        public Validator(List<Line> lines)
        {
            _block = new Block(lines[0].Text, lines);
            output = new StringBuilder();
        }

        public string Validate()
        {
            ValidateLines();
            ValidateText();
            return output.Length > 0 ? output.ToString() : null;
        }

        private void ValidateLines()
        {
            List<string> lines = _block.GetLinesSanitized();
            for (int i = 0; i < lines.Count; ++i)
            {
                string line = lines[i];
                string nextLine = null;
                if (lines.Count > i + 1)
                {
                    nextLine = lines[i + 1];
                }

                switch (_block.Type)
                {
                    case FileType.Keyboard:
                    {
                        break;
                    }
                    case FileType.TextBox:
                    {
                        if (!CheckTextboxNextLineValid(line, nextLine))
                        {
                            output.Append(GetInvalidNextLineErrorMessage(line, nextLine));
                        }
                        goto default;
                    }
                    case FileType.Pokedex:
                    {
                        if (CheckPokedexLineNeedsTerminator(line, nextLine) && !lines[i].EndsWith(FormattedText.Terminator.ToString() + "\"") && lines[i].EndsWith("\""))
                        {
                            output.Append(GetTerminatorErrorMessage(line));
                        }
                        if (!CheckPokedexNextLineValid(line, nextLine))
                        {
                            output.Append(GetInvalidNextLineErrorMessage(line, nextLine));
                        }
                        break;
                    }
                    default:
                    {
                        if (CheckTextboxLineNeedsTerminator(line, nextLine) && !lines[i].EndsWith(FormattedText.Terminator.ToString() + "\"") && lines[i].EndsWith("\""))
                        {
                            output.Append(GetTerminatorErrorMessage(line));
                        }
                        break;
                    }
                }
            }
        }

        /// <summary>
        /// Check if next line is a valid line in a textbox. Does not check text flow,
        /// see <see cref="CheckTextboxNextTextFlowValid(int, List{FormattedText})"/>.
        /// Prevents issues like the Coin Case glitch in English Gold/Silver.
        /// </summary>
        /// <param name="line">Line of code.</param>
        /// <param name="nextLine">Next line of code.</param>
        /// <returns><c>true</c> if <paramref name="line"/> can legally be followed by <paramref name="nextLine"/> in a textbox.</returns>
        private static bool CheckTextboxNextLineValid(string line, string nextLine)
        {
            line = line.ToLower();

            // Last line. Ensure valid way to end a block.
            if (nextLine == null)
            {
                if (line == "text_end")
                {
                    return true;
                }

                if (line.StartsWith("line ") ||
                    line.StartsWith("para ") ||
                    line.StartsWith("cont ") ||
                    line.StartsWith("text_") ||
                    line.StartsWith("sound_"))
                {
                    return false;
                }

                return true;
            }

            nextLine = nextLine.ToLower();
            if (nextLine.StartsWith("if") ||
                nextLine.StartsWith("else") ||
                nextLine.StartsWith("endc") ||
                nextLine.StartsWith("elif"))
            {
                // These are rare enough that they can be checked manually
                return true;
            }

            if (line.StartsWith("text ") || line.StartsWith("line ") || line.StartsWith("cont ") || line.StartsWith("para "))
            {
                if (nextLine.StartsWith("line ") ||
                    nextLine.StartsWith("para ") ||
                    nextLine.StartsWith("cont ") ||
                    nextLine.StartsWith("next ") ||
                    nextLine == "prompt" ||
                    nextLine == "done" ||
                    nextLine.StartsWith("text_") ||
                    nextLine.StartsWith("sound_"))
                {
                    return true;
                }
            }
            else if (line.StartsWith("text_ram ") || line.StartsWith("text_decimal ") || line == "text_promptbutton")
            {
                if (nextLine.StartsWith("text_") || nextLine.StartsWith("text "))
                {
                    return true;
                }
            }
            else if (line == "text_end" || line == "prompt" || line == "done")
            {
                return true;
            }
            else
            {
                return true;
            }

            return false;
        }

        private static bool CheckPokedexNextLineValid(string line, string nextLine)
        {
            if (nextLine == null || line.StartsWith("_"))
            {
                return true;
            }

            if (line.StartsWith("text ") || line.StartsWith("db ") || line.StartsWith("dw "))
            {
                if (nextLine.StartsWith("next ") ||
                    nextLine.StartsWith("db ") ||
                    nextLine.StartsWith("dw "))
                {
                    return true;
                }
            }
            else if (line.StartsWith("next "))
            {
                if (nextLine.StartsWith("next ") ||
                    nextLine.StartsWith("page ") ||
                    nextLine == "dex")
                {
                    return true;
                }
            }
            else if (line.StartsWith("page "))
            {
                if (nextLine.StartsWith("next "))
                {
                    return true;
                }
            }

            return false;
        }

        private void ValidateText()
        {
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
                case FileType.TrainerParty:
                {
                    mustTerminate = true;
                    maxLength = MaxTrainerNameLength;
                    break;
                }
            }

            List<FormattedText> text = _block.GetFormattedTexts();
            for (int i = 0; i < text.Count; ++i)
            {
                FormattedText formattedText = text[i];

                if (string.IsNullOrWhiteSpace(formattedText?.Text))
                {
                    continue;
                }
                if ((formattedText.Instruction == "INCLUDE" || formattedText.Instruction == "INCBIN") && formattedText.Text.Contains("/"))
                {
                    continue;
                }
                if (string.IsNullOrWhiteSpace(formattedText.Instruction) ||
                    formattedText.Instruction == "assert" ||
                    formattedText.Instruction == "vc_assert" ||
                    formattedText.Instruction == "fail" ||
                    formattedText.Instruction == "DEF" ||
                    formattedText.Instruction == "SECTION" ||
                    formattedText.Instruction == "REDEF" ||
                    formattedText.Instruction == "MACRO" ||
                    formattedText.Instruction == "charmap" ||
                    formattedText.Instruction == "ENDM" ||
                    formattedText.Instruction == "if" ||
                    formattedText.Instruction == "IF" ||
                    formattedText.Instruction == "elif")
                {
                    continue;
                }

                StringBuilder unmappedCharactersBuilder = new StringBuilder();
                foreach (char c in formattedText.Unformatted)
                {
                    if (c > 12000)
                    {
                        unmappedCharactersBuilder.Clear();
                        break;
                    }
                    if (!PrintableChars.Contains(c.ToString()))
                    {
                        unmappedCharactersBuilder.Append(c);
                    }
                }
                if (unmappedCharactersBuilder.ToString() != string.Empty)
                {
                    output.Append(GetUnmappedCharErrorMessage(formattedText, unmappedCharactersBuilder.ToString()));
                }

                if (_block.Type == FileType.TextBox)
                {
                    if (_block.Source <= Source.Yellow)
                    {
                        if (formattedText.Instruction == "line" || formattedText.Instruction == "cont" || formattedText.Instruction == "next" || formattedText.Instruction == "text_low")
                        {
                            //maxLength = MaxRBYTextboxSecondLineLength;
                        }
                        else
                        {
                            maxLength = MaxTextboxLength;
                        }
                    }

                    string message = GetLengthValidationMessage(formattedText, maxLength);
                    if (!string.IsNullOrEmpty(message))
                    {
                        output.Append(message);
                    }

                    if (!CheckTextboxNextTextFlowValid(i, text))
                    {
                        output.Append(GetInvalidNextTextFlowInstructionErrorMessage(formattedText, text[i + 1]));
                    }
                }
                else if (_block.Type == FileType.Pokedex)
                {
                    if (i == 0 && _block.Name == "default")
                    {
                        // First string is species name
                        string message = GetLengthValidationMessage(formattedText, MaxSpeciesNameLength);
                        if (!string.IsNullOrEmpty(message))
                        {
                            output.Append(message);
                        }
                    }
                    else
                    {
                        string message = GetLengthValidationMessage(formattedText, maxLength);
                        if (!string.IsNullOrEmpty(message))
                        {
                            output.Append(message);
                        }
                    }
                }
                else if (_block.Type == FileType.Pokemon)
                {
                    if (formattedText.Text.Length > MaxPokemonNameLength)
                    {
                        output.Append(GetLengthErrorMessage(formattedText, MaxPokemonNameLength));
                    }
                }
                else if (_block.Type != FileType.Misc)
                {
                    string message = GetLengthValidationMessage(formattedText, maxLength);
                    if (!string.IsNullOrEmpty(message))
                    {
                        output.Append(message);
                    }
                }

                if (mustTerminate)
                {
                    if (!formattedText.Text.EndsWith(FormattedText.Terminator.ToString()))
                    {
                        output.Append(GetTerminatorErrorMessage(formattedText.Text));
                    }
                }

                if (_block.Type == FileType.Landmark)
                {
                    string message = GetLandmarkLineValidationMessage(formattedText, MaxLandmarkLineLength);
                    if (!string.IsNullOrWhiteSpace(message))
                    {
                        output.Append(message);
                    }
                }

                if (_block.Source == Source.GoldSilver && formattedText.Text.Contains("<PLAY_G>"))
                {
                    output.Append(GetGoldSilverPLAYGUnsupportedMessage(formattedText));
                }
            }
        }

        /// <summary>
        /// Ensures the next FormattedText is a valid flow from the one at index <paramref name="number"/>.
        /// Prevents issues like in Red/Blue the text used by Prof. Oak, when he gives you 5 Pokéballs, overwrites the second line with the last line.
        /// </summary>
        /// <param name="number">Index of the current FormattedText.</param>
        /// <param name="texts">List of FormattedTexts in this block.</param>
        /// <returns><c>true</c> if the FormattedText at <paramref name="number"/> + 1 is valid.</returns>
        private bool CheckTextboxNextTextFlowValid(int number, List<FormattedText> texts)
        {
            if (number + 1 == texts.Count)
            {
                // Any text instruction is valid as a last one. "text" "cont" "para" "line"
                return true;
            }

            FormattedText text = texts[number];
            FormattedText next = texts[number + 1];
            string instruction = text.Instruction;

            // Sometimes the current block is meant to be appended after a previous one. Allow that case to be handled through an annotation.
            if (number == 0 && _block.lines[0]?.Comment != null && _block.lines[0].Comment.Contains("PreviousInstruction "))
            {
                string[] commentTokens = _block.lines[0].Comment.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

                for (int i= 0; i < commentTokens.Length; ++i)
                {
                    if (commentTokens[i] == "PreviousInstruction" && i <= commentTokens.Length - 2)
                    {
                        instruction = commentTokens[i + 1];
                        break;
                    }
                }
            }

            switch (instruction)
            {
                case "text":
                case "para":
                {
                    if (next.Instruction == "line" ||
                        next.Instruction == "para" ||
                        next.Instruction == "next" ||
                        next.Instruction == "text_low")
                    {
                        return true;
                    }
                    return false;
                }
                case "line":
                case "cont":
                {
                    if (next.Instruction == "para" ||
                        next.Instruction == "cont" ||
                        next.Instruction == "next")
                    {
                        return true;
                    }
                    return false;
                }
                case "db":
                case "next":
                {
                    if (next.Instruction == "db" ||
                        next.Instruction == "next")
                    {
                        return true;
                    }
                    return false;
                }
                default:
                {
                    return false;
                }
            }
        }

        private bool CheckTextboxLineNeedsTerminator(string line, string nextLine)
        {
            if (nextLine != null &&
                (nextLine.StartsWith("if") ||
                nextLine.StartsWith("else") ||
                nextLine.StartsWith("endc") ||
                nextLine.StartsWith("elif") ||
                nextLine.StartsWith("IF") ||
                nextLine.StartsWith("ELSE") ||
                nextLine.StartsWith("ENDC") ||
                nextLine.StartsWith("ELIF")))
            {
                // These are rare enough that they can be checked manually
                return false;
            }

            // Special case evilness, these are too convoluted to implement properly here
            if (_block.Source == Source.GoldSilver || _block.Source == Source.Crystal)
            {
                // home/names.asm
                if (_block.Name == "GetTMHMName::")
                {
                    return false;
                }
            }
            if (_block.Source == Source.GoldSilver)
            {
                // home/print_num.asm
                if (_block.Name == "PrintHexNumber::")
                {
                    return false;
                }
            }
            if (_block.Source == Source.Crystal)
            {
                // engine/movie/trade_animation.asm
                if (_block.Name == "TrademonStats_PrintOTName:")
                {
                    return false;
                }
            }

            if (line.StartsWith("text ") ||
                line.StartsWith("line ") ||
                line.StartsWith("para ") ||
                line.StartsWith("cont "))
            {
                if (nextLine != null && (nextLine.StartsWith("sound_") || nextLine.StartsWith("text_")))
                {
                    return true;
                }
            }
            if (line.StartsWith("db ") || line.StartsWith("next "))
            {
                if (line.StartsWith("db BANK("))
                {
                    return false;
                }
                if (line.Contains("\"") && !line.Contains(FormattedText.Terminator + "\"") && (nextLine == null || !(nextLine.StartsWith("next ") || nextLine.StartsWith("db "))))
                {
                    return true;
                }
            }

            return false;
        }

        private bool CheckPokedexLineNeedsTerminator(string line, string nextLine)
        {
            if (line.StartsWith("db") && line.Contains("\"") && !nextLine.StartsWith("next "))
            {
                return true;
            }
            else if (line.StartsWith("next "))
            {
                if (nextLine == null)
                {
                    return true;
                }
                if (!nextLine.StartsWith("page ")
                    && !nextLine.StartsWith("next ")
                    && nextLine != "dex")
                {
                    return true;
                }
            }

            return false;
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

        private string GetTerminatorErrorMessage(string text)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: \"").Append(text).Append("\" in ").Append(_block.Name).Append(" is missing a terminator! Add @ to the end of the string.\n").ToString();
        }

        private string GetInvalidNextLineErrorMessage(string text, string nextLine)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: line \"").Append(text).Append("\" in ").Append(_block.Name).Append(" cannot be followed by \"").Append(nextLine).Append("\".\n").ToString();
        }

        private string GetInvalidNextTextFlowInstructionErrorMessage(FormattedText text, FormattedText next)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: Text flow in ").Append(_block.Name).Append(" Instruction \"").Append(text.Instruction).Append("\" cannot be followed by instruction \"").Append(next.Instruction).Append("\". Text: ").Append(text).Append("//").Append(next).Append("\n").ToString();
        }

        private string GetInvalidLastLineErrorMessage(string text)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: Text block \"").Append(_block.Name).Append(" cannot end with \"").Append(text).Append("\".\n").ToString();
        }

        private string GetLengthExactlyErrorMessage(FormattedText formattedText, int length)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" must be exactly ").Append(length).Append(" chars long.\n").ToString();
        }

        private string GetUnmappedCharErrorMessage(FormattedText formattedText, string unmapped)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" contains unmapped characters \'").Append(unmapped).Append("\'.\n").ToString();
        }

        private string GetGoldSilverPLAYGUnsupportedMessage(FormattedText formattedText)
        {
            StringBuilder sb = new StringBuilder();
            return sb.Append("\tError: text \"").Append(formattedText.Text).Append("\" in ").Append(_block.Name).Append(" contains \"<PLAY_G>\" which is unsupported in Gold/Silver. Use \"<PLAYER>\" instead.\n").ToString();
        }
    }
    
    // Comparer.cs
    internal class Comparer
    {
        private readonly ASMFile source;
        private readonly ASMFile target;

        public readonly List<Block> added;
        public readonly List<Block> removed;
        public readonly Dictionary<Block, Block> modified;
        public readonly Dictionary<Block, Block> matched;

        private bool canBeMergedFully = true;

        public Comparer(ASMFile source, ASMFile target)
        {
            this.source = source;
            this.target = target;

            added = new List<Block>();
            removed = new List<Block>();
            modified = new Dictionary<Block, Block>();
            matched = new Dictionary<Block, Block>();
        }

        public string Compare()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Comparing ").Append(source.File.FullName).Append(" to ").Append(target.File.FullName).Append('\n');
            List<string> targetBlockNames = target.blocks.Keys.ToList();

            // Cannot modify list while iterating over it.
            foreach (string name in targetBlockNames.ToArray())
            {
                if (target.blocks[name].lines.Count < 1)
                {
                    continue;
                }
            }

            foreach (KeyValuePair<string, Block> pair in source.blocks)
            {
                if (matched.ContainsKey(pair.Value) || modified.ContainsKey(pair.Value))
                {
                    targetBlockNames.Remove(pair.Key);
                    continue;
                }

                if (!target.blocks.ContainsKey(pair.Key))
                {
                    removed.Add(pair.Value);
                    sb.Append("\t- Block ").Append(pair.Key).Append(" deleted in target.\n");
                }
                else
                {
                    targetBlockNames.Remove(pair.Key);
                    sb.Append(CompareBlocks(pair.Value, target.blocks[pair.Key]));
                }
            }

            foreach (string name in targetBlockNames)
            {
                added.Add(target.blocks[name]);
                canBeMergedFully = false;
                sb.Append("\t+ Block ").Append(name).Append(" added in target.\n");
            }

            if (canBeMergedFully)
            {
                sb.Append("\tSource ").Append(source.Name).Append(" can be merged fully into target ").Append(target.Name).Append('\n');
            }

            return sb.ToString();
        }

        private string CompareBlocks(Block sourceBlock, Block targetBlock)
        {
            StringBuilder sb = new StringBuilder();

            List<string> sourceLines = sourceBlock.GetLinesSanitized();
            List<string> targetLines = targetBlock.GetLinesSanitized();
            if (sourceLines.Count != targetLines.Count)
            {
                modified.Add(sourceBlock, targetBlock);
                canBeMergedFully = false;
                sb.Append("\t! Block ").Append(sourceBlock.Name).Append(" has different line counts between source and target.\n");
            }
            else
            {
                bool changed = false;
                for (int i = 0; i < sourceLines.Count; i++)
                {
                    if (i == 0 && (sourceBlock.Name != "default" || sourceBlock.Name != targetBlock.Name))
                    {
                        continue;
                    }

                    string sourceLine = sourceLines[i];
                    string targetLine = targetLines[i];
                    if (source.Source == Source.GoldSilver || target.Source == Source.GoldSilver)
                    {
                        sourceLine = sourceLine.Replace("<PLAY_G>", "<PLAYER>");
                        targetLine = targetLine.Replace("<PLAY_G>", "<PLAYER>");
                    }
                    if (sourceLine != targetLine)
                    {
                        if (!changed)
                        {
                            sb.Append("\t! Block ").Append(sourceBlock.Name).Append(" in Source content differs from ").Append(targetBlock.Name).Append(" in Target.\n");
                            changed = true;
                        }
                        sb.Append("\t\t")
                          .Append(i)
                          .Append(":\n\t\t\t- Source: ")
                          .Append(sourceLine)
                          .Append("\n\t\t\t+ Target: ")
                          .Append(targetLine)
                          .Append('\n');
                    }
                }

                if (changed)
                {
                    modified.Add(sourceBlock, targetBlock);
                    canBeMergedFully = false;
                }
                else
                {
                    matched.Add(sourceBlock, targetBlock);
                    sb.Append("\t= Block ").Append(sourceBlock.Name).Append(" in Source matches ").Append(targetBlock.Name).Append(" in Target.\n");
                }
            }
            return sb.ToString();
        }
    }
    
    // Merger.cs
    internal class Merger
    {

        private readonly ASMFile source;
        private readonly ASMFile target;
        private readonly ASMFile baseSource;
        private readonly ASMFile baseTarget;
        private Comparer baseComparison;

        private StringBuilder output;

        public Merger(ASMFile source, ASMFile target, ASMFile baseSource, ASMFile baseTarget)
        {
            this.source = source;
            this.target = target;
            this.baseSource = baseSource;
            this.baseTarget = baseTarget;

            output = new StringBuilder();
        }

        public string Merge()
        {
            output.Append("Performing comparison between bases...\n");
            baseComparison = new Comparer(baseSource, baseTarget);
            output.AppendLine(baseComparison.Compare());

            HandleAdded();
            HandleMatched();
            HandleModified();

            return output.ToString();
        }

        /// <summary>
        /// Checks for and handles unconditional replacement annotations in blocks added in target, and if found,
        /// raplaces text in target blocks with specified source blocks regardless of base comparisons. Otherwise does nothing.
        /// </summary>
        private void HandleAdded()
        {
            foreach (Block added in baseComparison.added)
            {
                if (target.blocks.ContainsKey(added.Name))
                {
                    Block targetBlock = target.blocks[added.Name];
                    string replacement = targetBlock.ReplaceWith;
                    if (replacement != null && source.blocks.ContainsKey(replacement))
                    {
                        Block sourceBlock = source.blocks[replacement];
                        if (sourceBlock.GetFormattedTexts().Count == 0)
                        {
                            continue;
                        }

                        CopyLines(sourceBlock, targetBlock);
                        output.Append("Replacing block ").Append(targetBlock.Name).Append(" in target with ").Append(sourceBlock.Name).Append(" from source unconditionally.\n");
                    }
                }
            }
        }

        /// <summary>
        /// Replaces text in target blocks with text from source blocks, if the base comparisons matched.
        /// </summary>
        private void HandleMatched()
        {
            foreach (KeyValuePair<Block, Block> match in baseComparison.matched)
            {
                if (target.blocks.ContainsKey(match.Key.Name) && source.blocks.ContainsKey(match.Key.Name))
                {
                    Block sourceBlock = source.blocks[match.Key.Name];
                    if (sourceBlock.GetFormattedTexts().Count == 0)
                    {
                        continue;
                    }
                    Block targetBlock = target.blocks[match.Value.Name];

                    CopyLines(sourceBlock, targetBlock);
                    output.Append("Replacing block ").Append(targetBlock.Name).Append(" in target with ").Append(sourceBlock.Name).Append(" from source.\n");
                }
            }
        }

        /// <summary>
        /// Checks for and handles AlwaysReplace annotations in blocks in target, and if found, replaces
        /// text in target blocks with source blocks regardless of base comparisons. Otherwise does nothing.
        /// </summary>
        private void HandleModified()
        {
            foreach (KeyValuePair<Block, Block> modifiedBlock in baseComparison.modified)
            {
                if (modifiedBlock.Value.GetFormattedTexts().Count == 0)
                {
                    continue;
                }

                if (target.blocks.ContainsKey(modifiedBlock.Key.Name) && source.blocks.ContainsKey(modifiedBlock.Key.Name))
                {
                    Block targetBlock = target.blocks[modifiedBlock.Key.Name];
                    if (targetBlock.AlwaysReplace && source.blocks.ContainsKey(targetBlock.Name))
                    {
                        Block sourceBlock = source.blocks[targetBlock.Name];
                        if (sourceBlock.GetFormattedTexts().Count == 0)
                        {
                            continue;
                        }

                        CopyLines(sourceBlock, targetBlock);
                        output.Append("Replacing block ").Append(targetBlock.Name).Append(" in target with ").Append(sourceBlock.Name).Append(" from source unconditionally.\n");
                    }
                    else
                    {
                        output.Append("Block ").Append(modifiedBlock.Key.Name).Append(" differs in base scripts. Cannot merge automatically!\n");
                    }
                }
            }
        }

        /// <summary>
        /// Copies all lines from <paramref name="sourceBlock"/> into <paramref name="targetBlock"/>.
        /// </summary>
        /// <param name="sourceBlock">The source <see cref="Block"/>.</param>
        /// <param name="targetBlock">The target <see cref="Block"/>.</param>
        private void CopyLines(Block sourceBlock, Block targetBlock)
        {
            List<Line> newLines = new List<Line>();
            for (int i = 0; i < sourceBlock.lines.Count; ++i)
            {
                if (i == 0 && sourceBlock.Name != "default")
                {
                    // Keep the first line from target, so block names are the same in target.
                    newLines.Add(targetBlock.lines[i]);
                }
                else
                {
                    Line line = sourceBlock.lines[i];
                    string raw = line.Raw;
                    if (source.Source == Source.GoldSilver || target.Source == Source.GoldSilver)
                    {
                        raw = raw.Replace("<PLAY_G>", "<PLAYER>");
                    }
                    newLines.Add(new Line(line.Number, raw));
                }
            }

            targetBlock.lines = newLines;
        }

    }
    
    // TrainerDataValidator.cs
    internal class TrainerDataValidator
    {

        private ASMFile _trainerClassesFile;
        private ASMFile _trainerDataFile;
        private StringBuilder output;

        public TrainerDataValidator(ASMFile trainerClassesFile, ASMFile trainerDataFile)
        {
            _trainerClassesFile = trainerClassesFile;
            _trainerDataFile = trainerDataFile;
            output = new StringBuilder();
        }

        public string Validate()
        {
            if (!_trainerClassesFile.blocks.ContainsKey("TrainerClassNames::"))
            {
                output.Append("Error: No block with name \"TrainerClassNames\" exists.");
                return output.ToString();
            }

            Block trainerClassNamesBlock = _trainerClassesFile.blocks["TrainerClassNames::"];
            List<FormattedText> classNameTexts = trainerClassNamesBlock.GetFormattedTexts();
            List<Block> trainerBlocks = _trainerDataFile.blocks.Values.Where((block) => { return block.Name.EndsWith("Group:"); }).ToList();

            if (trainerBlocks.Count != classNameTexts.Count)
            {
                output.Append("Error: List of class names does not match list of trainers.");
                return output.ToString();
            }

            for (int i = 0; i < classNameTexts.Count; ++i)
            {
                int classLength = classNameTexts[i].Length;
                List<FormattedText> trainerBlockTexts = trainerBlocks[i].GetFormattedTexts();
                for (int j = 0; j < trainerBlockTexts.Count; ++j)
                {
                    int trainerNameLength = trainerBlockTexts[j].Length;
                    if (classLength + trainerNameLength + 1 > FormattedText.maxLengths["<ENEMY>"] + 1)
                    {
                        output.Append("\tError: ").Append(classNameTexts[i]).Append(' ').Append(trainerBlockTexts[j]).Append(" is too long!").Append('\n');
                    }
                }
            }

            return output.Length > 0 ? output.ToString() : null;
        }

    }
}