namespace WiredBrainCoffie.StackApp
{
    public class GenericStack<T>
    {
        public T[] _items;
        public int _currentIndex;

        public GenericStack()
        {
             _items = new T[10];
             _currentIndex = -1;
        }

        public void Push(T item){
            _items[++_currentIndex] = item;
            Console.WriteLine($"Pushed {_items[_currentIndex]}");
        }

        public T Pop(){
            var item = _items[_currentIndex--];
            return item;
            

        }
    }
}