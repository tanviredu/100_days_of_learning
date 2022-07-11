using System.Collections.Generic;
using WiredBrainCoffie.StorageApp.Entities;

namespace WiredBrainCoffie.StorageApp.Repositories
{
    public class EmployeeRepository
    {
        private List<Employee> _employees;

        public EmployeeRepository()
        {
            _employees = new List<Employee>();
        }
       public void Add(Employee employee)
       {
            _employees.Add(employee);
       }

       public void Save()
       {
        foreach(var employee in _employees)
        {
            Console.WriteLine(employee);
        }
       } 
    }
}