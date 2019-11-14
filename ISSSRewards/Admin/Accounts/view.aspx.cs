using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Accounts
{
    public partial class view : System.Web.UI.Page
    {
        List<Users> users;
        List<Admins> admin;
        List<Students> student;

        Users user;
        Students s;
        Admins a;
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                users = (List<Users>)Session["list"];
                user = (Users)Session["user"];

                UpdateList(users, user);

                if(user != null)
                {
                    if(user.UserType == "Student")
                    {
                        adminPriv.Visible = false;
                        studentStat.Visible = true;

                        s = (Students)user;
                        FillStudentLabels(s);
                        student = new List<Students>();
                        student.Add(s);
                        AddPointsField(gvResults);
                        gvResults.DataSource = student;
                        gvResults.DataBind();
                    }
                    else
                    {
                        adminPriv.Visible = true;
                        studentStat.Visible = false;
                        a = (Admins)user;
                        FillAdminPrivileges(a);
                        admin = new List<Admins>();
                        admin.Add(a);
                        gvResults.DataSource = admin;
                        gvResults.DataBind();
                    }
                }
                else
                {
                    
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["Prev"]))
            {
                Response.Redirect("accountmaintenance.aspx");
            }
            else
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
                Response.Redirect(Request.QueryString["Prev"]);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            users = (List<Users>)Session["list"];
            foreach (Users u in users)
            {
                if (u.ID == gvResults.Rows[0].Cells[0].Text && u.UserType == "Student")
                {
                    Session["student"] = (Students)u;
                    break;
                }
                else if(u.ID == gvResults.Rows[0].Cells[0].Text && u.UserType == "Admin")
                {
                    Session["admin"] = (Admins)u;
                    break;
                }
            }

            if (b.ID == "btnUpdateEvent")
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
                Response.Redirect("edit.aspx?edit=" + "events");
            }
            else if (b.ID == "btnUpdateRewards")
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
                Response.Redirect("edit.aspx?edit=" + "rewards");

            }
            else if (b.ID == "btnUpdate")
            {
                Session["Prev"] = Request.UrlReferrer.ToString();
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
                        FillStudentLabels(result);
                        gvResults.DataSource = student;
                        gvResults.DataBind();                      
                    }
                    else
                    {
                        adminPriv.Visible = true;
                        studentStat.Visible = false;
                        RemovePointsField(gvResults);
                        admin = new List<Admins>();
                        Admins result = (Admins)u;
                        admin.Add((Admins)u);
                        FillAdminPrivileges(result);
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

        private void UpdateList(List<Users> users, Users user)
        {
            foreach (Users u in users)
            {
                if (u.ID == user.ID)
                {
                    int index = users.IndexOf(u);
                    users.Remove(u);
                    users.Insert(index, user);
                    break;
                }
            }

            Session["list"] = users;
        }

        private void FillAdminPrivileges(Admins a)
        {
            for (int i = 0; i < ckbxPrivleges.Items.Count; i++)
            {

                ckbxPrivleges.Items[i].Selected = a.Permissions[i];

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