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

Main();
