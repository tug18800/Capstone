using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Rewards
{
    public partial class rewards : System.Web.UI.Page
    {
        List<Reward> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Simulates retrieving list from db
                list = (List<Reward>)Session["rList"];
                if (list == null)
                {
                    list = LoadRewardList();
                    Session["rList"] = list;
                    BindRewardGV(list);
                }
                else if (Request.QueryString["id"] != null)
                {
                    CheckID();
                }
                else
                {
                    BindRewardGV(list);
                }   
            }
        }
          
        //Simulates Converted Dataset from DB
        protected List<Reward> LoadRewardList()
        {
            List<Reward> list = new List<Reward>();
            Reward r = new Reward("1", "Sample Reward1", "01/01/2019", 250);
            list.Add(r);
            r = new Reward("2", "Sample Reward2", "02/02/2019", 250);
            list.Add(r);
            r = new Reward("3", "Sample Reward3", "03/03/2019", 250);
            list.Add(r);
            r = new Reward("4", "Sample Reward4", "04/04/2019", 250);
            list.Add(r);
            r = new Reward("5", "Sample Reward5", "05/05/2019", 250);
            list.Add(r);
            return list;
        }

        private void CheckID()
        {
            List<Reward> result = new List<Reward>();
            string id = Request.QueryString["id"];
            foreach (Reward r in list)
            {
                if (r.ID == id)
                {
                    result.Add(r);
                    BindRewardGV(result);
                    break;
                } 
            }
            if(result.Count == 0)
            {
                gvRewards.Visible = false;
                lblStatus.Text = "This Reward does not exist!";
                lblStatus.Visible = true;
            }
        }

        private void BindRewardGV(List<Reward> list)
        {
            gvRewards.DataSource = list;
            gvRewards.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblStatus.Visible = false;
            string id = txtID.Text;
            Response.Redirect("rewards.aspx?id=" + id);
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            list = Session["rList"] as List<Reward>;
            BindRewardGV(list);
        }

        protected void gvRewards_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            list = (List<Reward>)Session["rList"];
            string ID = gvRewards.Rows[e.RowIndex].Cells[0].Text;

            foreach (Reward r in list)
            {
                if (r.ID == ID)
                {
                    list.Remove(r);
                    break;
                }
            }

            BindRewardGV(list);
            Session["rList"] = list;
        }

        protected void gvRewards_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = gvRewards.SelectedRow.Cells[0].Text;
            Response.Redirect("view.aspx?id=" + ID);
        }

        protected void gvRewards_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRewards.PageIndex = e.NewPageIndex;
            list = (List<Reward>)Session["rList"];
            if (list == null)
            {
                list = LoadRewardList();
            }
            BindRewardGV(list);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("add.aspx");
        }
    }
}