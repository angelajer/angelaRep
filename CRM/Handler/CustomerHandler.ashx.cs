using CRM.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;

namespace CRM.Handler
{
    /// <summary>
    /// CustomerHandler 的摘要说明
    /// </summary>
    public class CustomerHandler : IHttpHandler
    {
        public static QueryCustomerData result = new QueryCustomerData();
        public static int Flag = 0;
       public static int count = 0;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if (context.Request["Mode"] != null)
            {
                string mode = context.Request["Mode"].ToString();
                switch (mode) { 
                    case "Add":
                        Insert(context);
                        break;
                    case "Delete":
                        Delete(context);
                        break;
                    case "Query":
                        Query(context);
                        break;
                }
            }
            

          

        }

        private void Delete(HttpContext context) { 
        
        }

        private void Insert(HttpContext context) {

            count++;
            Customer c1 = new Customer();
            c1.Id = (10 + count).ToString();
            c1.IdentityNum = context.Request["IdentityNum"].ToString();
            c1.PhoneNum = context.Request["PhoneNum"].ToString();
            c1.RegisterDate = context.Request["RegisterDate"].ToString();
            c1.UserName = context.Request["UserName"].ToString();
            c1.Company = context.Request["Company"].ToString();
            c1.CustomerName = context.Request["CustomerName"].ToString();

            //List<Customer> list = new List<Customer>();
           
            //DataTable dt = getCustomer();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    Customer c = new Customer();
            //    c.Id = dr["Id"].ToString();
            //    c.CustomerName = dr["CustomerName"].ToString();
            //    c.IdentityNum = dr["IdentityNum"].ToString();
            //    c.PhoneNum = dr["PhoneNum"].ToString();
            //    c.RegisterDate = dr["RegisterDate"].ToString();
            //    c.UserName = dr["UserName"].ToString();
            //    c.Company = dr["Company"].ToString();
            //    list.Add(c);
            //}
            result.rows.Add(c1);
            //list.Add(c1);
            result.total +=1;
        
           
            DataContractJsonSerializer json = new DataContractJsonSerializer(result.GetType());
            json.WriteObject(context.Response.OutputStream, result);
            Flag = 1;
        }
        private void Query(HttpContext context)
        {
            string customerName, phoneNum, companyName, IdentityNum, beginTime, endTime;

            customerName = phoneNum = companyName = IdentityNum = beginTime = endTime = "";
            if (null != context.Request["customerName"]) {
                customerName = context.Request["customerName"];
            }

            if (Flag == 0)
            {
                
                QueryCustomerData result = ConvertDataSetIntoCustomer();
                DataContractJsonSerializer json = new DataContractJsonSerializer(result.GetType());
                json.WriteObject(context.Response.OutputStream, result);
            }
            else {
                DataContractJsonSerializer json = new DataContractJsonSerializer(result.GetType());
                json.WriteObject(context.Response.OutputStream, result);
            }
            
        }

        private QueryCustomerData ConvertDataSetIntoCustomer()
        {     
            List<Customer> list = new List<Customer>();
            DataTable dt = getCustomer();
            foreach (DataRow dr in dt.Rows)
            {
                Customer c = new Customer();
                c.Id = dr["Id"].ToString();
                c.CustomerName = dr["CustomerName"].ToString();
                c.IdentityNum = dr["IdentityNum"].ToString();
                c.PhoneNum = dr["PhoneNum"].ToString();
                c.RegisterDate = dr["RegisterDate"].ToString();
                c.UserName = dr["UserName"].ToString();
                c.Company = dr["Company"].ToString();
                list.Add(c);
            }

            result.total = dt.Rows.Count.ToString();
            result.rows = list;
            return result;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public DataTable getCustomer() {
            DataTable dt= new DataTable();

            DataColumn Id=new DataColumn("Id",typeof(string));
            DataColumn CustomerName = new DataColumn("CustomerName", typeof(string));
            DataColumn IdentityNum = new DataColumn("IdentityNum", typeof(string));
            DataColumn PhoneNum = new DataColumn("PhoneNum", typeof(string));
            DataColumn RegisterDate = new DataColumn("RegisterDate", typeof(string));
            DataColumn UserName = new DataColumn("UserName", typeof(string));
            DataColumn Company = new DataColumn("Company", typeof(string));

            dt.Columns.Add(Id);
            dt.Columns.Add(CustomerName);
            dt.Columns.Add(IdentityNum);
            dt.Columns.Add(PhoneNum);
            dt.Columns.Add(RegisterDate);
            dt.Columns.Add(UserName);
            dt.Columns.Add(Company);

            for (int i = 0; i < 10; i++) {
                DataRow dr = dt.NewRow();
                dr["Id"] = i;
                dr["CustomerName"] = "CustomerName" + i.ToString();
                dr["IdentityNum"] = "IdentityNum" + i.ToString();
                dr["PhoneNum"] = "PhoneNum" + i.ToString();
                dr["RegisterDate"] = "RegisterDate" + i.ToString();
                dr["UserName"] = "UserName" + i.ToString();
                dr["Company"] = "Company" + i.ToString();
                dt.Rows.Add(dr);
            }

                return dt;
        }
    }
}