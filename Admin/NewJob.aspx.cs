using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.Admin
{
    public partial class NewJob : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string concatQuery,imagePath = string.Empty;
                bool isValidToExcute = false;
                con = new SqlConnection(str);

                //if (FuCompanyLogo.HasFile)
                //{
                //    if (IsValidExtension(FuCompanyLogo.FileName))
                //    {
                //        concatQuery=
                //    }
                //    else
                //    {

                //    }
                //}
                //else
                //{


                //}
              query = "insert into Jobs values(@Title,@NoOfPost,@Discription,@Qulification,@Experience,@Specilization,@LastDateToApply,@Salary,@JobType,@Companyname,@CompanyImage,@Website,@Email,@Address,@Country,@State,@CreateDate)";
                DateTime time = DateTime.Now;
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@NoOfPost", txtnoPost.Text.Trim());
                cmd.Parameters.AddWithValue("@Discription", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Qulification", txtQualification.Text.Trim());
                cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());

                cmd.Parameters.AddWithValue("@Specilization", txtSpecilization.Text.Trim());
                cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                cmd.Parameters.AddWithValue("@JobType", ddlJobtype.SelectedValue);
                cmd.Parameters.AddWithValue("@Companyname",txtCompany.Text.Trim());

                //cmd.Parameters.AddWithValue("@CompanyImage", txtSalary.Text.Trim());
                cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);

                cmd.Parameters.AddWithValue("@State", txtSalary.Text.Trim());
                cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));

                if (FuCompanyLogo.HasFiles) 
                {

                    if (IsValidExtension(FuCompanyLogo.FileName))
                    {
                        Guid obj = Guid.NewGuid();
                        imagePath = "Images/" + obj.ToString() + FuCompanyLogo.FileName;
                        FuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + FuCompanyLogo.FileName);
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExcute = true;

                    }
                    else
                    {
                        lblMsg.Text = "Please Select .jpg,.jpeg,.png file For Logo";
                        lblMsg.CssClass = "alert alert-danger";

                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                    isValidToExcute = true;

                }
                if (isValidToExcute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "Job Save Successfully";
                        lblMsg.CssClass = "alert alert-Primary";
                        Clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot Saved the Record,please try again sometime..!";
                      lblMsg.CssClass = "alert alert-danger";

                    }


                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");


            }
            finally
            {
                con.Close();
            }

        }

        private void Clear()
        {
            txtJobTitle.Text = string.Empty;
            txtnoPost.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtQualification.Text = string.Empty;
            txtSpecilization.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtLastDate.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtCompany.Text = string.Empty;
            txtWebsite.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtState.Text = string.Empty;
            ddlCountry.ClearSelection();
            ddlJobtype.ClearSelection();
           

        }

        private bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] FileExtention = { ".jpg", ".png", "jpeg" };
            for(int i = 0; i <= FileExtention.Length-1; i++)
            {
                if (fileName.Contains(FileExtention[i])) 
                {
                    isValid = true;
                    break;
                
                }
            }
            return isValid;
        }
    }
}