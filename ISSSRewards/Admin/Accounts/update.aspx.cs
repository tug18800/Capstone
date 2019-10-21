using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISSSRewards.Admin.Accounts
{
    public partial class update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var admin = (string)Session["admin"];

                if (admin == "true")
                {
                    tblStudent.Visible = false;
                    tblAdmin.Visible = true;
                    chkbxAdmin.Visible = true;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if(tblStudent.Visible == true)
            {
                Session["points"] = txtPoints.Text;
            }
            else
            {
                List<bool> selected = new List<bool>();

                for(int i = 0; i < ckbxPrivleges.Items.Count; i++)
                {
                    if(ckbxPrivleges.Items[i].Selected == true)
                    {
                        selected.Add(true);
                    }
                    else
                    {
                        selected.Add(false);
                    }
                }

                Session["list"] = selected;
            }

            Response.Redirect("view.aspx");
        }
    
    }
}