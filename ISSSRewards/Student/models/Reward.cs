using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Student.models

{
    [Serializable]
    public class Reward
    {
        public string ID { get; set; }
        public string Title { get; set; }
        public string Picture { get; set; }
        public string Desc { get; set; }
        public int Points { get; set; }
        public int Quantity { get; set; }
        public string Date { get; set; }
        public bool Status { get; set; }

        public Reward(string iD, string title, string pic, string desc, int points, int qty, string date, bool stat)
        {
            this.ID = iD;
            this.Title = title;
            this.Picture = pic;
            this.Desc = desc;
            this.Points = points;
            this.Quantity = qty;
            this.Date = date;
            this.Status = stat;
        }
    }

}