using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ISSSRewards.Admin.Rewards
{
    public partial class pending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = GetData();
                Session["dt"] = dt;
                gvRewards.DataSource = dt;
                gvRewards.DataBind();

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

        public DataTable GetData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("LName");
            dt.Columns.Add("FName");
            dt.Columns.Add("Reward");
            dt.Columns.Add("Points");
            dt.Columns.Add("Qty");

            PopulateTable(dt);

            return dt;
        }

        private void PopulateTable(DataTable dt)
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

        protected void gvRewards_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblStatus.Text = "An email has been sent to Test Testly about their denial!";
            lblStatus.Visible = true;

            DataTable dt = Session["dt"] as DataTable;
            dt.Rows[e.RowIndex].Delete();
            gvRewards.DataSource = dt;
            gvRewards.DataBind();
        }

        protected void gvRewards_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblStatus.Text = "Confirmation email sent!";
            lblStatus.Visible = true;

            DataTable dt = Session["dt"] as DataTable;
            dt.Rows[gvRewards.SelectedIndex].Delete();
            gvRewards.DataSource = dt;
            gvRewards.DataBind();
        }

        protected void gvRewards_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["Prev"]))
            {
                Response.Redirect("rewards.aspx");
            }
            else
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
                Response.Redirect(Request.QueryString["Prev"]);
            }
        }
    }
}