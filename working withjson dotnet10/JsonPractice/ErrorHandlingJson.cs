using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.Json;
using JsonPractice.Entity;
using System.Text.Json.Serialization;

namespace JsonPractice
{
    public class ErrorHandlingJson
    {
        public readonly JsonSerializerOptions options;
        public ErrorHandlingJson()
        {
            options = new JsonSerializerOptions
            {
                WriteIndented = true,
                PropertyNameCaseInsensitive = true,
                ReadCommentHandling = JsonCommentHandling.Skip,
                AllowTrailingCommas = true,
                NumberHandling = JsonNumberHandling.AllowReadingFromString
            };


        }
        public void deserobject()
        {
            var fileName = "Error.json";
            var jsonString = File.ReadAllText(fileName);
            var tmpcast = JsonSerializer.Deserialize<tmpForcast>(jsonString,options);
            Console.ReadLine(); // put a break point in here
        }

        
    }
}