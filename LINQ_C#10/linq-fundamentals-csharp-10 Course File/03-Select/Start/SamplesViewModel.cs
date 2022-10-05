using System.Text;
using System.Linq;

namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region GetAllQuery
    /// <summary>
    /// Put all products into a collection using LINQ
    /// </summary>
    public List<Product> GetAllQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            list = (from prod in products select prod).ToList();


      return list;
    }
    #endregion

    #region GetAllMethod
    /// <summary>
    /// Put all products into a collection using LINQ
    /// </summary>
    public List<Product> GetAllMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Method Syntax Here
            //list = products.Select(prod => prod).ToList();
            //list = products.ToList();
            // both of them give the same result
      return list;
    }
    #endregion

    #region GetSingleColumnQuery
    /// <summary>
    /// Select a single column
    /// </summary>
    public List<string> GetSingleColumnQuery()
    {
      List<Product> products = GetProducts();
      List<string> list = new();

            // Write Query Syntax Here
            // return the list of only the nname from products
            list = (from prod in products select prod.Name).ToList();
      

      return list;
    }
    #endregion

    #region GetSingleColumnMethod
    /// <summary>
    /// Select a single column
    /// </summary>
    public List<string> GetSingleColumnMethod()
    {
      List<Product> products = GetProducts();
      List<string> list = new();

            // Write Method Syntax Here
            // it will be a little bit tricky
            // because query syntax  by default
            // return list. but Method syntax not
            // you can't just assign it
            // you have to use addrange
            // you can select something in
            // methodsyntax
            list.AddRange(products.Select(s => s.Name));
            
            
      

      return list;
    }
    #endregion

    #region GetSpecificColumnsQuery
    /// <summary>
    /// Select a few specific properties from products and create new Product objects
    /// </summary>
    public List<Product> GetSpecificColumnsQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            // we only select perticular column
            // from the total value
            list = (from prod in products
                    select new Product
                    {
                        ProductID = prod.ProductID,
                        Name = prod.Name,
                        Size = prod.Size,
                    }
                    ).ToList();
      

      return list;
    }
    #endregion

    #region GetSpecificColumnsMethod
    /// <summary>
    /// Select a few specific properties from products and create new Product objects
    /// </summary>
    public List<Product> GetSpecificColumnsMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Method Syntax Here
            // in linq syntac it is possible
            // but Microsof prefer query syntac
            list = products.Select(prod => new Product
            {
                ProductID = prod.ProductID,
                Name = prod.Name,
                Size = prod.Size
            }).ToList();
      

      return list;
    }
    #endregion

    #region AnonymousClassQuery
    /// <summary>
    /// Create an anonymous class from selected product properties
    /// </summary>
    public string AnonymousClassQuery()
    {
      List<Product> products = GetProducts();
      StringBuilder sb = new(2048);

            // Write Query Syntax Here
            // how to return the value of the anon class
            // because it is locally scoped
            // and return type is string
            // we use a string builder 
            // and append the data
            // the only advantage that
            // you can change the name of the property 
            // without affecting anything

            var list = (from prod in products
                        select new
                        {
                            // you will not get any intelisense
                            // bcause it is anon and not any specfic class
                            Identifier = prod.ProductID,
                            ProductName = prod.Name,
                            ProductSize = prod.Size
                        }).ToList();
      

      // Loop through anonymous class
      foreach (var prod in list)
      {
        sb.AppendLine($"Product ID: {prod.Identifier}");
        sb.AppendLine($"   Product Name: {prod.ProductName}");
        sb.AppendLine($"   Product Size: {prod.ProductSize}");
      }

      return sb.ToString();
    }
    #endregion

    #region AnonymousClassMethod
    /// <summary>
    /// Create an anonymous class from selected product properties
    /// </summary>
    public string AnonymousClassMethod()
    {
      List<Product> products = GetProducts();
      StringBuilder sb = new(2048);

            // Write Method Syntax Here
            // writing anonymous class in methiod syntax
            // pretty simple with query syntax

            var list = products.Select(prod => new
            {
                Identifier = prod.ProductID,
                ProductName = prod.Name,
                ProductSize = prod.Size
            }).ToList();




      // Loop through anonymous class
      foreach (var prod in list)
      {
        sb.AppendLine($"Product ID: {prod.Identifier}");
        sb.AppendLine($"   Product Name: {prod.ProductName}");
        sb.AppendLine($"   Product Size: {prod.ProductSize}");
      }

      return sb.ToString();
    }
    #endregion
  }
}
