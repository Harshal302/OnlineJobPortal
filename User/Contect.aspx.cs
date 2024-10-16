using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;

namespace OnlineJobPortal.User
{
    public partial class Contect : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
  
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                String query = @"Insert into Contact values (@Name,@Email,@Subject,@Message)";
                cmd=new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());
                con.Open();
               int r= cmd.ExecuteNonQuery();
                if (r > 0) 
                { 
                     lblmg.Visible = true;
                     lblmg.Text = "Thaks For reching out will look into query";
                     lblmg.CssClass = "alert alert-success";
                     Clear();


                }
                else
                {
                    lblmg.Visible = true;
                    lblmg.Text = "cannot save record right now,plz try after sometimes..!";
                    lblmg.CssClass = "alert alert-danger";
                }




            }
            catch (Exception ex) 
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");   
            
            }
            finally
            {
                con.Close();
            }

        }

        private void Clear()
        {
            name.Value=string.Empty;
            email.Value = string.Empty;
            subject.Value = string.Empty;
            message.Value = string.Empty;
        }
    }
}