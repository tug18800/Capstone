using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.Accounts.models
{
    public class Admins : Users
    {

        public List<bool> Permissions { get; set; }
        public Admins(string iD, string userType, string fName, string lName) : base(iD, userType, fName, lName)
        {
            this.ID = iD;
            this.UserType = userType;
            this.FName = fName;
            this.LName = lName;
            this.Permissions = new List<bool>();
        }

        public string fullName()
        {
            return FName + " " + LName;
        }
    }
}