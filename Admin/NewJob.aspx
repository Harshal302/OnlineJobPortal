<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="OnlineJobPortal.Admin.NewJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container pt-4 pb-4">

            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>

            <h3 class="text-center">Add Job</h3>
            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtJobTitle" style="font-weight: 600">Job Title</label>

                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex.Web Developer,App Developer" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtnoPost" style="font-weight: 600">No Of Post</label>

                    <asp:TextBox ID="txtnoPost" runat="server" CssClass="form-control" placeholder="Enter Number Of Position" TextMode="Number" required></asp:TextBox>
                </div>


            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtDescription" style="font-weight: 600">Description</label>

                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Job Description" TextMode="MultiLine" required></asp:TextBox>
                </div>

            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtQualification" style="font-weight: 600">Job Qualification/Education Required</label>

                    <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="Ex.BTech,MCA,MBA" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtExperience" style="font-weight: 600">Experience Required</label>

                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Ex: 2 Years,1.5 Years" required></asp:TextBox>
                </div>


            </div>


            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSpecilization" style="font-weight: 600">Specilization Requied</label>

                    <asp:TextBox ID="txtSpecilization" runat="server" CssClass="form-control" placeholder="Enter Specilization" TextMode="MultiLine" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtLastDate" style="font-weight: 600">Last Date To Apply</label>

                    <asp:TextBox ID="txtLastDate" runat="server" CssClass="form-control" placeholder="Enter the Last Date To Apply" TextMode="Date" required></asp:TextBox>
                </div>


            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSalary" style="font-weight: 600">Salary</label>
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Ex: 25000/Month,7L/year" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="ddlJobtype" style="font-weight: 600">Job Type</label>
                    <asp:DropDownList ID="ddlJobtype" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select Job Type</asp:ListItem>
                        <asp:ListItem>Full-Time</asp:ListItem>
                        <asp:ListItem>Part-Time</asp:ListItem>
                        <asp:ListItem>Remote</asp:ListItem>
                        <asp:ListItem>Freelance</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Job Type is Required" ForeColor="Red" ControlToValidate="ddlJobtype" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtCompany" style="font-weight: 600">Company/Orgnization Name</label>
                    <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="Enter Company/Orgnization Name " required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="ddlJobtype" style="font-weight: 600">Company/Orgnization Logo</label>
                    <asp:FileUpload ID="FuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg .jpeg .png extension only" />
                </div>


            </div>



            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtWebsite" style="font-weight: 600">Website</label>

                    <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" placeholder="Enter Website" TextMode="Url"></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtEmail" style="font-weight: 600">Email</label>

                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required></asp:TextBox>
                </div>


            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtAddress" style="font-weight: 600">Address</label>

                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Work Location" TextMode="MultiLine" required></asp:TextBox>
                </div>

            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtWebsite" style="font-weight: 600">Country</label>
                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="Countryname" DataValueField="Countryname">
                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Country Is Required" ForeColor="red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [Countryname] FROM [Country]"></asp:SqlDataSource>

                </div>


                <div class="col-md-6 pt-3">
                    <label for="txtState" style="font-weight: 600">State</label>

                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter State"  required></asp:TextBox>
                </div>

            </div>

               <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
       <div class="col-md-3 col-md-offset-2 mb-3">
           <asp:Button ID="BtnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf" Text="Add Job" OnClick="BtnAdd_Click" />

       </div>


   </div>



        </div>
     
    </div>

</asp:Content>
