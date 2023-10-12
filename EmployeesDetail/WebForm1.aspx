<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EmployeesDetail.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style>
      
.container {
  display: flex; 
}

.box {
  height: 100px; 
  border: 1px solid #000;
  box-sizing: border-box; 
}

.textbox
{  
    width: 319px;
    margin-left: 151px;   
    height: 37px;
}
          

.labelStyle{
    font-size: 21px;
    }


.employeeId
{

    height: 32px;
    width: 167px;
    margin-left: 210px;
}


.empfirstName
{
    height: 32px;
    width: 319px;
    margin-left: 170px;
}


#lastName
{
    height: 32px;
    width: 319px;
    margin-left: 152px;
}


    #address {
        width: 340px;
        margin-left: 165px;
        height: 32px;
    }

    #mobileNumber{

        width: 340px;
        margin-left: 167px;
        height: 32px;    

    }

    #salary
    {
   width: 340px;
        margin-left: 167px;
        height: 32px;    

    }

    .desg
    {
   width: 340px;
        margin-left: 134px;
        height: 32px;    

    }


 </style>



</head>
<body> 



   <div class="container">
  <div  style="width: 10%;"></div>
  <div class="maindiv" style="width: 80%;">
       <form id="form1" runat="server">

            <asp:Label ID="empId"  runat="server" Text="Employee ID " Class="labelStyle"></asp:Label>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:TextBox ID="employeeId" Class="employeeId" runat="server" style="margin-left: 142px" Width="167px" Height="32px"></asp:TextBox>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
              <br /><br />
                    
            <asp:Label ID="Label1"  runat="server" Text="Employee First Name" Class="labelStyle"></asp:Label> 
           <asp:TextBox ID="firstName" Class="empfirstName" runat="server" style="margin-left: 142px" Width="319px"></asp:TextBox>
              <br /><br />
               <asp:Label ID="Label2" runat="server" Text="Employee Last Name" Class="labelStyle"></asp:Label> 
           <asp:TextBox ID="lastName" runat="server" style="margin-left: 147px" Width="332px"></asp:TextBox>
           <br />
            <br />
            <br />
            <br />       
           <asp:Label ID="designation" runat="server" Text="Select Designation" Class="labelStyle"></asp:Label> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;  

             <asp:DropDownList ID="designationList" runat="server" style="margin-left: 61px" Width="142px" Height="17px" >
                     <asp:ListItem  Value="Manager">Manager</asp:ListItem>
                     <asp:ListItem Value="Clerk">Clerk</asp:ListItem>
                    <asp:ListItem Value="Supervisor">Supervisor</asp:ListItem>
                 </asp:DropDownList>                     

           
              <br />
            <br />
&nbsp;<asp:Label ID="Label4" runat="server" Text="Employee Address" Class="labelStyle"></asp:Label>  <asp:TextBox ID="address"  runat="server" style="margin-left: 170px" Width="340px"></asp:TextBox>
              <br />
               <br />
            <br />
            <br />

      <asp:Label ID="Label8" runat="server" Text="Select Tech " Class="labelStyle" ></asp:Label>  

            <asp:CheckBoxList ID="techList" runat="server" style="margin-left: 331px" Width="159px">
                <asp:ListItem>dotnet</asp:ListItem>
                <asp:ListItem>php</asp:ListItem>
                <asp:ListItem>java</asp:ListItem>
                <asp:ListItem>java script</asp:ListItem>
            </asp:CheckBoxList>
               

            <br />
            <br />
               <br/> <br/>
               <asp:Label ID="Label5" runat="server" Text="Employee Mobile Number" Class="labelStyle" ></asp:Label>  <asp:TextBox ID="mobileNumber" runat="server" style="margin-left: 108px" Width="342px"></asp:TextBox>
               
           
             <br />
               <br/> <br/>
               <asp:Label ID="Label7" runat="server" Text="Select Gender" Class="labelStyle" ></asp:Label> 
 
         
                     
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
           <asp:RadioButtonList ID="genderSelect" runat="server"  style="margin-left: 329px" Width="81px">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
                    
           
               <br/> <br/>
            <asp:Label ID="Label6" runat="server" Text="Employee Salary" Class="labelStyle"></asp:Label>  &nbsp;&nbsp;&nbsp;  <asp:TextBox ID="salary" runat="server" style="margin-left: 169px" Width="116px"></asp:TextBox>
                    <br/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/>

             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" Width="73px" style="height: 26px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="clear" runat="server" Text="Clear" OnClick="clear_Click" Width="70px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="update" runat="server" Text="Update" OnClick="update_Click" Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="employeedetailShow" runat="server" Text="Employee Detail" OnClick="employeedetailshow_Click" Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         
              <asp:GridView ID="GridView1" runat="server"  OnRowDataBound="GridView1_RowDataBound"   OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="233px" OnRowDeleting="GridView1_RowDeleting" style="margin-left: 331px" Width="508px">
                   <Columns>

                       <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
                       <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
                   </Columns>
                   <FooterStyle BackColor="White" ForeColor="#000066" />
                   <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                   <RowStyle ForeColor="#000066" />
                   <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#F1F1F1" />
                   <SortedAscendingHeaderStyle BackColor="#007DBB" />
                   <SortedDescendingCellStyle BackColor="#CAC9C9" />
                   <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

            <br />

         </form>

  </div>
  <div  style="width: 10%;"></div>
   </div>
       
</body>
