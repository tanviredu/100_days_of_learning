using System.Text.Json;
using JsonPractice.Entity;
using System.Net.Http;
using System.IO;
using JsonPractice;
using System.Text.Json.Serialization;
using System.Linq;

// create a new Weather Forecast Object 
// this is a POCO object
// plain old clr object
var weatherForecast = new WeatherForecast
{
    Date = DateTime.Parse("2022-12-23"),
    TemparetureCelsius = 25,
    Summery = "Hot Wather"

};


static string getTheFilePath(string filename){
    var currentDirectory = Directory.GetCurrentDirectory();
    var filepath = Path.Combine(currentDirectory,filename);
    return filepath;
}


static void  GetWeatherForecaseSyncWay(WeatherForecast weatherForecast){

    var jsonString = JsonSerializer.Serialize(weatherForecast);
    Console.WriteLine(jsonString);
    Console.Clear();
    // there is another implementation with generics
    // incase you want which case you want to serialize
    var jsonString2 = JsonSerializer.Serialize<WeatherForecast>(weatherForecast);
    Console.WriteLine(jsonString2);
    Console.Clear();
    // Writing with the file
    var fileName = "WeatherForecast.json";
    var filePath = getTheFilePath(fileName);

    File.WriteAllText(filePath,jsonString2);
    Console.WriteLine("Data Is Written in the Directory");


}


//GetWeatherForecaseSyncWay(weatherForecast);

static async Task  GetWeatherForecaseSyncWayAsync(WeatherForecast weatherForecast){

    // you need a  file stream to store json in the async way
    var filePath = getTheFilePath("AsyncWeatherForecast.json");
    // you need File Stream to work with the 
    // async method
    using var FileStream = File.Create(filePath);
    await JsonSerializer.SerializeAsync(FileStream,weatherForecast);
}

// await GetWeatherForecaseSyncWayAsync(weatherForecast);
// we will add json serialize options
var options = new JsonSerializerOptions(){
    WriteIndented = true,
    PropertyNamingPolicy = JsonNamingPolicy.CamelCase // all will be  converted to camal case
};


void nestedweatherForecast(){
    var wf = new WeatherForecast{
        Date = DateTime.Parse("2022-12-23"),
        TemparetureCelsius = 23,
        Humidity = 85,
        Pressure = 1018,
        Summery = "Cloundy",
        Coordinates = new Coordinates{
            Lat = 10.3,
            Lon = 23.5
        },
        Wind = new Wind {
          Degree = 10,
          Gust = 3.56,
          Speed = 20.34
      
        },
        SummeryWords = new List<string>{
            "windy",
            "Hot",
            "Pressure"
        }
    };

    var jsonstring = JsonSerializer.Serialize(wf,options);
    Console.WriteLine(jsonstring);
    Console.Read();

}

//nestedweatherForecast();

// Desirialize 

static void basicDeserializer(){
    var jsonString = @"{
	""Date"": ""2022-12-23T00:00:00"",
	""TemparetureCelsius"": 23,
	""Summery"": ""Cloundy"",
	""Pressure"": 1018,
	""Humid"": 85,
	""Coordinates"": {
		""Lon"": 23.5,
		""Lat"": 10.3
	},
	""Wind"": {
		""Speed"": 20.34,
		""Degree"": 10,
		""Gust"": 3.56
	},
	""SummeryWords"": [""windy"", ""Hot"", ""Pressure""]
}";

var weatherForecast = JsonSerializer.Deserialize<WeatherForecast>(jsonString);
PropertyReader(weatherForecast);
// put the break pount in bellow line
Console.ReadLine();

}


static void PropertyReader(WeatherForecast weatherForecast){
    if(weatherForecast != null){
        Console.WriteLine($"Date     : {weatherForecast.Date}");
        Console.WriteLine($"Humidity : {weatherForecast.Humidity}");
        Console.WriteLine($"Latitude : {weatherForecast.Coordinates.Lat}");
        Console.WriteLine($"Logitude : {weatherForecast.Coordinates.Lon}");
        Console.WriteLine($"Words Summery");
        
        foreach(var item in weatherForecast.SummeryWords){
        Console.WriteLine($"words : {item.ToString()}");    
        }
    }
}

// basicDeserializer();



// working ok

// decsirializationFrom File
static void DeseriaizefromFile(string filename){
    var filepath = getTheFilePath(filename);
    var jsonString = File.ReadAllText(filepath);
    // desirializing from json
    var weatherForecast = JsonSerializer.Deserialize<WeatherForecast>(jsonString);
    PropertyReader(weatherForecast);
    
}

//DeseriaizefromFile("Deweather.json");


static async Task DeserializefromFileAsync(string filename){
    // REMEMBER ASYNC DESERIALIZATION 
    // WORK WITH THE FILE STREAM
    // LIKE THE SERIALIZER YOU WILL CREATE FILE STREAM
    // BUT NOT WITH File.Create() because its already there
    // use File.Open() to open the existing file 
    var filepath = getTheFilePath(filename);
    var fileStream = File.OpenRead(filepath);
    var weatherForecast = await JsonSerializer.DeserializeAsync<WeatherForecast>(fileStream);
    Console.ReadLine();
}   

//DeserializefromFileAsync("Deweather.json");


// FROM net

static async Task GetUsersfunc(){
    var wj = new WorkJson();
    await wj.getUsers();
}
 
//await GetUsersfunc();

static async Task PostUsersfunc(){
    var wj = new WorkJson();
    await wj.PostUser();
}

// await PostUsersfunc();


static void getserializerwithOptions1(){
    var sopt = new SerializationOpt();
    sopt.serialize_coordinate();
    Console.ReadLine();


}

//getserializerwithOptions1();

static void getserializerwithOptions2(){
    var sopt = new SerializationOpt();
    
    // we will get a formatted ans
    sopt.serialize_coordinate_with_opt();
    Console.ReadLine();
}
//getserializerwithOptions2();

static void getwindsserialized(){
    var ww = new SerializationOpt();
    ww.get_wind_serializer();
    Console.ReadLine();
}
//getwindsserialized();


// serialized wih Enums
// REMEMBER BY DEFAULT ENUMS ARE SERIALIZED AS NUMBERS
// BUT WE CAN CHANGE THAT WITH SERIALIZE OPTIONS
void enumconversionwithoutoption(){
    var weather = new tmpForcast
    {
        Date = DateTime.Parse("2022-12-23"),
        Summery = "Hot",
        TemparetureCelsius = 28,
        FeelsLike = Feels.Warm
    };
    var jsonstring = JsonSerializer.Serialize(weather);
    Console.WriteLine(jsonstring);


}
//enumconversionwithoutoption();


JsonSerializerOptions opt = new JsonSerializerOptions{
    WriteIndented = true,
    PropertyNameCaseInsensitive = true,
    Converters = {
        new JsonStringEnumConverter()
    }

};



void enumconversionwithoptions(){
    var weather = new tmpForcast
    {
        Date = DateTime.Parse("2022-12-23"),
        Summery = "Hot",
        TemparetureCelsius = 28,
        FeelsLike = Feels.Warm
    };
    var jsonstring = JsonSerializer.Serialize(weather,opt);
    Console.WriteLine(jsonstring);


}
//enumconversionwithoptions();



/*
 working with DOM
 when you desirialize you need to know the structure 
 and the json object might be too big and yo dont want to
 include everything  
 then youu should working with JSON ducoments


THE JSON DOCUMENT API IS USEFUL FOR READING JSON DOCUMENT (STRINGS)
FOR WHICH THE STRUCTURE IS UNKNOWN AND WHERE THEY ARE TOO BIG
JSON IS LIKE A TREE WITH ROOT ELEMENT , THIS ELEMENT CAN CONTAINS JSON ELEMENT 
IT CAN ALSO HOLD MULTIPLE JSON OBJECT INSIDE IT

 public class User
    {
        public int id { get; set; }
        public string name { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public Address address { get; set; }
        public string phone { get; set; }
        
        public string website { get; set; }
        public Company company { get; set; }
    }

    User -> ROOT
    Id -> Element
    username -> Element
    Address -> json object (nested)
    Address.street -> json element 

    json document is inherited from IDisposable
    remember to use using keyword when working with json document

*/


// we are going to find avg temp and avg humidity from the json data
var fileName    = "data.json";
var jsonsString = File.ReadAllText(fileName);
double sum = 0;
int count = 0; 
using(var document = JsonDocument.Parse(jsonsString))
{
    var root = document.RootElement;
    //Console.WriteLine(root.ToString());
    
    var tmplist = new List<TempHumid>();
    var temp = root.GetProperty("temperaturecelsius");
    //Console.WriteLine(temp.ToString());

    var temp1 = root.GetProperty("last7days");
    foreach(var item in temp1.EnumerateArray()){
        var data1 = item.GetProperty("temperature").GetDouble();
        var data2 = item.GetProperty("humidity").GetDouble();
        var th = new TempHumid{
            Tempareture= data1,
            Humidity = data2
        };
        tmplist.Add(th);
        
    }

    var countdata = tmplist.Count();
    double sumtemp = 0;
    double sumhum = 0;
    foreach(var item in tmplist){
        sumtemp += item.Tempareture;
    }
    foreach(var item in tmplist){
        sumhum += item.Humidity;
    }

    var avgTemp = sumtemp / countdata;
    Console.WriteLine("Average temp: " + avgTemp);
    var avghum = sumhum / countdata;
    Console.WriteLine("Average hum: " + avghum);

   
}


