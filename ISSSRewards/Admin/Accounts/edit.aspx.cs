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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Students s = (Students)Session["user"];
                student = new List<Students>();
                student.Add(s);

                gvStudent.DataSource = student;
                gvStudent.DataBind();
                string edit = Request.QueryString["edit"];



                if(edit == "events")
                {
                    
                    gvRewards.Visible = false;
                    List<Event> events = LoadEventList();
                    BindDDL(s, events);
                    BindEventGV(student, gvEvents);
                    
                }
                else if(edit == "rewards")
                {
                    gvEvents.Visible = false;
                    List<Reward> rewards = LoadRewardList();
                    BindDDL(s, rewards);
                }

                
            }
        }

        private void BindEventGV(List<Students> student, GridView gvEvents)
        {
            gvEvents.DataSource = student[0].Events;
            gvEvents.DataBind();
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

        protected void btnAddSelector_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
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
                foreach (Reward re in rewards)
                {
                    if (r.ID == re.ID)
                    {
                        rewards.Remove(re);
                    }
                }
            }

            ddlSelector.DataSource = rewards;
            ddlSelector.DataBind();
        }
    }
}


