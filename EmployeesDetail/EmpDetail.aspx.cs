using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using ClassLibrary5;
using Microsoft.ApplicationBlocks.Data;


namespace EmployeesDetail
{
    public partial class Index : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

        Class1 objtwo = new Class1();

        int i = 1000;

        int j = 2000;
        int k = 900;

        protected void Page_Load(object sender, EventArgs e)
        {

          
            BindGridView(1,10, "", "Firstname", "ASC");
 
        }


        protected void GridView2_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            BindGridView(e.NewPageIndex + 1, 10, "", "Firstname", "ASC");           
        }


        public void BindGridView(int pageNo, int pageSize, string searchName, string sortColumn, string sortOrder)
        {
     
            try
            {
                            
                SqlParameter[] parameters =
                {
            new SqlParameter("@PageNo", pageNo),
            new SqlParameter("@PageSize", pageSize),
            new SqlParameter("@SortColumn", sortColumn),
            new SqlParameter("@SortOrder", sortOrder),
            new SqlParameter("@SearchName", searchName)
        };

                DataSet dataSet = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "SP_GetEmployeeBysearchname", parameters);

                if (dataSet != null && dataSet.Tables.Count > 0)
                {
                    GridView2.VirtualItemCount = Convert.ToInt32(dataSet.Tables[0].Rows[0]["MaxRows"]);
                    GridView2.DataSource = dataSet.Tables[0];
                    GridView2.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }



        [System.Web.Script.Services.ScriptMethod()]
        [WebMethod]
        public static string[] SearchEmployees(string prefixText)
        {
            List<string> searchResults = new List<string>();

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString))
            {
                string query = "EXEC SP_ShowemployeeName @SearchTerm";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SearchTerm", prefixText);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string searchResult = reader["Firstname"].ToString();
                        searchResults.Add(searchResult);
                    }

                    connection.Close();
                }
            }

            return searchResults.ToArray();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
        try
            {
          
                SqlParameter[] parameters =
                {
            new SqlParameter("@FirstName", SqlDbType.NVarChar, 50)
            { Value = searchText }
        };
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);


                SqlParameter parameter =  new SqlParameter("@FirstName", searchText);
                DataSet dataSet = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "SP_GetEmployeeByFirstName", parameter);

               if (dataSet != null && dataSet.Tables.Count > 0)
                {
                    GridView2.DataSource = dataSet;
                    GridView2.DataBind();
                }
         
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }                     
               
    }


}





