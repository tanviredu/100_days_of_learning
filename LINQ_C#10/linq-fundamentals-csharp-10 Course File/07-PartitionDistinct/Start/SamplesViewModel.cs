namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region TakeQuery
    /// SKIP WHILE AND TAKE WHILE ARE NOT WORKING
    /// <summary>
    /// Use Take() to select a specified number of items from the beginning of a collection
    /// </summary>
    public List<Product> TakeQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            list = (from prod in products
                    orderby prod.Name
                    select prod).Take(5).ToList();


            return list;
    }
    #endregion

    #region TakeMethod
    /// <summary>
    /// Use Take() to select a specified number of items from the beginning of a collection
    /// </summary>
    public List<Product> TakeMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            // Take(5) will take the first 5 from rh list
            list = products.OrderBy(s => s.Name).Take(5).ToList();
            

      return list;
    }
    #endregion

    #region TakeRangeQuery
    /// <summary>
    /// Use Take() to select a specified number of items from a collection using the Range operator
    /// </summary>
    public List<Product> TakeRangeQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            list = (from prod in products
                    orderby prod.Name
                    select prod).Take(5..8).ToList();

            return list;
    }
    #endregion

    #region TakeRangeMethod
    /// <summary>
    /// Use Take() to select a specified number of items from the beginning of a collection
    /// </summary>
    public List<Product> TakeRangeMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // take(5..8) will git you 5,6,7
            // Write Query Syntax Here
            
            list = products.OrderBy(s => s.Name).Take(5..8).ToList();


            return list;
    }
    #endregion

    #region TakeWhileQuery
    /// <summary>
    /// Use TakeWhile() to select a specified number of items from the beginning of a collection based on a true condition
    /// </summary>
    public List<Product> TakeWhileQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            list = (from prod in products select prod).TakeWhile(p=>p.Name.StartsWith("A")).ToList();
            

      return list;
    }
    #endregion

    #region TakeWhileMethod
    /// <summary>
    /// Use TakeWhile() to select a specified number of items from the beginning of a collection based on a true condition
    /// </summary>
    public List<Product> TakeWhileMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Method Syntax Here
            // MOST IMPORTANT METHOD
            // no need to filter data with for loop and if
            // we cn directly do that
            list = products.TakeWhile(s => s.ProductID >700).ToList();


     

      return list;
    }
    #endregion

    #region SkipQuery
    /// <summary>
    /// Use Skip() to move past a specified number of items from the beginning of a collection
    /// </summary>
    public List<Product> SkipQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            list = (from prod in products orderby prod.ProductID ascending select prod).Skip(1).ToList();
      

      return list;
    }
    #endregion

    #region SkipMethod
    /// <summary>
    /// Use Skip() to move past a specified number of items from the beginning of a collection
    /// </summary>
    public List<Product> SkipMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Method Syntax Here
            list = products.Skip(1).ToList();
      

      return list;
    }
    #endregion

    #region SkipWhileQuery
    /// <summary>
    /// Use SkipWhile() to move past a specified number of items from the beginning of a collection based on a true condition
    /// </summary>
    public List<Product> SkipWhileQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            list = (from prod in products select prod).SkipWhile(s => s.ProductID > 700).ToList();

      return list;
    }
    #endregion

    #region SkipWhileMethod
    /// <summary>
    /// Use SkipWhile() to move past a specified number of items from the beginning of a collection based on a true condition
    /// </summary>
    public List<Product> SkipWhileMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            list = products.DistinctBy(s => s.Color).ToList();
     

      return list;
    }
    #endregion

    #region DistinctQuery
    /// <summary>
    /// The Distinct() operator finds all unique values within a collection.
    /// In this sample you put distinct product colors into another collection using LINQ
    /// </summary>
    public List<string> DistinctQuery()
    {
      List<Product> products = GetProducts();
      List<string> list = new();

      // Write Query Syntax Here
      

      return list;
    }
    #endregion

    #region DistinctWhere
    /// <summary>
    /// The Distinct() operator finds all unique values within a collection.
    /// In this sample you put distinct product colors into another collection using LINQ
    /// </summary>
    public List<string> DistinctWhere()
    {
      List<Product> products = GetProducts();
      List<string> list = new();

            // Write Method Syntax Here
            //list = (from prod in products select prod.Color).ToList();
            list = (from prod in products select prod.Color).Distinct().ToList();

            return list;
    }
    #endregion

    #region DistinctByQuery
    public List<Product> DistinctByQuery()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

            // Write Query Syntax Here
            // in the distinct we get all the distinct color
            // but what happend if we ask we dont need the color we 
            // need the whole object but it will be distict by color
            // we need the whole prod but distinct by color
            list = (from prod in products select prod).DistinctBy(d => d.Color).ToList();


      return list;
    }
    #endregion

    #region DistinctByMethod
    public List<Product> DistinctByMethod()
    {
      List<Product> products = GetProducts();
      List<Product> list = new();

      // Write Method Syntax Here


      return list;
    }
    #endregion

    #region ChunkQuery
    /// <summary>
    /// Chunk() splits the elements of a larger list into a collection of arrays of a specified size where each element of the collection is an array of those items.
    /// </summary>
    public List<Product[]> ChunkQuery()
    {
      List<Product> products = GetProducts();
      List<Product[]> list = new();

            // Write Query Syntax Here
            // chunk is important
            // suppose you have a list 0f 10 eleiment
            // and you chunk it with 3
            // return list will be
            //[[0,1,2],[3,4,5],[6,7,8],[9]]
            // array of list

            list = (from prod in products select prod).Chunk(5).ToList();

      

      return list;
    }
    #endregion

    #region ChunkMethod
    /// <summary>
    /// Chunk() splits the elements of a larger list into a collection of arrays of a specified size where each element of the collection is an array of those items.
    /// </summary>
    public List<Product[]> ChunkMethod()
    {
      List<Product> products = GetProducts();
      List<Product[]> list = new();

      // Write Method Syntax Here
      

      return list;
    }
    #endregion
  }
}
