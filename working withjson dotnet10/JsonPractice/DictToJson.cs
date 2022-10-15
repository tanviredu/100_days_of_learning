using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Collections;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace JsonPractice
{
    public class DictToJson
    {
        // create a dictionary 
        public Dictionary<Feels,string> currentWeather;
        JsonSerializerOptions options;  
        public DictToJson()
        {
            currentWeather = new Dictionary<Feels,string>();
            options = new JsonSerializerOptions{
                WriteIndented = true,
                Converters = {
                    new JsonStringEnumConverter()
                }
            };
        }
        public void dicttojson(){
            currentWeather.Add(Feels.Cold,"It Is Very Cold");
            currentWeather.Add(Feels.Cool,"It Is Very Cool");
            currentWeather.Add(Feels.Warm,"It Is Very Warm");
            currentWeather.Add(Feels.Hot,"It Is Very Hot");

            string jsonstring  = JsonSerializer.Serialize(currentWeather,options);
            Console.WriteLine(jsonstring);
            Console.ReadLine();
            
        }
        
    }
}