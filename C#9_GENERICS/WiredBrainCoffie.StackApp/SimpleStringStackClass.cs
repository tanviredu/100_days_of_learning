namespace WiredBrainCoffie.StackApp
{
    public class SimpleStringStackClass
    {
        public string[] _items;
        public int _currentIndex;

        public SimpleStringStackClass()
        {
            _items = new string[10];
            _currentIndex = -1;
        }

        public void Push(string item)
        {
            _items[++_currentIndex] = item;
            Console.WriteLine($"Pushed : {_items[_currentIndex]} ");
        }

        public string Pop()
        {
            var item = _items[_currentIndex--];
            return item;
        }
    }
}