using WiredBrainCoffie.StorageApp.Entities;
using WiredBrainCoffie.StorageApp.Repositories;

static void Main1(){

    var employeeRepository = new EmployeeRepository();
    employeeRepository.Add(new Employee{Id = 1, FirstName = "John"});
    employeeRepository.Add(new Employee{Id = 2, FirstName = "Jane"});
    employeeRepository.Add(new Employee{Id = 3,FirstName = "Jack"});
    employeeRepository.Save();
}


static void Main2(){
    var employeeRepository = new GenericRepository<Employee>();
    employeeRepository.Add(new Employee{Id = 1, FirstName = "John"});   
    employeeRepository.Add(new Employee{Id = 2, FirstName = "Jane"});   
    employeeRepository.Add(new Employee{Id = 3, FirstName="Tanvir"});
    employeeRepository.Save();
    var orgaRepository = new GenericRepository<Organization>();
    orgaRepository.Add(new Organization{Id = 1, Name = "StillMill"});
    orgaRepository.Add(new Organization{Id = 2, Name = "TSP"});
    orgaRepository.Add(new Organization{Id = 3, Name = "WiredBrain"});
    orgaRepository.Save();

}

static void Main3(){
    var employeeRepository = new GenericRepositoryWithRemove<Employee>();
    employeeRepository.Add(new Employee{Id = 1, FirstName = "John"});   
    employeeRepository.Add(new Employee{Id = 2, FirstName = "Jane"});   
    employeeRepository.Add(new Employee{Id = 3, FirstName="Tanvir"});
    employeeRepository.Remove(new Employee{Id = 3, FirstName="Tanvir"});
    employeeRepository.Save();
    var orgaRepository = new GenericRepositoryWithRemove<Organization>();
    orgaRepository.Add(new Organization{Id = 1, Name = "StillMill"});
    orgaRepository.Add(new Organization{Id = 2, Name = "TSP"});
    orgaRepository.Add(new Organization{Id = 3, Name = "WiredBrain"});
    orgaRepository.Remove(new Organization{Id = 3, Name = "WiredBrain"});
    orgaRepository.Save();

}

//Main1();
//Main2();
Main3();