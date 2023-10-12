using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeesDetail
{
    public class Userdata
    {

        public int UserId { get; set; }
        public bool IsAdded { get; set; }
        public bool IsEdit { get; set; }
        public bool IsDelete { get; set; }
        public bool IsView { get; set; }

    }
}