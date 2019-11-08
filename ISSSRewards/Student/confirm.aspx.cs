using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Student.models;

namespace ISSSRewards.Student
{
    public partial class confirm : System.Web.UI.Page
    {
        Students student;
        List<Reward> list;
        Reward reward;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                student = Session["student"] as Students;
                list = Session["rList"] as List<Reward>;
                
                if(student == null)
                {
                    Response.Redirect("../login.aspx");
                }
                if(list == null)
                {
                    list = LoadRewardList();
                    Session["rList"] = list;
                }
                if(!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    string id = Request.QueryString["id"];
                    reward = list[list.FindIndex(item => item.ID == id)];
                    ViewState["Reward"] = reward;

                    lblTitle.Text = reward.Title;
                    lblDate.Text = reward.Date;
                    lblQty.Text = reward.Quantity.ToString();
                    lblDesc.Text = reward.Desc;                
                    lblPoints.Text = reward.Points.ToString();
                    lblCurrentPoints.Text = student.Points.ToString();
                    imgReward.ImageUrl = reward.Picture;


                    if (reward.Quantity == 0)
                    {
                        lblFailed.Text = "Sorry, we are currently out of stock on this item!";
                        lblFailed.Visible = true;
                        btnConfirm.Enabled = false;
                    }
                    else if (student.Points < reward.Points)
                    {
                        lblFailed.Text = "You do not have enough points to redeem this item!";
                        lblFailed.Visible = true;
                        btnConfirm.Enabled = false;
                    }
                     else
                    {
                        lblConfirm.Text = "Are you sure you wish to redeem this item?";
                        lblConfirm.Visible = true;
                    }
                }
                
            }
        }

        protected List<Reward> LoadRewardList()
        {
            List<Reward> list = new List<Reward>();
            Reward r = new Reward("1", "$15 Chipotle Gift Card", "img/chipotle.png", "Gift card for participating Chiptole reasturants.", 500, 2, "11/07/2019", true);
            list.Add(r);
            r = new Reward("2", "Temple T-Shirt", "img/temple t-shirt.jpg", "Fine fabric T-Shirt with the Temple logo.", 300, 2, "11/01/2019", true);
            list.Add(r);
            r = new Reward("3", "Temple Water Bottle", "img/temple wb.jpg", "High quality water bottle.", 250, 2, "11/01/2019", true);
            list.Add(r);
            return list;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string prev = Session["Prev"] as string;
            if (!string.IsNullOrEmpty(prev))
            {
                Response.Redirect(prev);
            }
            else
            {
                Response.Redirect("events.aspx");
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            student = Session["Student"] as Students;
            list = Session["rList"] as List<Reward>;
            reward = ViewState["Reward"] as Reward;

            reward.Quantity--;
            student.Rewards.Add(reward);
            student.CalcPoints();

            Session["Student"] = student;
            list[list.FindIndex(r => r.ID == reward.ID)] = reward;
            Session["rList"] = list;

            Response.Redirect("rewards.aspx");
        }
    }
}