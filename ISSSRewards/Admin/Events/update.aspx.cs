using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Events
{
    public partial class update : System.Web.UI.Page
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
                        txtTitle.Text = ev.Title;
                        txtDate.Text = Convert.ToDateTime(ev.Date).ToString("yyyy-MM-dd");
                        txtDesc.Text += "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " +
                                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
                        txtPoints.Text += ev.Points.ToString();
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

            string term = Session["Term"] as string;
            if (string.IsNullOrEmpty(term))
            {
                lblTerm.Text = "TERM FALL 2019";
                Session["Term"] = lblTerm.Text;
            }
            else
            {
                lblTerm.Text = term;

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            list = (List<Event>)Session["eList"];
            string id = lblID.Text;

            foreach (Event ev in list)
            {
                if (ev.ID == id)
                {
                    ev.Title = txtTitle.Text;
                    ev.Date = Convert.ToDateTime(txtDate.Text).ToString("MM/dd/yyyy");
                    ev.Points = Convert.ToInt32(txtPoints.Text);
                    break;
                }
            }

            Session["eList"] = list;
            Session["Prev"] = Request.UrlReferrer.ToString();

            Response.Redirect("view.aspx?id=" + id);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string id = lblID.Text;
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("view.aspx?id=" + id);
        }

    }
}