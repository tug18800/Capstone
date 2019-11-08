using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Events
{
    public partial class view : System.Web.UI.Page
    {
        List<Event> list;
        protected void Page_Load(object sender, EventArgs e)
        {
          if(!IsPostBack)
            {
                if(Request.QueryString["id"] != null)
                {
                    string id = Request.QueryString["id"];
                    list = (List<Event>)Session["eList"];

                    if(list == null)
                    {
                        list = LoadEventList();
                        Session["eList"] = list;
                    }

                    Event ev = LoadEvent(list, id);
                    
                    if(ev != null)
                    {
                        lblID.Text = ev.ID;
                        lblTitle.Text = ev.Title;
                        lblDate.Text = ev.Date;
                        lblDesc.Text += "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " +
                                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
                        lblPoints.Text += ev.Points.ToString();
                    }
                    else
                    {
                        EventSection.Visible = false;
                        lblStatus.Text = "An Error Occurrd!";
                        lblStatus.Visible = true;
                    }
                   
                }
                else
                {
                    EventSection.Visible = false;
                    lblStatus.Text = "Please select an Event";
                    lblStatus.Visible = true;
                }
            }
        }

        private Event LoadEvent(List<Event> list, string id)
        {
            foreach(Event ev in list)
            {
                if(ev.ID == id)
                {
                    return ev;
                }
            }

            return null;
        }

        protected List<Event> LoadEventList()
        {
            List<Event> list = new List<Event>();
            Event ev = new Event("1", "Sample Event1", "01/01/2019", 250);
            list.Add(ev);
            ev = new Event("2", "Sample Event2", "02/02/2019", 250);
            list.Add(ev);
            ev = new Event("3", "Sample Event3", "03/03/2019", 250);
            list.Add(ev);
            ev = new Event("4", "Sample Event4", "04/04/2019", 250);
            list.Add(ev);
            ev = new Event("5", "Sample Event5", "05/05/2019", 250);
            list.Add(ev);
            return list;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = txtID.Text;
            Response.Redirect("view.aspx?id=" + id + "&prev=" + lblID.Text);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["Prev"]))
            {
                Response.Redirect("events.aspx");
            }
            else
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
                Response.Redirect(Request.QueryString["Prev"]);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = lblID.Text;
            Response.Redirect("update.aspx?id=" + id);
        }      
    }
}