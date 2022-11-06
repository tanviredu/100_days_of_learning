

static void Main()
{
    Console.WriteLine("Parsing Command Line Options");
    var args = Environment.GetCommandLineArgs();
    //Console.WriteLine(args[0]);
    /*
        the first element in the array contains
        the path of the executable (the .dll file) and the arguments
        passed to the program start with the second
        element, i.e. at index 1.
    */


}


static void Print(string[] args){
    foreach(var arg in args){
        Console.WriteLine(arg);
    }
}


Main();