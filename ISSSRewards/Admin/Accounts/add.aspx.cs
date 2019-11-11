using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;


namespace ISSSRewards.Admin.Accounts
{
    public partial class add : System.Web.UI.Page
    {
        List<Users> users;
        List<Users> accounts;
        List<Users> user;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                users = (List<Users>)Session["list"];

                accounts = new List<Users>();
                FillAccounts(accounts);
                Session["accounts"] = accounts;
            }
        }

        private void FillAccounts(List<Users> accounts)
        {
            Users u = new Users("0000000003", "-", "John", "Smith");
            accounts.Add(u);
            u = new Users("0000000004", "-", "Jane", "Doe");
            accounts.Add(u);
            u = new Users("0000000005", "-", "Walter", "White");
            accounts.Add(u);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = txtID.Text;
            accounts = (List<Users>)Session["accounts"];
            users = (List<Users>)Session["list"];

            List<Users> all = new List<Users>();
            all.AddRange(accounts);
            all.AddRange(users);

            foreach(Users u in all)
            {
                if(u.ID == id && u.UserType != "Admin")
                {
                    user = new List<Users>();
                    user.Add(u);
                    BindAccountGV(user, gvAccount);
                    btnAdd.Enabled = true;
                    chkbxAdmin.Visible = true;
                }
                else if(u.ID == id && u.UserType == "Admin")
                {
                    user = new List<Users>();
                    user.Add(u);
                    BindAccountGV(user, gvAccount);
                    btnAdd.Enabled = false;
                }
            }
        }

        private void BindAccountGV(List<Users> user, GridView gvAccount)
        {
            gvAccount.DataSource = user;
            gvAccount.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            divConfirm.Visible = true;

            btnCancel1.Visible = true;
            btnCancel.Visible = false;

            btnConfirm.Visible = true;
            btnAdd.Visible = false;
        }

        private void FillPrivilages(Admins a)
        {

            for (int i = 0; i < ckbxPrivleges.Items.Count; i++)
            {
                a.Permissions.Add(ckbxPrivleges.Items[i].Selected);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("accountmaintenance.aspx");
        }

        protected void btnCancel1_Click(object sender, EventArgs e)
        {
            divConfirm.Visible = false;

            btnCancel1.Visible = false ;
            btnCancel.Visible = true;

            btnConfirm.Visible = false;
            btnAdd.Visible = true;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string id = gvAccount.Rows[0].Cells[0].Text;
            accounts = (List<Users>)Session["accounts"];

            for (int i = 0; i < accounts.Count; i++)
            {
                if (accounts[i].ID == id)
                {
                    Admins a = new Admins(id, "Admin", accounts[i].FName, accounts[i].LName);
                    FillPrivilages(a);
                    users = (List<Users>)Session["list"];
                    users.Add(a);
                    accounts.Remove(users[i]);
                    Session["accounts"] = accounts;
                    Session["list"] = users;
                }
            }

            Session["Prev"] = Request.UrlReferrer.ToString();
            Response.Redirect("accountmaintenance.aspx");
        }
    }
}