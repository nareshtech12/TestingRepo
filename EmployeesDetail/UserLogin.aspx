<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="EmployeesDetail.UserLogin" %>

<%--<%@outputcache duration = "100" varybyparam ="username" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />


<%--  <script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>--%>


</head>
<body>


    <div class="row">
        <div class="col-sm-2"></div>

        <div class="col-sm-6 mt-5">

            <!-- Pills navs -->
            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login" role="tab"
                        aria-controls="pills-login" aria-selected="true">Login</a>
                </li>
                <li class="nav-item" role="presentation">


                    <asp:HyperLink ID="HyperLink3" runat="server" Text="Register" NavigateUrl="RegistrationPage.aspx" class="nav-link" data-mdb-toggle="pill" role="tab">

                    </asp:HyperLink>

                </li>
            </ul>
            <!-- Pills navs -->

            <!-- Pills content -->
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">



                    <form id="form1" runat="server">

                        <div class="text-center mb-3">
                            <p>Sign in :</p>


                        </div>


                        <!-- Email input -->
                        <div class="form-outline mb-4">

                            <asp:TextBox ID="userName" runat="server" class="form-control"></asp:TextBox>

                            <label class="form-label" for="loginName">Username</label>
                        </div>


                        <div class="form-outline mb-4">

                            <asp:TextBox ID="userPassword" runat="server" class="form-control"></asp:TextBox>



                            <label class="form-label" for="loginPassword">Password</label>
                        </div>

                        &nbsp;
                        <asp:CheckBox ID="ChkMe" runat="server" />

                        <asp:Button ID="Button3" runat="server" Text="Login" OnClick="Button1_Click" Style="margin-left: 69px" Width="87px" class="btn btn-primary btn-block mb-4"    />

                           <%--     <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate"> </asp:Login>--%>

                        <!-- Register buttons -->
                        <div class="text-center">
                            <p>
                                Not a member?

        &nbsp;
       
    <asp:HyperLink ID="HyperLink2" runat="server" Text="Register" NavigateUrl="RegistrationPage.aspx"></asp:HyperLink>

                          
                            </p>


                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                        </div>

                    </form>


                </div>
            </div>


        </div>
        <div class="col-sm-2"></div>

    </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
