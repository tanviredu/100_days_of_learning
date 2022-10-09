using System;


namespace working_withjson_dotnet10.POCO
{
    public class WeatherForeCast
    {
        
        public DateTime Date {get;set;}
        public int TemparetureCelsius {get;set;}
        public string? Summary {get;set;}
        public int Pressure {get;set;}
        public int Humidity {get;set;}
        public Coordinate? coordinates {get;set;}
        public Wind? Wind {get;set;}
        public string[]? SummeryWords {get;set;}
    }
}