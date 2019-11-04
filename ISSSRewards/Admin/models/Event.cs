using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.models

{
    public class Event
    {
        public string ID { get; private set; }
        public string Title { get; set; }
        public string Date { get; set; }
        public int Points { get; set; }
        public Attendance Att { get;  set; }


        public Event(string ID, string Title, string Date, int Points)
        {
            this.ID = ID;
            this.Title = Title;
            this.Date = Date;
            this.Points = Points;
            this.Att = new Attendance();
        }

    }
}