using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Model
{
    public class Customer
    {
        public string Id { get; set; }

        public string CustomerName { get; set; }

        public string IdentityNum { get; set; }

        public string PhoneNum { get; set; }

        public string RegisterDate { get; set; }

        public string UserName { get; set; }

        public string Company { get; set; }
    }
}