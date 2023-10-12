using Microsoft.ApplicationBlocks.Data;
using System;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace EmployeesDetail
{
    public partial class User : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = userName.Text;
            string userpassword = userPassword.Text;

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@UserName", username),
        new SqlParameter("@Password", userpassword),
            };

            int rowsAffected = (Int32)SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "SP_loginUser", parameters);
            if (rowsAffected >0)
            {
                Response.Redirect("EmpDetail.aspx");
            }
            else
            {

                Response.Write("User is not exist please register first");

            }
        }                                   

               

        protected void Button2_Click(object sender, EventArgs e)
        {


            Response.Redirect("Registration.aspx");

        }

        protected void userName_TextChanged(object sender, EventArgs e)
        {
             
        }
    }
}
