using FileLibrary;

void Main()
{
    Console.WriteLine("Parsing Command Line Options");
    var args = Environment.GetCommandLineArgs();
    /*
        the first element in the array contains
        the path of the executable (the .dll file) and the arguments
        passed to the program start with the second
        element, i.e. at index 1.
    */
    
    var command  = args[1]; // not 0
    
    if(command == "--file"){
        
        var filePath = args[2];
        // checking if the path of the file
        // is absolute or relative 
        if(!Path.IsPathFullyQualified(filePath)){
            Console.WriteLine($"ERROR: Path {filePath} Must be Fully Qualified");
            Console.ReadLine();
            return;
        }
        
        
        Console.WriteLine($"Single File {filePath.ToString()} Selected");
        ProcessSingleFile(filePath);
    }
    else if (command == "--dir"){
        var directoryPath = args[2];
        //file type inside of this directory
        var fileType = args[3];
        Console.WriteLine($"Directory Selected {directoryPath.ToString()} FOR {fileType.ToString()} Files ");
        ProcessDirectory(directoryPath,fileType);
    }
    else{
        Console.WriteLine("Invalid Command Line Options");
    }
    Console.ReadLine();


}

void ProcessDirectory(string directoryPath, string fileType)
{
   
}

void ProcessSingleFile(string filePath)
{
     var fileProcessor = new FileProcessor(filePath);
     fileProcessor.Process();
}

// test file full path
// F:\100_days_of_learning\WorkingWithFilesC#\DataProcessor\In\data1.txt


Main();