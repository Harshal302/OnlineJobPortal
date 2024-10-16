using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class Ragister : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str= ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"insert into [User] (UserName,Password,Name,Address,Mobile,Email,Country) Values 
                    (@UserName,@Password,@Name,@Address,@Mobile,@Email,@Country)";
                cmd=new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPass.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtFullname.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                con.Open();
                int r=cmd.ExecuteNonQuery();

                if (r > 0) 
                { 
                    lblmg.Visible = true;
                    lblmg.Text = "Register Succsessfull";
                    lblmg.CssClass = "alert alert-success";
                    Clear();

                }
                else
                {
                    lblmg.Visible = true;
                    lblmg.Text = "Cannot save record right now,plz try after somtime";
                    lblmg.CssClass = "alert alert-danger";
                }

            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("violation of UNIQUE KEY constraint"))
                {

                    lblmg.Visible = true;
                    lblmg.Text = "<b>" +txtUsername.Text.Trim() +"</b>Username Already Exit";
                    lblmg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");


                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");


            }
            finally { 
            
            con.Close();
            }

          
             


        }

        private void Clear()
        {
            txtUsername.Text= string.Empty;
            txtPass.Text= string.Empty;
            txtConfirmpass.Text= string.Empty;
            txtFullname.Text= string.Empty;
            txtaddress.Text= string.Empty;
            txtEmail.Text= string.Empty;
            txtmobile.Text= string.Empty;
            ddlCountry.ClearSelection();
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }
    }
}