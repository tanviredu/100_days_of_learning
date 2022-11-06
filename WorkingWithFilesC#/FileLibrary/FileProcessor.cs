using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FileLibrary
{
    public class FileProcessor
    {
        public readonly string inputFilepath;
        public FileProcessor(string filePath)
        {
            inputFilepath = filePath;
        }

        public void Process()
        {
            Console.WriteLine($"Begin Process Of {inputFilepath}");
        }
    }
}