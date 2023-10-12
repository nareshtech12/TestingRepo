<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="EmployeesDetail.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                            <form id="form1" runat="server">
                                <div class="row">
                                    <div class="col-md-6 mb-4">

                                        <div class="form-outline">

                                            <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                                            <label class="form-label" for="firstName">First Name</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4">

                                        <div class="form-outline">

                                            <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                                            <label class="form-label" for="lastName">Last Name</label>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4 d-flex align-items-center">

                                        <div class="form-outline datepicker w-100">

                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <label for="birthdayDate" class="form-label">User Name</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4">

                                        <h6 class="mb-2 pb-1">Gender: </h6>

                                        <div class="form-check form-check-inline">
                                            <asp:RadioButtonList ID="genderSelect" runat="server">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4 pb-2">

                                        <div class="form-outline">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>


                                            <label class="form-label" for="firstName">Password</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4 pb-2">

                                        <div class="form-outline">
                                     <asp:TextBox ID="mobileNumber" runat="server" ></asp:TextBox>

                           <%--                 <asp:RegularExpressionValidator ID="mobileNo" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>--%>
                                            
                                            <label class="form-label" for="phoneNumber">Phone Number</label>
                                        </div>

                                    </div>
                                </div>



                                <div class="mt-4 pt-2">

                                    <asp:Button ID="Button2" class="btn btn-primary btn-lg" runat="server" Text="Sign Up" OnClick="Button2_Click" />

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
                    <asp:Button ID="Button4" class="btn btn-primary btn-lg" runat="server" Text="Clear" OnClick="Button4_Click" />
                              
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" class="btn btn-primary btn-lg" runat="server" Text=" Go to Login Page" OnClick="Button3_Click" />
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/bootstrap.min.js"></script>


</body>
</html>
