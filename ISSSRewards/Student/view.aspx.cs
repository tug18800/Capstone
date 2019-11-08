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
        List<Event> list;
        Event ev;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    string id = Request.QueryString["id"];
                    list = LoadEventList();
                    ev = list[list.FindIndex(result => result.ID == id)];

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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string prev = Session["Prev"] as string;
            if (!string.IsNullOrEmpty(prev))
            {
                Response.Redirect(prev);
            }
            else
            {
                Response.Redirect("events.aspx");
            }
        }
    }
}