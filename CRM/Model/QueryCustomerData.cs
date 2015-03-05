using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Model
{
    public class QueryCustomerData
    {
        public string total { get; set; }
        public List<Customer> rows { get; set; }
    }
}