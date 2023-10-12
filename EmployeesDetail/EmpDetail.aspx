<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpDetail.aspx.cs" Inherits="EmployeesDetail.Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>

        <div>

               <br />
               <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
             Search Employee by First Name:-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             

                       
          <asp:TextBox ID="txtSearch" runat="server" onkeypress="searchEmployees();" ></asp:TextBox>                                


            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" Enabled="true" TargetControlID="txtSearch" EnableCaching="false"   MinimumPrefixLength="1" ServiceMethod="SearchEmployees"  >
            </cc1:AutoCompleteExtender>


               &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
            
       <asp:Button ID="Button1" runat="server" Height="33px" Text="Search" Width="83px"  OnClick="Button1_Click"   />
               

            <br />
               <br />



        &nbsp;
  <asp:GridView ID="GridView2" runat="server" AllowCustomPaging="true" AllowPaging="true" style="margin-left: 306px" Width="1057px" OnPageIndexChanging="GridView2_PageIndexChanging" ClientIDMode="Static">

        

                  <columns>

                   </columns>
                   <footerstyle backcolor="white" forecolor="#000066" />
                   <headerstyle backcolor="#006699" font-bold="true" forecolor="white" />
                   <PagerSettings FirstPageText="First" LastPageText="Last" PageButtonCount="5" />
                   <pagerstyle backcolor="white" forecolor="#000066" horizontalalign="left" />
                   <rowstyle forecolor="#000066" />
                   <selectedrowstyle backcolor="#669999" font-bold="true" forecolor="white" />
                   <sortedascendingcellstyle backcolor="#f1f1f1" />
                   <sortedascendingheaderstyle backcolor="#007dbb" />
                   <sorteddescendingcellstyle backcolor="#cac9c9" />
                   <sorteddescendingheaderstyle backcolor="#00547e" />

           </asp:GridView>


        </div>

    


    </form>


<script type="text/javascript">
   
    function searchEmployees() {
   debugger
    var prefixText = $('#<%= txtSearch.ClientID %>').val();

    $.ajax({
        type: 'POST',
        url: 'EmpDetail.aspx/SearchEmployees',
        data: JSON.stringify({ prefixText: prefixText }),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            debugger
            var autoCompleteExtender = $find('<%= AutoCompleteExtender1.ClientID %>');
            autoCompleteExtender.set_contextKey('');
            autoCompleteExtender._completionListElement.innerHTML = ''; 
            var searchResults = result.d;
            autoCompleteExtender._update('', searchResults); 
        },
        error: function (error) {
            alert(' Error occurred: ' + error.responseText);
            
        }
    });
}

</script>



</body>
</html>
