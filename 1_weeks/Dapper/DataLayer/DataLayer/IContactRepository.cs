namespace DataLayer
{
    public interface IContactRepository
    {
        Contact Find(int Id);
        List<Contact> GetAll();
        List<Contact> GetAllWithFName();
        Contact Add(Contact contact);
        Contact Update(Contact contact);
        void Remove(int Id);
        Contact GetFullContact(int Id);
    }
}