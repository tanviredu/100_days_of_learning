using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net.Http;
using JsonPractice.Entity;
using System.Net.Http.Json;
using System.Text.Json;

namespace JsonPractice
{
    public class WorkJson
    {
        public readonly HttpClient client;
        public WorkJson()
        {  
            client = new HttpClient(){
                BaseAddress = new Uri("https://jsonplaceholder.typicode.com")
            };
        }

        // this is the get api
        public async Task getUsers(){
            var user = await client.GetFromJsonAsync<User>("users/1");
            if(user != null){
                Console.WriteLine($"Id : {user.id}");
                Console.WriteLine($"Name : {user.name}");
                Console.WriteLine($"Username : {user.username}");
                Console.WriteLine($"Email : {user.email}");
            }
        }

        public async Task PostUser(){
            var newuser = new User
            {
                id = 11,
                name = "Tanvir Rahman",
                username = "tanviredu",
                email = "tanviredu2018@gmail.com"
            };
            // if you use var . the program still work but you lose the intelisense
            HttpResponseMessage response = await client.PostAsJsonAsync("users",newuser);
            Console.WriteLine($"{(response.IsSuccessStatusCode ? "Success":"Error")} - {response.StatusCode}"); 
        }
        
    }
}