using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DapperProject.POCO;

namespace DapperProject.DataLayer
{
    public interface IContactRepository
    {
        Contact Find(int Id);
        List<Contact> GetAll();
        Contact Add(Contact contact);
        Contact Update(Contact contact);
        void Remove(int Id);
    }
}