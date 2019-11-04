using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Events
{
    public partial class events : System.Web.UI.Page
    {
        List<Event> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Simulates retrieving list from db
                list = (List<Event>)Session["eList"];
                if(list == null)
                {
                    list = LoadEventList();
                    Session["eList"] = list;
                    BindEventGV(list);
                }
                else if(Request.QueryString["id"] != null)
                {
                    CheckID();
                }
                else
                {
                    BindEventGV(list);
                }
            }
        }

        //Simulates Converted Dataset from DB
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

        private void CheckID()
        {
            try
            {
                List<Event> result = new List<Event>();
                string id = Request.QueryString["id"];
                foreach (Event ev in list)
                {
                    if (ev.ID == id)
                    {
                        result.Add(ev);
                        break;
                    }
                }
                   
                BindEventGV(result);
            }
            catch (Exception ex)
            {
                gvEvents.Visible = false;
                lblStatus.Text = "This event does not exist!";
            }
        }

        private void BindEventGV(List<Event> list)
        {
            gvEvents.DataSource = list;
            gvEvents.DataBind();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = txtID.Text;
            Response.Redirect("events.aspx?id=" + id);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Response.Redirect("dashboard.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("add.aspx");
        }
        protected void btnAll_Click(object sender, EventArgs e)
        {
            list = (List<Event>)Session["eList"];
            BindEventGV(list);
        }
        protected void gvEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            list = (List<Event>)Session["eList"];
            string ID = gvEvents.Rows[e.RowIndex].Cells[0].Text;

            foreach(Event ev in list)
            {
                if(ev.ID == ID)
                {
                    list.Remove(ev);
                    break;
                }
            }

            BindEventGV(list);
            Session["eList"] = list;
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = gvEvents.SelectedRow.Cells[0].Text;
            Response.Redirect("view.aspx?id=" + ID);
        }

        protected void gvEvents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEvents.PageIndex = e.NewPageIndex;
            list = (List<Event>)Session["eList"];
            if(list == null)
            {
                list = LoadEventList();
            }
            BindEventGV(list);
        }
    }
}