using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.models
{
    public class Users
    {
        
        public string ID { get; set; }
        public string UserType { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }

        public Users(string iD, string userType, string fName, string lName)
        {
            ID = iD;
            UserType = userType;
            FName = fName;
            LName = lName;
        }

    }
}