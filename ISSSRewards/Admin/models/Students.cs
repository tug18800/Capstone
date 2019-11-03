using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.models
{
    public class Students : Users
    {
        public List<Event> Events { get; set; }
        public List<Reward> Rewards { get; set; }
        public int Points { get; set; }

        public Students(string iD, string userType, string fName, string lName) : base(iD, userType, fName, lName)
        {
            this.ID = iD;
            this.UserType = userType;
            this.FName = fName;
            this.LName = lName;
            this.Events = new List<Event>();
            this.Rewards = new List<Reward>();
        }
        
    
        public string fullName()
        {
            return FName + " " + LName;
        }

        public int CalcEventPoints()
        {
            int total = 0;

            foreach(Event e in this.Events)
            {
                total += e.Points;
            }

            return total;
        }

        public int CalcRewardPoints()
        {
            int total = 0;

            foreach (Reward r in this.Rewards)
            {
                total += r.Points;
            }

            return total;
        }

        public void CalcPoints()
        {
            this.Points = CalcEventPoints() - CalcRewardPoints();
        }
    }
}