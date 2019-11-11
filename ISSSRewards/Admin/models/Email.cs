using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.models
{
    public class Email
    {
        public string ID { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }

        public Email(string iD, string title, string body)
        {
            this.ID = iD;
            this.Title = title;
            this.Body = body;
        }


    }
}