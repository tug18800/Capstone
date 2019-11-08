using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Student.models

{
    public class Event
    {
        

        public string ID { get; private set; }
        public string Title { get; set; }
        public string Date { get; set; }
        public string Desc { get; set; }
        public string Picture { get; set; }
        public int Points { get; set; }
        public string DateCreated { get; set; }

        public Event(string iD, string title, string date, string desc, string picture, int points, string dateCreated)
        {
            this.ID = iD;
            this.Title = title;
            this.Date = date;
            this.Desc = desc;
            this.Picture = picture;
            this.Points = points;
            this.DateCreated = dateCreated;
        }

    }
}