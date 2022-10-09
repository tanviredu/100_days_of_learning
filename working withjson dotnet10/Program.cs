using System.Text.Json;
using System.IO;
using working_withjson_dotnet10.POCO;

var wb_object = new WeatherForeCast()
{
    Date = DateTime.Parse("2021-12-08"),
    TemparetureCelsius = 25,
    Summary = "Hot",
    Pressure = 1018,
    Humidity = 85,
    coordinates = new Coordinate{
        Lat = 12.12,
        Lon = 13.13
    },
    Wind = new Wind{
        Speed = 1.79,
        Degree = 157,
        Gust = 2.85
    },
    SummeryWords = new[]{"windy","cool","Humid"}
};

// IN json.Serialize onthe the field
// that are fill with value will show up

// //1 basic serialization
 var jsonstring = JsonSerializer.Serialize(wb_object);
 Console.WriteLine(jsonstring);
 //Console.Clear();



// // //2 you can add type when serializer too
//  string jsonstringgenerics = JsonSerializer.Serialize<WeatherForeCast>(wb_object);
//  Console.WriteLine(jsonstringgenerics);
//  Console.Clear();

//  string fileName1 = "WeatherForeCast.json";

// // // since the json string is just a string
// // // we can use the File.WriteAllText method
// // // to dump the json to a file
//  File.WriteAllText(fileName1,jsonstring);

// string fileName = "weatherForecastasync.json";

// // when you create a empty file
// // you use the file stream
// // use 'using' keyword because then you dont need
// // to close it manually
// using FileStream fs = File.Create(fileName);
// await JsonSerializer.SerializeAsync(fs,wb_object);
// await fs.DisposeAsync();
// Console.Clear();

// in synchoronous programming you just give the filename and the jsonstring
// in the async programming you give the file stream and the object

