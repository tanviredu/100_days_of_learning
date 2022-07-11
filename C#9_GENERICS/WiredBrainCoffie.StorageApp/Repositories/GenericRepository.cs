namespace WiredBrainCoffie.StorageApp.Repositories
{
    public class GenericRepository<T>
    {
        protected List<T> _items;

        public GenericRepository()
        {
            _items = new List<T>();
        }

        public void Add(T item){
            _items.Add(item);
        }

        public void Save(){
            foreach(var item in _items){
                Console.WriteLine(item);
            }
        }
    }
}