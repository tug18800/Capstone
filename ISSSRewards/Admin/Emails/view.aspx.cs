using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Emails
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Email email = LoadEmail();

                if(email != null)
                {
                    lblType.Text = GetEmailType();
                    lblTitle.Text = email.Title;
                    lblBody.Text = email.Body;
                }

                
            }
        }

        private string GetEmailType()
        {
            string id = Request.QueryString["id"];
            string emailType = "";
            switch (id)
            {
                case "1": emailType = "Returning Student"; break;
                case "2": emailType = "New Student"; break;
                case "3": emailType = "Order Confirmation"; break;
                case "4": emailType = "Pending Reward Notification"; break; 
                case "5": emailType = "Order Complete Notifcation"; break;
            }

            return emailType + " Email";
        }

        private Email LoadEmail()
        {
            List<Email> list = LoadEmailList(); 

            if(!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string id = Request.QueryString["id"];

                Email email = list[list.FindIndex(item => item.ID == id)];

                return email;
            }

            return null;
        }

        private List<Email> LoadEmailList()
        {
            List<Email> list = Session["emails"] as List<Email>;

            return list;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("email.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect("edit.aspx?id=" + id);
        }
    }
}