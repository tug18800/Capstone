using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.Accounts.models;

namespace ISSSRewards.Admin.Accounts
{
    public partial class view : System.Web.UI.Page
    {
        List<Users> users;
        List<Admins> admin;
        List<Students> student;

        Users user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                users = (List<Users>)Session["list"];
                user = (Users)Session["user"];

                if(user != null)
                {
                    if(user is Students)
                    {
                        adminPriv.Visible = false;
                        studentStat.Visible = true;
                        Students result = (Students)user;
                        FillStudentLabels(result);
                        student = new List<Students>();
                        student.Add(result);
                        AddPointsField(gvResults);
                        gvResults.DataSource = student;
                        gvResults.DataBind();

                    }
                    else
                    {
                        adminPriv.Visible = true;
                        studentStat.Visible = false;
                        Admins a = (Admins)user;
                        FillAdminPrivileges(a);
                        admin = new List<Admins>();
                        admin.Add((Admins)a);
                        gvResults.DataSource = admin;
                        gvResults.DataBind();
                    }
                }
                else
                {
                    
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountmaintenance.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            users = (List<Users>)Session["list"];
            foreach (Users u in users)
            {
                if (u.ID == gvResults.Rows[0].ID)
                {
                    Session["user"] = u;
                }
            }

            if (b.ID == "btnUpdateEvent")
            {
                
                Response.Redirect("edit.aspx?edit=" + "events");
            }
            else if (b.ID == "btnUpdateRewards")
            {
                Response.Redirect("edit.aspx?edit=" + "rewards");

            }
            else if (b.ID == "btnUpdate")
            {
                Response.Redirect("update.aspx");

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            users = (List<Users>)Session["list"];

            foreach (Users u in users)
            {
                if (txtID.Text == u.ID)
                {
                    lblStatus.Visible = false;

                    if (u is Students)
                    {
                        adminPriv.Visible = false;
                        studentStat.Visible = true;
                        student = new List<Students>();
                        Students result = (Students)u;
                        student.Add(result);
                        AddPointsField(gvResults);
                        gvResults.DataSource = student;
                        gvResults.DataBind();                      
                    }
                    else
                    {
                        adminPriv.Visible = true;
                        studentStat.Visible = false;
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

        private void FillAdminPrivileges(Admins a)
        {
            for (int i = 0; i < ckbxPrivleges.Items.Count; i++)
            {
                if (a.Permissions[i] == true)
                {
                    ckbxPrivleges.Items[i].Selected = true;
                }
                else
                {
                    ckbxPrivleges.Items[i].Selected = false;
                }
            }
        }

        private void FillStudentLabels(Students s)
        {
            lblEventCount.Text = s.Events.Count.ToString();
            lblEventPoint.Text = s.CalcEventPoints().ToString();
            lblRewardCount.Text = s.Rewards.Count.ToString();
            lblRewardPoint.Text = s.CalcRewardPoints().ToString();
        }

        private void AddPointsField(GridView gvResults)
        {
            BoundField bf = new BoundField();
            bf.HeaderText = "Points";
            bf.DataField = "Points";
            gvResults.Columns.Insert(4, bf);
        }

        private void RemovePointsField(GridView gvResults)
        {
            BoundField bf = (BoundField)gvResults.Columns[4];
            if (bf != null && bf is BoundField)
            {
                gvResults.Columns.RemoveAt(4);
            }
        }

    }
}