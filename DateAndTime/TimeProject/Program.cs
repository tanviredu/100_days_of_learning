using System.Globalization;

void func1()
{
    var nowDatetime = DateTime.Now;
    var nowOffset = DateTimeOffset.Now;
    // it will give you the time zone information
    Console.WriteLine(nowDatetime);
    Console.WriteLine(nowOffset);

}
void func2()
{
    var currentDirectory = Directory.GetCurrentDirectory();
    var fileName = @"StockData.csv";
    var filePath = Path.Combine(currentDirectory, fileName);
    var lines = File.ReadAllLines(filePath);
    foreach (var line in lines.Skip(1))
    {
        Console.WriteLine("---------------------------------");
        Console.WriteLine(line);
        var segments = line.Split(',');
        var tradeDate = DateTime.Parse(segments[1]);
        Console.WriteLine(tradeDate);
        Console.WriteLine("---------------------------------");
        /*
        one of the output is 9/10/2019 12:00:00 AM 
        its ok but it creates the confusion
        which one is parse as a date and which one is
        parse as a  month and what timezone 

        */
    }
}
void func3()
{
    var now = DateTime.Now;
    
    Console.WriteLine($"Day              : {now.Day}");
    Console.WriteLine($"Day Of The Week  : {now.DayOfWeek}");
    Console.WriteLine($"Day Of the Year  : {now.DayOfYear}");
    Console.WriteLine($"Hour             : {now.Hour}");
    Console.WriteLine($"Minute           : {now.Minute}");
    Console.WriteLine($"Second           : {now.Second}");
    Console.WriteLine($"Local Or Global  : {now.Kind}");
    Console.WriteLine($"Month            : {now.Month}");
    Console.WriteLine($"Year             : {now.Year}");

    // hit the breakpoint here
    Console.ReadLine();
    // remember DateTime does not give Time zone information
    // so use DateTimeOffset instead incase if you need 

}

// DateTime.Now give local time in your computer
// DateTime.Now  value in your computer may not be the same
// in outher computer in different time zone 
// in distributed system this might create a problem

void func4(){
    // what is the time of the sydney based on your current time
    var now = DateTime.Now;
    // now find the sydney timezone 
    var sydney_timezone = TimeZoneInfo.FindSystemTimeZoneById("E. Australia Standard Time");
    var sydney_now = TimeZoneInfo.ConvertTime(now,sydney_timezone);
    var utcnow = DateTime.UtcNow; // this is universal time
    Console.WriteLine($"UNIVERSAL      : {utcnow}");
    Console.WriteLine($"IN MY COMPUTER : {now}");
    Console.WriteLine($"IN SYDNEY TIME : {sydney_now}");
    var timeZones = TimeZoneInfo.GetSystemTimeZones();
    foreach(var item in timeZones){
        Console.WriteLine(item);
    }
    Console.ReadLine();

    
}
void func5(){
    // Datetime is problematic and does not give timezone information
    // we can use DateTimeOffset
    Console.WriteLine(DateTime.Now);
    Console.WriteLine(DateTimeOffset.Now);
    var time = DateTimeOffset.Now;
    
}


void func6(){
    // when parsing Datetime we can tell the compiler that
    // how you parse the datetime
    // in which format

    var date = "9/11/2019 10:00:00 PM"; // it is parsed as Month-Date-Year
    var defaultParse = DateTime.Parse(date);
    Console.WriteLine(defaultParse.ToString("dddd, dd MMMM yyyy HH:mm:ss"));
    // its 11 september
    // but id we want to make the first one is Date and Second one is Month
    // like 9th Novenber we can do with ParseExact 
    // we have to tell the compiler 
    // you have to give the culture
    // we set it to invarient  
    // and second argument of parse exact hmust match to the given input date
    // after parsing then you can output based on your need
    var parseDate = DateTime.ParseExact(date,"d/M/yyyy h:mm:ss tt",CultureInfo.InvariantCulture);
    Console.WriteLine(parseDate.ToString("dddd, dd MMMM yyyy HH:mm:ss"));


}

void CONVERT_TO_ISO_STANDERED(){

    // the iso standered for Datetime that we use is 
    // example 2019-06-10T18:00:00+00:00
    // <year 2019>-<month 06>-<day 10>T<Hour 18>:<minute 00>:<second 00>+<timezone 00:00>
    var now  = DateTime.Now;
    // convert it to ISO Standered Time
    // iso standered has already a format "s", thats enough
    Console.WriteLine(now.ToString("s"));

  
    

}

void always_saved_as_utc(){
    
    // you MUST always save the date and time in utc format
    // only in utc you can avoid all the ambiguity 
    var now = DateTimeOffset.UtcNow;
    Console.WriteLine($"UTC :{now}"); //utc
    
    // but when you show the date in localtime in your client app
    // you can convert to the local time 
    var utctolocal = now.ToLocalTime();
    Console.WriteLine($"UTC To LOCAL :{utctolocal}"); // converted to local
    Console.WriteLine($"Already local in Datetime.Now  {DateTime.Now}");

    // REMEMBER DATETIMEOFFSET IS SUPIRIOR TO DATETIME 
}

void CalculationWithDateTime(){

}

CalculationWithDateTime();