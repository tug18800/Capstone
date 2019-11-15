using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Student.models;

namespace ISSSRewards.Student
{
    public partial class view : System.Web.UI.Page
    {
        Students student;
        List<Event> list;
        Event ev;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                student = Session["student"] as Students;
                
                if(student == null)
                {
                    Response.Redirect("../login.aspx");
                }
                if(!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    ev = LoadEvent();
                    string id = Request.QueryString["id"];
                    list = LoadEventList();
                    ev = list[list.FindIndex(result => result.ID == id)];

                    lblPointsNav.Text = student.Points.ToString();

                    lblTitle.Text = ev.Title;
                    lblDate.Text = ev.Date;
                    lblCreated.Text = ev.DateCreated;
                    lblDesc.Text = ev.Desc;
                    lblPoints.Text = ev.Points.ToString();
                    imgEvent.ImageUrl = ev.Picture;
                }
                else
                {
                    lblStatus.Text = "You must select a valid event from the list!";
                }
            }
        }

        private Event LoadEvent()
        {
            string id = Request.QueryString["id"];
            list = LoadEventList();
            return list[list.FindIndex(result => result.ID == id)];
        }

        protected List<Event> LoadEventList()
        {
            List<Event> list = new List<Event>();
            Event ev = new Event("1", "Sample Event1", "12/01/2019", "This is Sample Event 1's description", "img/img.png", 250, "11/7/2019");
            list.Add(ev);
            ev = new Event("2", "Sample Event2", "12/05/2019", "This is Sample Event 2's description", "img/img.png", 250, "11/07/2019");
            list.Add(ev);
            ev = new Event("3", "Sample Event3", "12/20/2019", "This is Sample Event 3's description", "img/img.png", 250, "11/07/2019");
            list.Add(ev);
            return list;
        }  

        protected void btnRSVP_Click(object sender, EventArgs e)
        {
            Button btnRSVP = sender as Button;
            ev = LoadEvent();

            string id = btnRSVP.ID;
            lblSuccess.Text = "Your RSVP status for " + ev.Title + " has changed to ";

            switch (id)
            {
                case "btnRSVP1": lblSuccess.Text += "\'Can't Come\'"; break;
                case "btnRSVP2": lblSuccess.Text += "\'Maybe\'"; break;
                case "btnRSVP3": lblSuccess.Text += "\'Coming\'"; break;
            }

            lblSuccess.Visible = true;
        }
    }
}