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
//Deletecontrib(6);

// REMEMBER ONLY USE DAPPER CONTRIB IF THE QUERY IS SIMPLE
// MOST OF THE TIME IT IS NOT



static void getFullContact(int Id){
    var repository = new ContactRepository();
    var data = repository.GetFullCOntact(Id);
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(data,options);
    Console.WriteLine(jsonstring);

}
//getFullContact(1);
static void geteve(){
    var repository = new ContactRepository();
    var data = repository.GetEverything();
    var options = new JsonSerializerOptions();
    options.WriteIndented = true; 
    var jsonstring = JsonSerializer.Serialize(data,options);
    Console.WriteLine(jsonstring);
}

//geteve();



static void INSERTADDRESS(){
    var conn = new ContactRepository();
    var addr = new Address{
        ContactId = 1,
        AddressType = "Office",
        StreetAddress = "CDA23",
        City = "Chittagong",
        StateId = 30,
        PostalCode = "4204"
    };
    var new_address = conn.AddressAdd(addr);
    var jsonString = JsonSerializer.Serialize(new_address);
    Console.WriteLine(jsonString);

}

static void UpdateAddress(){
    var conn = new ContactRepository();
    var updated_data  = new Address{
        Id = 8,
        ContactId = 1,
        AddressType = "UHome",
        StreetAddress = "Updated CDA23",
        City = "Updated Chittagong",
        StateId = 32,
        PostalCode = "4024"
    };
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var addr = conn.AddrssUpdate(updated_data);
    var jsonstring = JsonSerializer.Serialize(addr,options);
    Console.WriteLine(jsonstring);

}

static void addContactwithAddress(){
    var conn = new ContactRepository();
     var contact = new Contact
     {
        FirstName = "Tanvir ",
        LastName = "Rahman",
        Email = "tanviredu2018@gmail.com",
        Company = "BESPOKEIT",
        Title = "Software Engineering"

    };

    // you dont fill the contactid and nor the id 
    // it will be autometically filled
    // during saving
    // and id will be generated by database
    var addresses = new List<Address>{
    new Address
    {
        AddressType = "UOffice",
        StreetAddress = "STILLMILL",
        City = "Chittagong",
        StateId = 1,
        PostalCode = "1234"

    },
    new Address
    {
        AddressType = "Uhome",
        StreetAddress = "CDA23",
        City = "Chittagong Agrabad",
        StateId = 2,
        PostalCode = "4204"

    }

    };
    contact.Addresses.AddRange(addresses);
    conn.Save(contact);
    Console.WriteLine("Added data");
    // var options = new JsonSerializerOptions();
    // options.WriteIndented = true;
    // var jsonstring  = JsonSerializer.Serialize(contact,options);
    // Console.WriteLine(jsonstring);
    
    
}


static void updateContactwithaddress(){
        // first fetch the entires nested contact
        // from th database 
        var conn = new ContactRepository();
        var contact = conn.GetFullCOntact(11);
        // var options = new JsonSerializerOptions();
        // options.WriteIndented = true;
        // var jsonstring = JsonSerializer.Serialize(contact,options);
        // Console.WriteLine(jsonstring);
        contact.FirstName = "Ornik";
        contact.Company = "Freelance";
        contact.Addresses.First().StreetAddress = "Agrabad";
        conn.nestedupdate(contact);
        Console.WriteLine("Update Complete");

}
//updateContactwithaddress();

//addContactwithAddress();
//INSERTADDRESS();
//GetAllContacts();

//getFullContact(1);
//Console.WriteLine("----------------------------------------------------");
//getFullContact(2);

//UpdateAddress();
//Console.WriteLine("---------------------------------------------");
//getFullContact(1);

//--------------------- StoredProcedure-----------------------------

static void GetFullContactsSP(int Id){
    var conn = new ContactRepositoryProcedure();
    var contact = conn.GetFullCOntact(Id);
    var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(contact,options);
    Console.WriteLine(jsonstring);
}

//GetFullContactsSP(1);

static void FindSP(int Id){
    var conn = new ContactRepositoryProcedure();
    var contact = conn.Find(Id);
     var options = new JsonSerializerOptions();
    options.WriteIndented = true;
    var jsonstring = JsonSerializer.Serialize(contact,options);
    Console.WriteLine(jsonstring);

}
//FindSP(1);

static void savenested(){

    var conn = new ContactRepositoryProcedure();

     var contact = new Contact
     {
        FirstName = "Tanvir SP",
        LastName = "Rahman SP",
        Email = "tanviredu2018@gmail.SP",
        Company = "BESPOKEIT SP",
        Title = "Software Engineering SP"

    };

    // you dont fill the contactid and nor the id 
    // it will be autometically filled
    // during saving
    // and id will be generated by database
    var addresses = new List<Address>{
    new Address
    {
        AddressType = "Office SP",
        StreetAddress = "STILLMILL SP",
        City = "Chittagong SP",
        StateId = 2,
        PostalCode = "1234 SP"

    },
    new Address
    {
        AddressType = "home SP",
        StreetAddress = "CDA23 SP",
        City = "Chittagong Agrabad SP",
        StateId = 4,
        PostalCode = "4204 SP"

    }

    };
    contact.Addresses.AddRange(addresses);
    conn.Save(contact);
    Console.WriteLine("Added data");

}

//savenested();

static void updatenested(){

     var conn = new ContactRepositoryProcedure();
     var contact = conn.GetFullCOntact(15);
     contact.FirstName = "Updated FirstName";
     contact.LastName = "Updated LastName";
     contact.Addresses.First().AddressType = "UAD ";
     contact.Addresses.Last().AddressType = "UAD";

    conn.Update(contact);
    Console.WriteLine("Updated data");

}
updatenested();