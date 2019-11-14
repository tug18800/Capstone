using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ISSSRewards.Admin.models;

namespace ISSSRewards.Admin.Emails
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Email email = LoadEmail();

                txtTitle.Text = email.Title;
                txtBody.Text = email.Body;
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

        private Email LoadEmail()
        {
            List<Email> list = LoadEmailList();

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
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
            string id = Request.QueryString["id"];
            Response.Redirect("view.aspx?id=" + id);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            List<Email> list = Session["emails"] as List<Email>;
            string id = Request.QueryString["id"];

            Email email = new Email(id, txtTitle.Text, txtBody.Text);


            int index = list.FindIndex(item => item.ID == id);
            list[index] = email;

            Session["emails"] = list;
            Response.Redirect("view.aspx?id=" + id);
        }
    }
}