<Query Kind="Program">
  <RuntimeVersion>10.0</RuntimeVersion>
</Query>

void Main()
{
	var sourceDirectory = CliUtils.GetValidDirectory("Select the parent folder whose children you want to rename:");
	var subDirectories = Directory.GetDirectories(sourceDirectory);
	
	Console.WriteLine("\nFound {0} directories to rename.", subDirectories.Count());
    CliUtils.ShouldContinueOrExit();
	
	Console.ReadLine();
	foreach (var subdirectory in subDirectories)
	{
		var filename = StripCharacters(Path.GetFileName(subdirectory));
		var processedDirectory = Path.Join(sourceDirectory, filename);
		Directory.Move(subdirectory, processedDirectory);
		Console.WriteLine($"Done moving: {processedDirectory}");
	}
}

public string StripCharacters(string input)
	=> new StringBuilder(input)
		.Remove(0, 4)
		.Replace('_', ' ')
		.ToString();