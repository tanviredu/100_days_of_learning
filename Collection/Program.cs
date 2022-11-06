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


static void Main4(){
    var path = getfilePath();
    var countries_choice = new List<Country>();
    CsvReader reader = new CsvReader(path);
    var countries = reader.ReadAllCountriesList();
    Console.WriteLine("HOW MANY COUNTRY YOU WANT TO SEE ?");
    bool isint = int.TryParse(Console.ReadLine(),out int input);
    if(!isint || input <0){
        Console.WriteLine("YOU MUST USE A POSITIVE NUMBER");
        return;
    }
    // what if the user enter ammount that are 
    // bigger than the total number of country
    // so we need to take care of it
    // we can do it with if else comparison
    //if(input<=countries.Count){
    //}else{
    //}
    // different approach
    // we choose which one is min
    var maxToDisplay = Math.Min(input,countries.Count);
    for(int i=0;i<maxToDisplay;i++){
        var country = countries[i];
        countries_choice.Add(country);
    }
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries_choice,options);
    Console.WriteLine(jsonstring);
   

}

//Main4();


static void Pagination(){
    //1) first get all the countries
    // 10 %10 = 0
    // 20 %10 = 0
    //30 %10 = 0 
    //increment 10 thats what the mod do  
    
    var path = getfilePath();
    var countries_choice = new List<Country>();
    CsvReader reader = new CsvReader(path);
    var countries = reader.ReadAllCountriesList(); // get all the countries
    Console.WriteLine("ENTER THE BATCH SIZE");
    var userinput = "10";
    int.TryParse(userinput,out int max_to_display);
    for (int i = 0; i < countries.Count; i++)
    {
        // fully understand
        if(i>0 && (i%max_to_display == 0))
        {
            // to find a batch we first take number for batch
            // then we do this i%batch_number
            // suppose we set 7
            // then every 7 element i%max_to_display will
            // be true and i>0 means if it is not then first execution
            // it will be zero 0/max_to_display = 0 
            // thats why we did i>0
            Console.WriteLine("HIT RETURN TO CONTINUE,ANYTHING ELSE TO QUIT");
            if(Console.ReadLine() != ""){
                break;
            }

        }

        var country = countries[i];
        Console.WriteLine($"NUM : {i+1}  Country Name : {country.Name}, Region : {country.Region}, Code : {country.Code}");
    }
    

}

//Pagination();


static void ReversePagination(){
    var path = getfilePath();
    var countries_choice = new List<Country>();
    CsvReader reader = new CsvReader(path);
    var countries = reader.ReadAllCountriesList(); // get all the countries
    Console.WriteLine("ENTER THE BATCH SIZE");
    var userinput = "10";
    int.TryParse(userinput,out int max_to_display);
    for (int i = countries.Count -1; i >=0; i--)
    {
        var index = countries.Count -1 -i; // total number theke prottekbar loop e 1 kore kombe 0 hoyar ag porjonto
        if(index>0 &&(index%max_to_display == 0)){
            Console.WriteLine("HIT RETURN TO CONTINUE,ANYTHING ELSE TO QUIT");
            if(Console.ReadLine() != ""){
                break;
            }
        }

        var country = countries[i];
        Console.WriteLine($"NUM : {i+1}  Country Name : {country.Name}, Region : {country.Region}, Code : {country.Code}");
    }
}
//ReversePagination();

static void RemoveCommaCountries(){

    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    var countries = reader.ReadAllCountriesList(); // get all the countries
    Console.WriteLine(countries.Count());
    var result = countries.RemoveAll(s=>s.Name.Contains(','));
    Console.WriteLine(countries.Count());
      

}
//RemoveCommaCountries();

static void Linq1(){
    // taking 10 countries with Linq Method
    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    //var countries = reader.ReadFirstNCountries(10);
    var countries = reader.ReadAllCountriesList().Take(10);
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries,options);
    Console.WriteLine(jsonstring);
    Console.WriteLine("Total Countries: "+ countries.Count().ToString());

    
}


//Linq1();

static void Linq2(){
    // taking 10 countries with Linq Method
    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    //var countries = reader.ReadFirstNCountries(10);
    var countries = reader.ReadAllCountriesList().OrderBy(s=>s.Name).Take(10);
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries,options);
    Console.WriteLine(jsonstring);
    Console.WriteLine("Total Countries: "+ countries.Count().ToString());

    
}

//Linq2();

static void Linqquery(){
    // taking 10 countries with Linq Method
    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    //var countries = reader.ReadFirstNCountries(10);
    //var countries = reader.ReadAllCountriesList().OrderBy(s=>s.Name).Take(10);
    var countries = (from country in reader.ReadAllCountriesList()
                    where !country.Name.Contains(',')
                    orderby country.Name descending
                    select country).Take(10);
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(countries,options);
    Console.WriteLine(jsonstring);
    Console.WriteLine("Total Countries: "+ countries.Count().ToString());

    
}

//Linqquery();

static void nestedquery(){
    // taking 10 countries with Linq Method
    var path = getfilePath();
    CsvReader reader = new CsvReader(path);
    //var countries = reader.ReadFirstNCountries(10);
    //var countries = reader.ReadAllCountriesList().OrderBy(s=>s.Name).Take(10);
    var result = reader.GetAllCountryBasedONRegion();
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(result,options);
    Console.WriteLine(jsonstring);
}

nestedquery();

