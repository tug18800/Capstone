using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Student.models;

namespace ISSSRewards.Student
{
    public partial class Events : System.Web.UI.Page
    {
        Students student;
        List<Event> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                student = Session["student"] as Students;
                list = (List<Event>)Session["eList"];
                if (list == null)
                {
                    list = LoadEventList();
                    Session["eList"] = list;
                }
                if (student == null)
                {
                    Response.Redirect("../login.aspx");
                }

                BindEventGV(list);

            }
        }

        //Simulates Converted Dataset from DB
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

        private void BindEventGV(List<Event> list)
        {
            gvEvents.DataSource = list;
            gvEvents.DataBind();
        }


        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = (gvEvents.SelectedIndex + 1).ToString();
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("view.aspx?id=" + id);
        }

        protected void gvEvents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEvents.PageIndex = e.NewPageIndex;
            list = Session["eList"] as List<Event>;
            if (list == null)
            {
                list = LoadEventList();
            }
            BindEventGV(list);
        }
    }
}