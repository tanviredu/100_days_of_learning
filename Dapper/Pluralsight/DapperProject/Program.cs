using System.Text.Json;
using DapperProject.DataLayer;
using DapperProject.POCO;



static void Print(Contact contact){
    Console.WriteLine("--------------------------------");
    var jsonString = JsonSerializer.Serialize<Contact>(contact);
    Console.WriteLine(jsonString);
    Console.WriteLine("--------------------------------");
}

static void GetAllContacts(){
    var conn = new ContactRepository();
    var allContacts = conn.GetAll();

    Console.WriteLine($"WE HAVE {allContacts.Count} contacts");
    
    Console.WriteLine("-------------------------------");
    foreach(var item in allContacts){
        Print(item);
        
    }

}
//GetAllContacts();
static void AddContacts(){
    var conn = new ContactRepository();
    var con = new Contact{
        FirstName = "Tanvir",
        LastName = "Rahman",
        Email = "avc@gmail.com",
        Company = "BESOPKEIT",
        Title = "Soft Engineer"

    };

    var result = conn.Add(con);
    Console.WriteLine("Data Added ");
    var res = JsonSerializer.Serialize(result);
    Console.WriteLine(res);

}

//AddContacts();

static void FindContacts(int Id){
    var conn = new ContactRepository();
    var con = conn.Find(Id);
    Print(con);
}

//FindContacts(8);
//Console.ReadLine();

static void UpdateData(){
    var conn = new ContactRepository();
    var con = new Contact{
        Id = 8,
        FirstName = "Hasnat",
        LastName = "Rahman",
        Email = "Mocospace@gmail.com",
        Company = "Pink Digital",
        Title = "Manager"

    };
    conn.Update(con);
    GetAllContacts();
}
//UpdateData();

static void DeleteData(int Id){
    var conn = new ContactRepository();
    conn.Remove(Id);
    
}

//DeleteData(7);
//DeleteData(8);
//GetAllContacts();


// -----------------------Dapper Contrib---------------------------

static void GetAllContrib(){
    var conn = new DapperContribRepository();
    var allcontacts = conn.GetAll();
    foreach(var item in allcontacts)
    {
        Print(item);
    }
}

//GetAllContrib();

static void AddContactsContrib(){
    var conn = new DapperContribRepository();
     var con = new Contact{
        FirstName = "Shuvo",
        LastName = "Alalmgir",
        Email = "shuvo@gmail.com",
        Company = "PRAN GROUP",
        Title = "farmasist"

    };

    var new_contact = conn.Add(con);
    var jsonstring = JsonSerializer.Serialize(new_contact);
    Console.WriteLine(jsonstring);
}

//AddContactsContrib();

 static void findcontrib(int id){
    var conn = new DapperContribRepository();
    var contact = conn.Find(id);
    Console.WriteLine(JsonSerializer.Serialize(contact));
}

//findcontrib(1);
//findcontrib(9);


static void UpdateContactsContrib(int Id){
    var conn = new DapperContribRepository();
     var con = new Contact{
        Id = Id,
        FirstName = "Shuva",
        LastName = "chowdhuary",
        Email = "Shuvachodhuwary@gmail.com",
        Company = "Fair and lovely",
        Title = "model"

    };

    var new_contact = conn.Update(con);
    var jsonstring = JsonSerializer.Serialize(new_contact);
    //Console.WriteLine(jsonstring);
    GetAllContacts();
}

//UpdateContactsContrib(9);



 static void Deletecontrib(int id){
    var conn = new DapperContribRepository();
    conn.Remove(id);
    GetAllContacts();
}
Deletecontrib(6);

// REMEMBER ONLY USE DAPPER CONTRIB IF THE QUERY IS SIMPLE
// MOST OF THE TIME IT IS NOT