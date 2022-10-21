using Microsoft.EntityFrameworkCore;
using PieShop.DataAccess;
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
