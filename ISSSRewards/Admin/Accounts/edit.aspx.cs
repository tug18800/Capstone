using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.Accounts.models;

namespace ISSSRewards.Admin.Accounts
{
    public partial class edit : System.Web.UI.Page
    {
        List<Students> student;
        List<Event> events;
        List<Reward> rewards;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Students s = (Students)Session["user"];
                student = new List<Students>();
                student.Add(s);

                BindStudentGV(student);
                string edit = Request.QueryString["edit"];
                
                if(edit == "events")
                {
                    
                    gvRewards.Visible = false;
                    gvEvents.Visible = true;
                    events = LoadEventList();
                    BindDDL(s, events);
                    BindEventGV(student, gvEvents);
                    
                }
                else if(edit == "rewards")
                {
                    gvEvents.Visible = false;
                    gvRewards.Visible = true;
                    rewards = LoadRewardList();
                    BindDDL(s, rewards);
                    BindRewardGV(student, gvEvents);
                }             
            }
        }

        private void BindStudentGV(List<Students> student)
        {
            student[0].CalcPoints();
            gvStudent.DataSource = student;
            gvStudent.DataBind();
        }

        private void BindEventGV(List<Students> student, GridView gvEvents)
        {
            gvEvents.DataSource = student[0].Events;
            gvEvents.DataBind();
        }

        private void BindRewardGV(List<Students> student, GridView gvEvents)
        {
            gvRewards.DataSource = student[0].Rewards;
            gvRewards.DataBind();
        }

        private List<Reward> LoadRewardList()
        {
            List<Reward> list = new List<Reward>();
            Reward r = new Reward("001", "Sample Reward1", "01/02/2019", 100);
            list.Add(r);
            r = new Reward("002", "Sample Reward2", "02/03/2019", 100);
            list.Add(r);
            r = new Reward("003", "Sample Reward3", "03/04/2019", 100);
            list.Add(r);
            return list;
        }

        protected List<Event> LoadEventList()
        {
            List<Event> list = new List<Event>();
            Event ev = new Event("001", "Sample Event1", "01/01/2019", 250);
            list.Add(ev);
            ev = new Event("002", "Sample Event2", "02/02/2019", 250);
            list.Add(ev);
            ev = new Event("003", "Sample Event3", "03/03/2019", 250);
            list.Add(ev);
            ev = new Event("004", "Sample Event4", "04/04/2019", 250);
            list.Add(ev);
            return list;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("view.aspx");

        }

        private void BindDDL(Students s, List<Event> events)
        {
            foreach (Event ev in s.Events)
            {
                for(int i = 0; i < events.Count; i++)
                {
                    if (ev.ID == events[i].ID)
                    {
                        events.RemoveAt(i);
                    }
                }                                  
            }

            ddlSelector.DataTextField = "Title";
            ddlSelector.DataValueField = "ID";
            ddlSelector.DataSource = events;
            ddlSelector.DataBind();
        }

        private void BindDDL(Students s, List<Reward> rewards)
        {
            foreach (Reward r in s.Rewards)
            {
                for (int i = 0; i < rewards.Count; i++)
                {
                    if (r.ID == rewards[i].ID)
                    {
                        rewards.RemoveAt(i);
                    }
                }
            }
            
            ddlSelector.DataTextField = "Title";
            ddlSelector.DataValueField = "ID";
            ddlSelector.DataSource = rewards;
            ddlSelector.DataBind();
        }

        protected void gvEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Students s = (Students)Session["user"];
            student = new List<Students>();
            string ID = gvEvents.Rows[e.RowIndex].Cells[0].Text;

            for(int i =0; i < s.Events.Count; i++)
            {
                if (s.Events[i].ID == ID)
                {
                    s.Events.RemoveAt(i);
                }
            }

            student.Add(s);
            events = LoadEventList();
            BindDDL(s, events);
            BindEventGV(student, gvEvents);
            BindStudentGV(student);
            Session["user"] = s;
        }

        protected void gvRewards_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Students s = (Students)Session["user"];
            student = new List<Students>();
            string ID = gvRewards.Rows[e.RowIndex].Cells[0].Text;

            for (int i = 0; i < s.Rewards.Count; i++)
            {
                if (s.Rewards[i].ID == ID)
                {
                    s.Rewards.RemoveAt(i);
                }
            }

            student.Add(s);
            rewards = LoadRewardList();
            BindDDL(s, rewards);
            BindRewardGV(student, gvRewards);
            BindStudentGV(student);
            Session["user"] = s;
        }

        protected void btnAddSelector_Click(object sender, EventArgs e)
        {
            string edit = Request.QueryString["edit"];
            Students s = (Students)Session["user"];
            student = new List<Students>();


            if (edit == "events")
            {
                events = LoadEventList();
                string id = ddlSelector.SelectedValue;

                foreach (Event ev in events)
                {
                    if (ev.ID == id)
                    {
                        s.Events.Add(ev);
                        break;
                    }
                }

                student.Add(s);             
                BindEventPage(s, events);
            }
            else if (edit == "rewards")
            {
                rewards = LoadRewardList();
                string id = ddlSelector.SelectedValue;

                foreach (Reward r in rewards)
                {
                    if (r.ID == id)
                    {
                        s.Rewards.Add(r);
                        break;
                    }
                }

                student.Add(s);
                BindRewardPage(s, rewards);
            }
        }

        private void BindEventPage(Students s, List<Event> events)
        {
            BindDDL(s, events);
            BindEventGV(student, gvEvents);
            BindStudentGV(student);
            Session["user"] = s;
        }

        private void BindRewardPage(Students s, List<Reward> rewards)
        {
            BindDDL(s, rewards);
            BindRewardGV(student, gvRewards);
            BindStudentGV(student);
            Session["user"] = s;
        }
    }
}


