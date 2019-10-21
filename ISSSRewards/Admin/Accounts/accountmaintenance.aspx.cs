using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.Accounts.models;

namespace ISSSRewards.Admin.Accounts
{
    public partial class accountmaintenance : System.Web.UI.Page
    {
        
        List<Users> users;
        List<Students> student;
        List<Admins> admin;
        protected void Page_Load(object sender, EventArgs e)
        {
            users = LoadUsers();
        }

        private List<Users> LoadUsers()
        {
            List<Users> list = new List<Users>();
            Students s = AddStudent();

            Admins a = AddAdmin();

            list.Add(s);
            list.Add(a);

            return list;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            foreach (Users u in users)
            {
                if (txtID.Text == u.ID)
                {
                    lblStatus.Visible = false;

                    if (u is Students)
                    { 
                        student = new List<Students>();
                        Students result = (Students)u;
                        AddPointsField(gvResults);
                        student.Add(result);
                        gvResults.DataSource = student;
                        gvResults.DataBind();
                    }
                    else
                    {
                        RemovePointsField(gvResults);
                        admin = new List<Admins>();
                        admin.Add((Admins)u);
                        gvResults.DataSource = admin;
                        gvResults.DataBind();
                    }

                    return;
                }
                else
                {
                    lblStatus.Text = "Account Not Found!";
                    lblStatus.Visible = true;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("../dashboard.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("add.aspx");

        }

        protected void gvResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvResults.SelectedRow.Cells[0].Text;

            foreach (Users u in users)
            {
                if (u.ID == id)
                {
                    Session["list"] = users;
                    Session["user"] = u;
                    Response.Redirect("view.aspx");
                }
            }
        }

        private void AddPointsField(GridView gvResults)
        {
            BoundField bf = new BoundField();
            bf.HeaderText = "Points";
            bf.DataField = "Points";
            gvResults.Columns.Insert(4,bf);
        }

        private void RemovePointsField(GridView gvResults)
        {
            try
            {
                BoundField bf = (BoundField)gvResults.Columns[4];
                if (bf != null && bf.HeaderText == "Points")
                {
                    gvResults.Columns.RemoveAt(4);
                }
            }
            catch
            {

            }
        }

        private Admins AddAdmin()
        {
            Admins a = new Admins("0000000002", "Admin", "Test", "Testly");
            a.Permissions.Add(false);
            a.Permissions.Add(false);
            a.Permissions.Add(false);
            a.Permissions.Add(true);

            return a;
        }

        private Students AddStudent()
        {
            Students s = new Students("0000000001", "Student", "Keeth", "Spindler");
            Event e = new Event("001", "Sample Event1", "01/01/2019", 250);
            s.Events.Add(e);
            e = new Event("002", "Sample Event2", "02/02/2019", 250);
            s.Events.Add(e);
            e = new Event("003", "Sample Event3", "03/03/2019", 250);
            s.Events.Add(e);
            s.CalcPoints();

            return s;
        }
    }
}