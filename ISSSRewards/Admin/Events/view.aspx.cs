using System;
using System.Collections.Generic;
using System.Data;
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

                    gvRSVP.DataSource = LoadRSVP(ev);
                    gvRSVP.DataBind();
                   
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

        protected DataTable LoadRSVP(Event ev)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Cant", typeof(int));
            dt.Columns.Add("Maybe", typeof(int));
            dt.Columns.Add("Coming", typeof(int));
            dt.Columns.Add("Att", typeof(int));


            dt.Rows.Add(2, 12, 25, ev.Att.List.Count);

            return dt;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = txtID.Text;
            Response.Redirect("view.aspx?id=" + id + "&prev=" + lblID.Text);
        }      

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = lblID.Text;
            Response.Redirect("update.aspx?id=" + id);
        }

        protected void btnAtt_Click(object sender, EventArgs e)
        {
            string id = lblID.Text;
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("attendance.aspx?id=" + id);
        }
    }
}