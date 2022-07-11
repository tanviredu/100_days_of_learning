// See https://aka.ms/new-console-template for more information
public class SimpleDoubleStack
{
    public double[] _items;
    public  int _currentIndex;
    public SimpleDoubleStack()
    {
        // create an arrya of douyble
        _items = new Double[10];
        _currentIndex = -1;
    }

    public void Push(double item)
    {
        _items[++_currentIndex] = item;
        Console.WriteLine($"Pushed : {_items[_currentIndex]} ");
        
    }
    public double Pop()
    {
        var item = _items[_currentIndex--];
        return item;
    }
}