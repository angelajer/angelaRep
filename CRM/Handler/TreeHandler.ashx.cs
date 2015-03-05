using CRM.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace CRM.Handler
{
    /// <summary>
    /// Summary description for TreeHandler
    /// </summary>
    public class TreeHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
           
            StringBuilder sb = new StringBuilder();
            string url1 = context.Server.MapPath("~/UI/ManageCustomer.aspx");
           sb.Append("{"); 
           sb.Append("\"text\": \"业务管理\",");
           sb.Append("\"children\": [{");
           sb.Append("\"text\": \"客户管理\",");
           sb.Append("\"attributes\": {");
             sb.Append("\"url\":\"").Append(url1).Append("\"");
             sb.Append("}");
               sb.Append("},{");
               sb.Append("\"text\": \"贷款管理\",");
                    sb.Append("\"attributes\": {");
                     sb.Append("\"url\":\"~/UI/LoanManagement.aspx\"");
                     sb.Append("}");
                sb.Append("}]}");
        

            context.Response.Write(sb.ToString());

            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}