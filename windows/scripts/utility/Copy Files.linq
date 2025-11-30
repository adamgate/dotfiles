<Query Kind="Program" />

void Main()
{
	var sourceDirectory = CliUtils.GetValidDirectory("Select the folder where the files you want to copy are:");
	
	var shouldGetAllFiles = CliUtils.GetYesNoFromUser("\nWould you like to get all files?");
	var files = shouldGetAllFiles
		? FileUtils.GetAllFilesRecursively(sourceDirectory)
		: FileUtils.GetFirstFileRecursively(sourceDirectory);
		
	Console.WriteLine("\nFound {0} files to copy.", files.Count());
	CliUtils.ShouldContinueOrExit();
	
	var renameFiles = CliUtils.GetYesNoFromUser("\nWould you like to rename the files?");
	
	var outputDirectory = CliUtils.GetValidDirectory("\nSelect the folder where you want to save the copies:\n");
	
	Console.WriteLine("\nCopying files...");
	foreach (var sourceFile in files)
	{
		var newFileName = renameFiles
			? Directory.GetParent(sourceFile).Name + Path.GetExtension(sourceFile)
			: Path.GetFileName(sourceFile);
			
		var destinationFile = Path.Join(outputDirectory, newFileName);
		FileUtils.CopyFile(sourceFile, destinationFile);
		Console.WriteLine("Done copying {0}.", newFileName);
	}
	
	Console.WriteLine("\nDone copying all files.");
}
