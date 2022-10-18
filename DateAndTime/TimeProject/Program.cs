void func1(){
    var nowDatetime = DateTime.Now;
    var nowOffset   = DateTimeOffset.Now; 
    // it will give you the time zone information
    Console.WriteLine(nowDatetime);
    Console.WriteLine(nowOffset);

}
void func2(){
    var currentDirectory = Directory.GetCurrentDirectory();
    var fileName         = @"StockData.csv";
    var filePath         = Path.Combine(currentDirectory,fileName);
    var lines            = File.ReadAllLines(filePath);
    foreach(var line in lines.Skip(1)){
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
void func3(){
    var now = DateTime.Now;
    Console.WriteLine($"Day              :{now.Day}");
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
    }
func3();
