using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISSSRewards.Admin.models
{
    public class Attendance
    {

        public string ID { get; private set; }
        public List<Students> List { get; set; }

        public Attendance()
        {
            this.List = new List<Students>();
        }

        public Attendance(string iD, List<Students> list)
        {
            this.ID = iD;
            this.List = list;
        }

        public int GetAttendanceCount()
        {
            
            return this.List.Count;
        }

    }
}