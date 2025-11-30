<Query Kind="Program" />

void Main()
{
	// Write code to test your extensions here. Press F5 to compile and run.
}

//===================================
public static class StringUtils
{
    public static bool ContainsIgnoreCase(this IEnumerable<string> source, string value)
    {
        ArgumentNullException.ThrowIfNull(source);

        foreach (string element in source)
        {
            if (value.EqualsIgnoreCase(element))
                return true;
        }

        return false;
    }

    public static bool EqualsIgnoreCase(this string val1, string val2)
        => string.Equals(val1, val2, StringComparison.OrdinalIgnoreCase);
}

//===================================
public static readonly string[] ConfirmationCommands = ["Yes", "Y"];
public static readonly string[] DeclineCommands = ["No", "N"];
public static readonly string[] TerminationCommands = ["Exit", "X"];
public static class CliUtils
{
	public static void DisplayMessageAndExit(string message, int exitCode)
	{
	    Console.WriteLine(message);
	    Environment.Exit(exitCode);
	}
	
	public static bool GetYesNoFromUser(string message)
	{
	    while (true)
	    {
	        Console.WriteLine(message);
	        Console.Write("> ");
	        var input = Console.ReadLine()?.Trim();
			Console.WriteLine(input);
	
	        if (ConfirmationCommands.ContainsIgnoreCase(input))
	            return true;
	
	        if (DeclineCommands.ContainsIgnoreCase(input))
	            return false;
	    }
	}
	
	public static string GetValidDirectory(string message)
    {
        string directory = "";
        while (string.IsNullOrEmpty(directory))
            directory = LoopUntilAcceptableInput(message);

        if (TerminationCommands.Contains(directory))
            return null;

        return directory;
    }

    private static string LoopUntilAcceptableInput(string message)
    {
        Console.WriteLine(message);
        Console.WriteLine("(You can type \"exit\" to close the app)");
        Console.Write("> ");
        var path = Console.ReadLine();
		Console.WriteLine(path);
		
        if (TerminationCommands.Contains(path))
            return path;

        if (File.Exists(path))
        {
            var tempMessage = string.Format("\"{0}\" is a file and not a directory. Please choose an existing directory.", path);
            Console.WriteLine(tempMessage);
            return null;
        }

        if (!Directory.Exists(path))
        {
            var tempMessage = string.Format("The directory \"{0}\" does not exist. Please choose an existing directory.", path);
            Console.WriteLine(tempMessage);
            return null;
        }

        return path;
    }
	
	public static void ShouldContinueOrExit()
	{
		var shouldContinue = CliUtils.GetYesNoFromUser("\nDo you want to proceed? (Y/N)");
    	if (!shouldContinue)
        	CliUtils.DisplayMessageAndExit("Exiting...", 0);
	}
}

//===================================
public static readonly char[] WindowsIllegalFileCharacters = ['/', '\\', '.', '<', '>', ':', '"', '|', '?', '*'];
public static readonly char[] LinuxIllegalFileCharacters = [];
public static readonly char[] MacIllegalFileCharacters = [];
public static class FileUtils
{
    public static void CopyFile(string sourceFileName, string destinationFileName)
    {
        try
        {
            File.Copy(sourceFileName, destinationFileName);
        }
        catch (Exception ex)
        {
            string errorMessage;

            if (ex is FileNotFoundException)
            {
                errorMessage = $"Could not find the source file \"{sourceFileName}\" to copy";
            }
            else if (ex is DirectoryNotFoundException)
            {
                errorMessage = $"Destination folder \"{Path.GetDirectoryName(destinationFileName)}\" does not exist for file \"{Path.GetFileName(destinationFileName)}\"";
            }
            else if (ex is IOException)
            { 
                errorMessage = $"Destination file \"{destinationFileName}\" already exists. Renaming file...";
            }
            else
            {
                errorMessage = $"An unexpected error occurred: {ex.Message}";
                Console.WriteLine(errorMessage);
                throw;
            }

            Console.WriteLine(errorMessage);
        }
    }

	public static void CreateDirectoryIfDoesntExist(string path)
	{
	    if (!Directory.Exists(path))
	        Directory.CreateDirectory(path);
	}
		
	public static string StripIllegalFileCharacters(this string fileName, IEnumerable<char> illegalCharacters)
    {
        var stringBuilder = new StringBuilder(fileName);

        foreach (var character in illegalCharacters)
        {
            stringBuilder.Replace(character.ToString(), "");
        }

        return stringBuilder.ToString();
    }
		
	public static IEnumerable<string> GetAllFilesRecursively(string targetDirectory)
	{
	    var mediaPaths = new List<string>();
	
	    string[] fileEntries = Directory.GetFiles(targetDirectory);
	    foreach (string filePath in fileEntries)
	    {
	        mediaPaths.Add(filePath);
	    }
	
	    string[] subdirectoryEntries = Directory.GetDirectories(targetDirectory);
	    foreach (string subdirectory in subdirectoryEntries)
		{
	        mediaPaths.AddRange(GetAllFilesRecursively(subdirectory));
		}
		
	    return mediaPaths;
	}
	
	public static IEnumerable<string> GetFirstFileRecursively(string targetDirectory)
	{
	    var mediaPaths = new List<string>();
	
	    string[] fileEntries = Directory.GetFiles(targetDirectory);
		if (fileEntries.Any())
		{
			mediaPaths.Add(fileEntries.First());
		}
		
	    string[] subdirectoryEntries = Directory.GetDirectories(targetDirectory);
	    foreach (string subdirectory in subdirectoryEntries)
		{
	        mediaPaths.AddRange(GetFirstFileRecursively(subdirectory));
		}
		
	    return mediaPaths;
	}
	
}

#region Advanced - How to multi-target

// The NETx symbol is active when a script runs under .NET x or later.
// (LINQPad also recognizes NETx_0_OR_GREATER in case you enjoy typing.)

#if NET10
// Code that requires .NET 10 or later
#endif

#if NET9
// Code that requires .NET 9 or later
#endif

#if NET8
// Code that requires .NET 8 or later
#endif

#if NET7
// Code that requires .NET 7 or later
#endif

#if NET6
// Code that requires .NET 6 or later
#endif

#if NETCORE
// Code that requires .NET Core or later
#else
// Code that runs under .NET Framework (LINQPad 5)
#endif

// The following symbols are also defined:
// WINDOWS              - when running under Microsoft Windows
// OSX, MACOS, UNIX     - when running under macOS
// CMD                  - when running under the command-line (lprun).

#endregion