using ISSSRewards.Admin.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISSSRewards.Admin.Events
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            List<Event> list = (List <Event>)Session["eList"];
            if(list == null)
            {
                LoadEventList();
            }

            string id = "0";
            if(list.Count > 0)
            {
                id = (Convert.ToInt32(list[list.Count - 1].ID) + 1).ToString();
            }
            else
            {
                id = "1";
            }


            string title = txtTitle.Text;
            string date = Convert.ToDateTime(txtDate.Text).ToString("MM/dd/yyyy");
            int points = Convert.ToInt32(txtPoints.Text);
            Event ev = new Event(id, title, date, points);

            list.Add(ev);

            Session["eList"] = list;

            Response.Redirect("events.aspx");
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
    }
}