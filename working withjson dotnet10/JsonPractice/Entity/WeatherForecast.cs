using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace JsonPractice.Entity
{
    public class WeatherForecast
    {
        public DateTime Date {get;set;}
        public int TemparetureCelsius {get;set;}
        public string? Summery {get;set;}
        public int Pressure {get;set;}
        [JsonPropertyName("Humid")]
        public int Humidity {get;set;} // in the json the api changes to humidity to humid so instead of 
                                        // changing everywhere we just add a tag saying jsons humid will be mapped in humidity in POCO
        public Coordinates? Coordinates {get;set;}
        public Wind? Wind {get;set;}
        public IEnumerable<string>? SummeryWords {get;set;}
    }
}