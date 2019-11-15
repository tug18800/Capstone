using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Events
{
    public partial class attendance : System.Web.UI.Page
    {
        List<Event> list;
        Event ev;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Event> result = new List<Event>();
            if (!IsPostBack)
            {
                list = (List<Event>)Session["eList"];

                if(list == null)
                {
                    list = LoadEventList();
                    Session["eList"] = list;
                    result = list;
                }

                
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    result = LoadEvent(list);
                }

                BindDDL(result);
                BindEventGV(result);
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

        private List<Event> LoadEvent(List<Event> list)
        {
            string id = Request.QueryString["id"];
            Event ev =  list[list.FindIndex(item => item.ID == id)];
            List<Event> result = new List<Event>();
            result.Add(ev);
            return result;
        }

        protected List<Event> LoadEventList()
        {
            list = new List<Event>();
            ev = new Event("1", "Sample Event1", "01/01/2019", 250);
            ev.Att = LoadAttendance();
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

        private Attendance LoadAttendance()
        {
            Attendance att = new Attendance();
            List<Students> list = new List<Students>();
            
            for(int i = 1; i < 51; i++)
            {
                Students s = new Students("", "", "Test", "Testly");
                s.ID = "000000000" + i.ToString();
                list.Add(s);
            }
            att.List = list;

            return att;
        }

        private void BindEvent()
        {
            try
            {
                List<Event> result = GetEvent();
                BindEventGV(result);
            }
            catch (Exception ex)
            {
                gvEvents.Visible = false;
                lblStatus.Text = "This event does not exist!";
                lblStatus.Visible = true;
            }
        }

        private List<Event> GetEvent()
        {
            List<Event> result = new List<Event>();
            ev = Session["ev"] as Event;

            result.Add(ev);

            return result;
            
        }

        private List<Students> UploadAttendance()
        {
            List<Students> list = new List<Students>();

            for (int i = 51; i < 76; i++)
            {
                Students s = new Students("", "", "Test", "Testly");
                if(i < 10)
                {
                    s.ID = "000000000" + i.ToString();
                }
                else
                {
                    s.ID = "00000000" + i.ToString();  
                }
                list.Add(s);
            }

            return list;
        }

        private void BindDDL(List<Event> events)
        {
            ddlEvents.DataTextField = "Title";
            ddlEvents.DataValueField = "ID";
            ddlEvents.DataSource = events;
            ddlEvents.DataBind();
     
        }

        private void BindEventGV(List<Event> list)
        {
            gvEvents.DataSource = list;
            gvEvents.DataBind();
            gvEvents.Visible = true;
        }

        private void BindResultsGV(Event ev)
        {
            List<Event> result = new List<Event>();
            result.Add(ev);
            gvResults.DataSource = result[0].Att.List;
            gvResults.DataBind();
            gvResults.Visible = true;

            Session["ev"] = result[0];
        }

        private void BindResultsGV(List<Students> result)
        {
            gvResults.DataSource = result;
            gvResults.DataBind();
        }

        protected void ddlEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvResults.Visible = false;
            list = Session["eList"] as List<Event>;
            ev = list[list.FindIndex(item => item.ID == ddlEvents.SelectedValue)];

            Session["ev"] = ev;
            BindEvent();
            resultsHeader.Visible = false;
            btnUpload.Enabled = false;
        }

        protected void gvEvents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[4].Text == "&nbsp;")
                {
                    e.Row.Cells[4].Text = "-";
                }
                else
                {
                    List <Event> x = gvEvents.DataSource as List<Event>;
                    e.Row.Cells[4].Text = x[0].Att.GetAttendanceCount().ToString();
                }
            }
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            list = Session["eList"] as List<Event>;
            string id = gvEvents.SelectedRow.Cells[0].Text;
            ev = list[list.FindIndex(item => item.ID == id)];
            BindResultsGV(ev);
            resultsHeader.Visible = true;
            btnUpload.Enabled = true;
        }

        protected void gvResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResults.PageIndex = e.NewPageIndex;
            ev = Session["ev"] as Event;

            BindResultsGV(ev.Att.List);
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            ev  = Session["ev"] as Event;
            

            ev.Att.List.AddRange(UploadAttendance());

            list = Session["eList"] as List<Event>;
            
            list[list.IndexOf(ev)] = ev;
            Session["elist"] = list;

            List<Event> result = new List<Event>();
            result.Add(ev);

            BindResultsGV(ev.Att.List);
            BindEventGV(result);
            
        }
    }
}