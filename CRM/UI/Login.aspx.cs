using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Model;

namespace CRM
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login_Click(object sender, EventArgs e)
        {
         

            User user = new User();

            user.Name = txtUserName.Text;
            if (user.Name == "Kevin")
            {
                user.Role = "Admin";
            }
            else {
                user.Role = "User";
            }
            //if (txtUserName.Text.ToString() == "Kevin" && txtPassword.Text.ToString() == "1")
            //{
            //    Session["User"] = user;
            //    FormsAuthentication.RedirectFromLoginPage("Kevin", false);
            //}

                Session["User"] = user;
               FormsAuthentication.RedirectFromLoginPage(user.Name, false);
        }
    }
}