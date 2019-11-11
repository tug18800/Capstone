using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Rewards
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("rewards.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            List<Reward> list = (List<Reward>)Session["rList"];
            if (list == null)
            {
                LoadRewardList();
            }

            string id = "0";
            if(list.Count > 0)
            {
                id = (Convert.ToInt32(list[list.Count - 1].ID) + 1).ToString();

            }
            else
            {
                id = 1.ToString();

            }

            string title = txtTitle.Text;
            string date = Convert.ToDateTime(txtDate.Text).ToString("MM/dd/yyyy");
            int points = Convert.ToInt32(txtPoints.Text);
            Reward r = new Reward(id, title, date, points);

            list.Add(r);

            Session["rList"] = list;

            Response.Redirect("Rewards.aspx");
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
    }
}