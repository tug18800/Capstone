using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.Accounts.models

{
    public class Reward
    {
        public string ID { get; set; }
        public string Title { get; set; }
        public string Date { get; set; }
        public int Points { get; set; }

        public Reward(string iD, string title, string date, int points)
        {
            this.ID = iD;
            this.Title = title;
            this.Date = date;
            this.Points = points;
        }
    }
}