using System;
using System.Data.Entity;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using WingtipToys.Logic;
using WingtipToys.Models;

namespace WingtipToys
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Inicia a base de produtos
            Database.SetInitializer(new ProductDatabaseInitializer());

            // Create the custom role and user.
            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "ProductsByCategoryRoute",
                "Category/{categoryName}",
                "~/ProductList.aspx"
            );
            routes.MapPageRoute(
                "ProductByNameRoute",
                "Product/{productName}",
                "~/ProductDetails.aspx"
            );
        }
    }
}