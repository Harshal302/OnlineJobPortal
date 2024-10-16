using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string username, password=string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                if (ddlLoginType.SelectedValue == "Admin")
                {
                    username = ConfigurationManager.AppSettings["username"];
                    password = ConfigurationManager.AppSettings["password"];
                    if (username == txtUsername.Text.Trim() && password == txtPass.Text.Trim())
                    {

                        Session["admin"] = username;
                        Response.Redirect("../Admin/Dashboard.aspx", false);

                    }
                    else
                    {
                        showErrormsg("Admin");

                    }

                }
                else
                {

                    con = new SqlConnection(str);
                    string query = @"Select * From [User] Where UserName=@UserName and Password=@Password";

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text.Trim());

                    con.Open();
                    sdr = cmd.ExecuteReader();

                    if (sdr.Read())
                    {
                        Session["user"] = sdr["Username"].ToString();
                        Session["userId"] = sdr["UserId"].ToString();
                        Response.Redirect("Default.aspx", false);

                    }
                    else{
                        showErrormsg("User");

                    }
                    con.Close();
                }
            }

            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                con.Close();

            }
        }

        private void showErrormsg(string userType)
        {
            lblmg.Visible = true;
            lblmg.Text = "<b>" + userType + "</b>Credintional are incorrect";
            lblmg.CssClass = "alert alert-danger";
        }
    }
}