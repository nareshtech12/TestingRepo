using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace EmployeesDetail
{
    public partial class Registration : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userfname = FirstName.Text;
            string userlname = LastName.Text;
            string username = UserName.Text;
          
            string selectedgender = genderSelect.SelectedValue;
            string userpassword = Password.Text;
            string usermobileNumber = mobileNumber.Text;
            string usergender = genderSelect.SelectedValue;
            List<SqlParameter> parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@FirstName", userfname));
            parameter.Add(new SqlParameter("@Lastname", userlname));
            parameter.Add(new SqlParameter("@UserName", username));   
            parameter.Add(new SqlParameter("@Gender", usergender));
            parameter.Add(new SqlParameter("@Password", userpassword));
            parameter.Add(new SqlParameter("@MobileNumber", usermobileNumber));
            int rowaffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "SP_UserAdd", parameter.ToArray());                                         
                       
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("User.aspx");

        }
    }
}