using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Student.models;

namespace ISSSRewards.Student
{
    public partial class home : System.Web.UI.Page
    {
        Students student;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                student = Session["student"] as Students;
                if(student == null)
                {
                    student = LoadStudent();
                    Session["student"] = student;
                }               
            }
            else
            {
                student = Session["student"] as Students;
            }

            student.CalcPoints();
            lblPoints.Text = student.Points.ToString();

            gvRewards.DataSource = LoadRewardList();
            gvRewards.DataBind();

            gvEvents.DataSource = LoadEventList();
            gvEvents.DataBind();
            
        }

        private Students LoadStudent()
        {
            Students s = new Students("0000000001", "Student", "Test", "Testly");
            s.Events.Add(new Event("1", "Sample Event1", "12/01/2019", "This is Sample Event 1's description", "img/img.png", 10000, "11/7/2019"));
            s.Events.Add(new Event("3", "Sample Event3", "12/20/2019", "This is Sample Event 3's description", "img/img.png", 400, "11/7/2019"));
            return s;
        }

        protected List<Reward> LoadRewardList()
        {
            List<Reward> list = new List<Reward>();
            Reward r = new Reward("1", "$15 Chipotle Gift Card", "img/chipotle.png", "Gift card for participating Chiptole reasturants.", 500, 2, "11/07/2019", true);
            list.Add(r);
            r = new Reward("2", "Temple T-Shirt", "img/temple t-shirt.jpg", "Fine fabric T-Shirt with the Temple logo.", 300, 2, "11/01/2019", true);
            list.Add(r);
            r = new Reward("3", "Temple Water Bottle", "img/temple wb.jpg", "High quality water bottle.", 250, 2, "11/01/2019", true);
            list.Add(r);
            return list;
        }

        protected List<Event> LoadEventList()
        {
            List<Event> list = new List<Event>();
            Event ev = new Event("1", "Sample Event1", "12/01/2019", "This is Sample Event 1's description", "img/img.png", 250, "11/7/2019");
            list.Add(ev);
            ev = new Event("2", "Sample Event2", "12/05/2019", "This is Sample Event 2's description", "img/img.png", 250, "11/7/2019");
            list.Add(ev);
            ev = new Event("3", "Sample Event3", "12/20/2019", "This is Sample Event 3's description", "img/img.png", 250, "11/7/2019");
            list.Add(ev);
            return list;
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = (gvEvents.SelectedIndex + 1).ToString();
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("view.aspx?id=" + id);
        }

        protected void gvRewards_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = (gvRewards.SelectedIndex + 1).ToString();
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("confirm.aspx?id=" + id);
        }
    }
}