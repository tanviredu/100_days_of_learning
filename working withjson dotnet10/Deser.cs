using System;
using working_withjson_dotnet10.POCO;
using System.Text.Json;


namespace working_withjson_dotnet10
{
    public class Deser
    {
        string jsonString = @"{""Date"":""2021-12-08T00:00:00"",""TemparetureCelsius"":25,""Summary"":""Hot"",""Pressure"":1018,""Humidity"":85,""coordinates"":{""Lon"":13.13,""Lat"":12.12},""Wind"":{""Speed"":1.79,""Degree"":157,""Gust"":2.85},""SummeryWords"":[""windy"",""cool"",""Humid""]}";
        string filename = @"WeatherForeCast.json";

        public WeatherForeCast Des1()
        {
        WeatherForeCast? weatherForecast  = JsonSerializer.Deserialize<WeatherForeCast>(this.jsonString);
        return weatherForecast;
        }

    public async Task<WeatherForeCast> Des1FromFile(){
        // to make any async from file or to file
        // first create the stream
        using FileStream fs = File.OpenRead(this.filename);
        var wf = await JsonSerializer.DeserializeAsync<WeatherForeCast>(fs);
       return wf;
    }
      
    }

}