using Microsoft.EntityFrameworkCore;
using PieShop.DataAccess;
using PieShop.Models;
using PieShop.Service.CategoryService;
using PieShop.Service.PieService;

var dirPath = Directory.GetCurrentDirectory();
var dbpath  = Path.Combine(dirPath,"app.db"); 
var builder = WebApplication.CreateBuilder(args);

// adding database connection
builder.Services.AddDbContext<AppDbContext>(opt=>opt.UseSqlite($"Data Source={dbpath}"));
// Add services to the container.
builder.Services.AddControllersWithViews();
// adding services
//builder.Services.AddScoped<IPieRepository,MockPieRepository>();
builder.Services.AddScoped<IPieRepository,PieRepository>();

//builder.Services.AddScoped<ICategoryRepository,MockCategoryRepository>();
builder.Services.AddScoped<ICategoryRepository,CategoryRepository>();

// this static method GetCart(service provider) will create a scoped
// shopping cart using get cart method
// get cart will return a Shoppingcart object everytime 
// you get a shopping cart by invoking the method GetCart

// when you invoke a  AddScoped method 
// you can access the IServiceProvider service that
// you can work with in scope, means new instance for every user
// and this getCart method take servie as a input and return empty
// shopping cart with a GUID label everytime user visits
// say addscoped and you get a sp(service provider) that you feed 
// into GetCart static method
// since it is AddScoped you get new <ShppongCart> in return everytime



// FULLY UNDERSTOOD AND EASY
builder.Services.AddScoped<ShoppingCart>(sp=>ShoppingCart.GetCart(sp));

builder.Services.AddControllersWithViews();


builder.Services.AddHttpContextAccessor();
builder.Services.AddSession();


var app = builder.Build();
// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles(); // it will search the static file in wwwroot folder
app.UseSession();
app.UseRouting();
app.UseAuthorization();
/* app.MapControllerRoute(
     name: "default",
     pattern: "{controller=Pie}/{action=List}/{id?}");
*/

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
});

app.Run();
