<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Ragister.aspx.cs" Inherits="OnlineJobPortal.User.Ragister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section>
        <div class="container pb-50 pb-40">


                     <div class="row">
                     <div class="col-12 pb-20">
                         <asp:Label ID="lblmg" runat="server" Visible="false"></asp:Label>
                           </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">Sign Up</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">
                           <div class="form-contact contact_form">
                        <div class="row">
                            <div class="col-12">
                                <h6>Login Information</h6>
                            </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                     <label>Password</label>
                            <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                                 <label>Confirm Password</label>
                                   <asp:TextBox  ID="txtConfirmpass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" required ></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password & confirm password should be same." ControlToCompare="txtPass" ControlToValidate="txtConfirmpass" ForeColor="red" Display="Dynamic" SetFocusOnError="true" 
                                           Font-size="Small"  ></asp:CompareValidator>
                                    </div>
                                </div>

                            <div class="col-12">
                                <h6>Personal Information</h6>
                            </div>



                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                         <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control" placeholder="Enter your full name" required  ></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in charector" ForeColor="red" Display="Dynamic" SetFocusOnError="true" Font-size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToCompare="txtPass" ControlToValidate="txtFullname" ></asp:RegularExpressionValidator>

                                    </div>
                                </div>

                            <div class="col-12">
                                    <div class="form-group">
                                         <label>Address</label>
                               <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="Enter Adrress" TextMode="MultiLine" required ></asp:TextBox>
                              </div>
                             </div>

                               <div class="col-12">
                            <div class="form-group">
                            <label>Mobile Number</label>
                            <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Numer" TextMode="MultiLine" required ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mobile no must have 10 digit" ForeColor="red" Display="Dynamic" SetFocusOnError="true" Font-size="Small" ValidationExpression="^[0-9]{10}" ControlToCompare="txtPass" ControlToValidate="txtmobile" ></asp:RegularExpressionValidator>

                                 </div>
                                </div>

                                <div class="col-12">
                            <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required ></asp:TextBox>

                                </div>
                                </div>

                            
                                <div class="col-12">
                                <div class="form-group">
                                 <label>Country/Region</label>
                                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="Countryname" DataValueField="Countryname"  >
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country Is Required" ForeColor="red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry" ></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [Countryname] FROM [Country]"></asp:SqlDataSource>
                                </div>
                                </div>




                            

                            </div>
                            <div class="form-group mt-3">
                        <asp:Button ID="btnRegister"  runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnRegister_Click"  />
                             <span class="clickLink"><a class="text-dark" href="../User/Login.aspx">Already Register? Click Here</a></span>
                              </div>

<%--                               <span class="clickLink"><a href="../User/Login.aspx">Already Register? Click Here</a></span>--%>


                      
                     </div> 
                    </div>






         </div>
        </div>
       
    </section>


</asp:Content>
