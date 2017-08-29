using System;
using System.Collections.Generic;
using System.Web.UI;
using WingtipToys.Logic;
using WingtipToys.Models;

namespace WingtipToys
{
    public partial class ShoppingCart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<CartItem> GetShoppingCartItems()
        {
            ShoppingCartActions actions = new ShoppingCartActions();
            return actions.GetCartItems();
        }
    }
}