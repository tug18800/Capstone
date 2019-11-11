using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable events = GetEventData();
            PopulateEventTable(events);

            DataTable rewards = GetRewardData();
            PopulateRewardTable(rewards);

            BindGV(gvEvents, events);
            BindGV(gvRewards, rewards);

        }

        private void BindGV(GridView gridView, DataTable dt)
        {
            gridView.DataSource = dt;
            gridView.DataBind();
        }

        public DataTable GetEventData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Title");
            dt.Columns.Add("Date");
            dt.Columns.Add("Points");

            return dt;
        }

        public DataTable GetRewardData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("LName");
            dt.Columns.Add("FName");
            dt.Columns.Add("Reward");
            dt.Columns.Add("Points");
            dt.Columns.Add("Qty");

            return dt;
        }

        private void PopulateEventTable(DataTable dt)
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = "1";
            dr["Title"] = "Sample Event1";
            dr["Date"] = "01/01/2019";
            dr["Points"] = "250";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "2";
            dr["Title"] = "Sample Event2";
            dr["Date"] = "02/02/2019";
            dr["Points"] = "250";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "3";
            dr["Title"] = "Sample Event3";
            dr["Date"] = "03/03/2019";
            dr["Points"] = "250";
            dt.Rows.Add(dr);
        }

        private void PopulateRewardTable(DataTable dt)
        {
            DataRow dr = dt.NewRow();

            dr["ID"] = "0000000001";
            dr["LName"] = "Testly";
            dr["FName"] = "Test";
            dr["Reward"] = "$15 Chipotle Gift Card";
            dr["Points"] = "250";
            dr["Qty"] = "1";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "0000000001";
            dr["LName"] = "Testly";
            dr["FName"] = "Test";
            dr["Reward"] = "Temple T-Shirt";
            dr["Points"] = "300";
            dr["Qty"] = "1";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "0000000001";
            dr["LName"] = "Testly";
            dr["FName"] = "Test";
            dr["Reward"] = "Temple Shades";
            dr["Points"] = "150";
            dr["Qty"] = "1";
            dt.Rows.Add(dr);
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvEvents.SelectedRow.Cells[0].Text;
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("Events/view.aspx?id=" + id);
        }

        protected void gvRewards_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("Rewards/pending.aspx");
        }
    }
}