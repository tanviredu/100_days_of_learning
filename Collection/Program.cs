using System.Text.Json;
using Collection;


static string getfilePath(){
    var currdirectory = Directory.GetCurrentDirectory();
    var filepath      = Path.Combine(currdirectory,"population.csv");
    return filepath;
}


//Console.WriteLine(path);


static void Main(){
    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    //var countries = reader.ReadFirstNCountries(10);
    var countries = reader.ReadAllCountriesList();
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries,options);
    Console.WriteLine(jsonstring);
    Console.WriteLine("Total Countries: "+ countries.Count().ToString());

    
}


static void Main2(){
    var path = getfilePath();
    var reader = new CsvReader(path);
    var countries = reader.SaveCountriedwithCodeDict();
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries,options);
    Console.WriteLine(jsonstring);
}

static void Main3(){
    var path = getfilePath();
    var reader = new CsvReader(path);
    var countries = reader.SaveCountriedwithCodeDict();
    Console.WriteLine("Which Country You Want To Look Up? ");
    string input = Console.ReadLine();
    Country country; // 
    bool getCountry = countries.TryGetValue(input,out country);
    if(!getCountry){
        Console.WriteLine($"NO COUNTRY WITH THIS CODE : {input}");
    }else{
        var options = new JsonSerializerOptions();
        options.WriteIndented = true;
        var jsonstring = JsonSerializer.Serialize(country,options);
        Console.WriteLine(jsonstring);
    }
}

Main3();
