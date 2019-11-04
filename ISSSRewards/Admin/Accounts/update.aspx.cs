using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Accounts
{
    public partial class update : System.Web.UI.Page
    {
        List<Admins> admin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Admins a = (Admins)Session["admin"];
                
                admin = new List<Admins>();
                admin.Add(a);
                BindAdminGV(admin);
                FillPermissions(a);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Admins a = (Admins)Session["Admin"];
            UpdatePrivilages(a);
            Session["user"] = (Users)a;
            Response.Redirect("view.aspx");
        }

        private void UpdatePrivilages(Admins a)
        {
            for (int i = 0; i < ckbxPrivleges.Items.Count; i++)
            {

                a.Permissions[i] = ckbxPrivleges.Items[i].Selected;
            }
        }

        private void FillPermissions(Admins a)
        {

            for (int i = 0; i < ckbxPrivleges.Items.Count; i++)
            {
                
                ckbxPrivleges.Items[i].Selected = a.Permissions[i];
            }

        }

        private void BindAdminGV(List<Admins> admin)
        {
            gvAdmin.DataSource = admin;
            gvAdmin.DataBind();
        }

    }
}