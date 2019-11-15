using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Rewards
{
    public partial class update : System.Web.UI.Page
    {
        List<Reward> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string id = Request.QueryString["id"];
                    list = (List<Reward>)Session["rList"];

                    if (list == null)
                    {
                        list = LoadRewardList();
                        Session["rList"] = list;
                    }

                    Reward r = LoadReward(list, id);

                    if (r != null)
                    {
                        lblID.Text = r.ID;
                        txtTitle.Text = r.Title;
                        txtDate.Text = Convert.ToDateTime(r.Date).ToString("yyyy-MM-dd");
                        txtDesc.Text += "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " +
                                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
                        txtPoints.Text = r.Points.ToString();
                    }
                    else
                    {
                        RewardSection.Visible = false;
                        lblStatus.Text = "An Error Occurrd!";
                        lblStatus.Visible = true;
                    }

                }
                else
                {
                    RewardSection.Visible = false;
                    lblStatus.Text = "Please select an Reward";
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

        private Reward LoadReward(List<Reward> list, string id)
        {
            foreach (Reward r in list)
            {
                if (r.ID == id)
                {
                    return r;
                }
            }

            return null;
        }

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


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string id = lblID.Text;
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("view.aspx?id=" + id);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            list = (List<Reward>)Session["rList"];
            string id = lblID.Text;

            Reward r = list[list.FindIndex(item => item.ID == id)];          
            r.Title = txtTitle.Text;
            r.Date = Convert.ToDateTime(txtDate.Text).ToString("MM/dd/yyyy");
            r.Points = Convert.ToInt32(txtPoints.Text);

            list[list.FindIndex(item => item.ID == id)] = r;
            Session["rList"] = list;

            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("view.aspx?id=" + id);
        }
    }
}