using CRM.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.UI
{
    public partial class MainPage : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) {
                User user=(User)Session["User"];
                string name=user.Name.ToString();
                txtUser.Text = name;
                DateTime dt=DateTime.Now;
                var str = dt.ToString(@"tt yyyy/MM/dd hh:mm:ss ", new CultureInfo("zh-CN"));
                lblDate.Text = str;
                   
            }
        }

        public string getRole() {
            User user = (User)Session["User"];
            return user.Role;
        }
    }
}