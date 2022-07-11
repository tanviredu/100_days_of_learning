using System;
using System.Security.AccessControl;
// See https://aka.ms/new-console-template for more information
using WiredBrainCoffie.StackApp;
using System.Collections.Generic;

Console.WriteLine("Hello, World!");

static void ActionforDoubles(){
    var stack = new SimpleDoubleStack();
    var sum = 0.0;
    stack.Push(1.1);
    stack.Push(2.2);
    stack.Push(3.3);
    stack.Push(4.4);
    stack.Push(5.5);
    while(stack._currentIndex >=0){
        var item = stack.Pop();
        Console.WriteLine($"Popped  : {item}");
        sum += item;
    }
    Console.WriteLine($"Total Sum {sum}");
    
}

static void StackString()

{
    var stringstack = new SimpleStringStackClass();
    stringstack.Push("Tanvir");
    stringstack.Push("Rahman");
    stringstack.Push("Ornob");
    while(stringstack._currentIndex >=0){
        var item = stringstack.Pop();
        Console.WriteLine($"Popped : {item}");
    }
}

static void ActionGeneric(){
    var stringstack = new GenericStack<string>();
    var doublestack = new GenericStack<double>();
    stringstack.Push("Tanvir");
    stringstack.Push("Rahman");
    stringstack.Push("Ornob");
    
    while(stringstack._currentIndex >=0){
        var item = stringstack.Pop();
        Console.WriteLine($"Popped : {item}");
    }

    
    doublestack.Push(1.1);
    doublestack.Push(2.2);
    doublestack.Push(3.3);

    while(doublestack._currentIndex >0){
        var item = doublestack.Pop();
        Console.WriteLine($"Popped : {item}");
    }




}

static void DefaultGeneric(){
    var stackdouble = new Stack<double>();
    var stringstack = new Stack<string>();
    stackdouble.Push(1.1);
    stackdouble.Push(2.2);
    stackdouble.Push(3.3);
    while(stackdouble.Count>0){
        var item = stackdouble.Pop();
        Console.WriteLine($"Popped : {item}");
    }
    stringstack.Push("Tanvir");
    stringstack.Push("Rahman");
    stringstack.Push("Ornob");
    while(stringstack.Count > 0){
        var item = stringstack.Pop();
        Console.WriteLine($"Popped : {item}");
    }
    
}

//ActionforDoubles();
//StackString();
//ActionGeneric();

DefaultGeneric();





