namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region InnerJoinQuery
    /// <summary>
    /// Join a Sales Order collection with Products into anonymous class
    /// NOTE: This is an equijoin or an inner join
    /// </summary>
    public List<ProductOrder> InnerJoinQuery()
    {
      List<ProductOrder> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();
      // Load all Sales Order Data
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

            // Write Query Syntax Here
            list = (from prod in products
                    join sale in sales
                    on prod.ProductID equals sale.ProductID
                    select new ProductOrder
                    {
                        ProductID = prod.ProductID,
                        Color = prod.Color,
                        LineTotal = sale.LineTotal,
                        ListPrice = prod.ListPrice,
                        Name = prod.Name,
                        OrderQty = sale.OrderQty,
                        SalesOrderID = sale.SalesOrderID,
                        Size = prod.Size,
                        StandardCost = prod.StandardCost,
                        UnitPrice = sale.UnitPrice 
                    }).ToList();


      return list;
    }
    #endregion

    #region InnerJoinMethod
    /// <summary>
    /// Join a Sales Order collection with Products into anonymous class
    /// NOTE: This is an equijoin or an inner join
    /// </summary>
    public List<ProductOrder> InnerJoinMethod()
    {
      List<ProductOrder> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();
      // Load all Sales Order Data
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

            list = products.Join(sales, prod => prod.ProductID, sale => sale.ProductID
            , (prod, sale) => new ProductOrder
            {
                ProductID = prod.ProductID,
                Color = prod.Color,
                LineTotal = sale.LineTotal,
                ListPrice = prod.ListPrice,
                Name = prod.Name,
                OrderQty = sale.OrderQty,
                SalesOrderID = sale.SalesOrderID,
                Size = prod.Size,
                StandardCost = prod.StandardCost,
                UnitPrice = sale.UnitPrice

            }).ToList();


      return list;
    }
    #endregion



    #region JoinIntoQuery
    /// <summary>
    /// Use 'into' to create a new object with a Sales collection for each Product
    /// This is like a combination of an inner join and left outer join
    /// The 'into' keyword allows you to put the sales into a 'sales' variable 
    /// that can be used to retrieve all sales for a specific product
    /// </summary>
    public List<ProductSales> JoinIntoQuery()
    {
      List<ProductSales> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();
      // Load all Sales Order Data
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

            list = (from prod in products
                    join sale in sales
                    on prod.ProductID equals sale.ProductID
                    into newsales
                    select new ProductSales
                    {
                        Product = prod,
                        Sales = newsales.ToList()
                    }).ToList();
              


      return list;
    }
    #endregion

    #region JoinIntoMethod
    /// <summary>
    /// Use GroupJoin() to create a new object with a Sales collection for each Product
    /// This is like a combination of an inner join and left outer join
    /// The GroupJoin() method replaces the into keyword
    /// </summary>
    public List<ProductSales> JoinIntoMethod()
    {
      List<ProductSales> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();
      // Load all Sales Order Data
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

      // Write Method Syntax Here


      return list;
    }
    #endregion

    
    public List<ProductOrder> LeftOuterJoinQuery()
    {
      List<ProductOrder> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();
      // Load all Sales Order Data
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

      // Write Query Syntax Here

      // this is the left join



        /*
         * 
         * 
         * left join
            from prod in products
        join sale in sales
        on prod.ProductID equals sale.ProductID
        into newsales
        from sale in new sales.DefaultIfEmpty()
         
         
         
         */
      list = (from prod in products
              join sale in sales
              on prod.ProductID equals sale.ProductID
              into newsales
              from sale in newsales.DefaultIfEmpty()
              select new ProductOrder{
                  ProductID = prod.ProductID,
                  Color = prod.Color,
                  LineTotal = sale.LineTotal,
                  ListPrice = prod.ListPrice,
                  Name = prod.Name,
                  OrderQty = sale.OrderQty,
                  SalesOrderID = sale.SalesOrderID,
                  Size = prod.Size,
                  StandardCost = prod.StandardCost,
                  UnitPrice = sale.UnitPrice
              }).ToList();

      return list;
    }
    
  }
}
