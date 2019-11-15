using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Student.models;

namespace ISSSRewards.Student
{
    public partial class rewards : System.Web.UI.Page
    {
        Students student;
        List<Reward> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                student = Session["student"] as Students; 
                list = (List<Reward>)Session["rList"];
                if (list == null)
                {
                    list = LoadRewardList();
                    Session["rList"] = list;
                }

                lblPointsNav.Text = student.Points.ToString();

                BindRewardGV(list);
                
            }
        }

        //Simulates Converted Dataset from DB
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

        private void BindRewardGV(List<Reward> list)
        {
            gvRewards.DataSource = list;
            gvRewards.DataBind();
        }


        protected void gvRewards_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = (gvRewards.SelectedIndex + 1).ToString();
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("confirm.aspx?id=" + id);
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
    }
    
}