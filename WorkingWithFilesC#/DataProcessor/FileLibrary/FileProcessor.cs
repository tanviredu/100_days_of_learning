using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FileLibrary
{
    public class FileProcessor
    {
        public readonly string inputFilepath;
        public const string BackupDirectoryName = "Backup";
        public const string InProgressDirectoryName = "Processing";
        public const string CompletedDirectoryName = "Complete";
        public FileProcessor(string filePath)
        {
            inputFilepath = filePath;
        }

        public void Process()
        {
            Console.WriteLine($"Begin Process Of {inputFilepath}");
            if(File.Exists(inputFilepath) == false){
                Console.WriteLine($"ERROR : file {inputFilepath} does not exists");
                return;
            }
            // get the root directory of that file
            var DirectoryPath = new DirectoryInfo(inputFilepath).Parent.FullName;
            var rootDirectorypath = new DirectoryInfo(inputFilepath).Parent.Parent.FullName;
            // it also return a new directoryinfo object
            Console.WriteLine($"Working Directory path {DirectoryPath}");
            Console.WriteLine($"Root Directory is {rootDirectorypath}");

            // create a backup folder inside the project directory
            var backupDirectoryPath = Path.Combine(rootDirectorypath,BackupDirectoryName);
            Console.WriteLine(backupDirectoryPath);
            if(!Directory.Exists(backupDirectoryPath)){
                // create the directory
                Console.WriteLine($"Creating : {backupDirectoryPath}");
                Directory.CreateDirectory(backupDirectoryPath);
            }

            // copy file to the directory
            string inputFilename = Path.GetFileName(inputFilepath);
            Console.WriteLine($"INPUT FILE NAME : {inputFilename}");
            string backupFilePath = Path.Combine(backupDirectoryPath,inputFilename);
            Console.WriteLine($"COPYING {inputFilename} TO {backupFilePath}");
            File.Copy(inputFilepath,backupFilePath,overwrite:true);
            Console.WriteLine("Copied");

            // after copying to the backup folder 
            // we will Move the file in the IN folder
            // to inprogress directory

        }
    }
}