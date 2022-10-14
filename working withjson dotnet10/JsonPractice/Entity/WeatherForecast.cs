using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JsonPractice.Entity
{
    public class WeatherForecast
    {
        public DateTime Date {get;set;}
        public int TemparetureCelsius {get;set;}
        public string? Summery {get;set;}
        public int Pressure {get;set;}
        public int Humidity {get;set;}
        public Coordinates? Coordinates {get;set;}
        public Wind? Wind {get;set;}
        public IEnumerable<string>? SummeryWords {get;set;}
    }
}