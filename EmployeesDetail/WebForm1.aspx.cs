using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

using Microsoft.ApplicationBlocks.Data;

namespace EmployeesDetail
{
    public partial class WebForm1 : System.Web.UI.Page
    {



        string con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        Userdata objone = new Userdata();


        protected void Page_Load(object sender, EventArgs e)
        {
      
        

                GetEmployeesDetail();

                objone = (Userdata)Session["permission"];

                if (objone.IsAdded == false)
                {

                    Button1.Enabled = false;
                }


                if (objone.IsEdit == false)
                {

                    update.Enabled = false;
                }


                if (objone.IsView == false)
                {

                    employeedetailShow.Enabled = false;
                }

             }
        
        

        protected void Button1_Click(object sender, EventArgs e)
        {

            string empfname = firstName.Text;
            string emplname = lastName.Text;
            string empdesignation = designationList.SelectedValue;
            string chkboxselect = "";
            for (int i = 0; i < techList.Items.Count; i++)
            {
                if (techList.Items[i].Selected)
                {
                    if (chkboxselect == "")
                    {
                        chkboxselect = techList.Items[i].Text;

                    }

                    else
                    {
                        chkboxselect += "," + techList.Items[i].Text;
                    }
                }
            }

            string tech = chkboxselect;
            string empaddress = address.Text;
            string empmobileNumber = mobileNumber.Text;
            string selectedgender = genderSelect.SelectedValue;
            decimal empsalary;
            if (decimal.TryParse(salary.Text, out empsalary))
            {
                List<SqlParameter> parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@FirstName", empfname));
                parameter.Add(new SqlParameter("@Lastname", emplname));
                parameter.Add(new SqlParameter("@Designation", empdesignation));
                parameter.Add(new SqlParameter("@Tech", tech));
                parameter.Add(new SqlParameter("@Address", empaddress));
                parameter.Add(new SqlParameter("@MobileNumber", empmobileNumber));
                parameter.Add(new SqlParameter("@Gender", selectedgender));
                parameter.Add(new SqlParameter("@Salary", empsalary));
                int rowaffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "SP_EmployeeAdd", parameter.ToArray());
                ClearEmpDetail();
                GetEmployeesDetail();
            }
        }



        public void GetEmployeesDetail()
        {
            try
            {         

            DataSet ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "SP_GetAllEmployee");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

                                    
        void ClearEmpDetail()
        {
            employeeId.Text = "";
            firstName.Text = "";
            lastName.Text = "";
            address.Text = "";
            mobileNumber.Text = "";
            salary.Text = "";
        }
        public void clear_Click(object sender, EventArgs e)
        {
            employeeId.Text = "";
            firstName.Text = "";
            lastName.Text = "";
            address.Text = "";
            mobileNumber.Text = "";
            salary.Text = "";

        }
               

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            employeeId.Text = row.Cells[2].Text;
            firstName.Text = row.Cells[3].Text;
            lastName.Text = row.Cells[4].Text;
            designationList.SelectedValue = row.Cells[5].Text;
            techList.SelectedValue = row.Cells[6].Text;
            address.Text = row.Cells[7].Text;         
            mobileNumber.Text = row.Cells[8].Text;
            genderSelect.SelectedValue = row.Cells[9].Text;
            salary.Text = row.Cells[10].Text;
                       
        }
    
               

        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                int empId = Convert.ToInt32(employeeId.Text);
                string empFirstName = firstName.Text;
                string empLastName = lastName.Text;
                string empDesignation = designationList.SelectedValue;
                string empTech = techList.SelectedValue;
                string empAddress = address.Text;
                string empMobileNumber = mobileNumber.Text;
                string empGender = genderSelect.SelectedValue;
                decimal empSalary = Convert.ToDecimal(salary.Text);

             SqlParameter[] parameters = new SqlParameter[]
                {
            new SqlParameter("@EmpId", empId),
            new SqlParameter("@FirstName", empFirstName),
            new SqlParameter("@LastName", empLastName),
            new SqlParameter("@Designation", empDesignation),
            new SqlParameter("@Tech", empTech),
            new SqlParameter("@Address", empAddress),
            new SqlParameter("@MobileNumber", empMobileNumber),
            new SqlParameter("@Gender", empGender),
            new SqlParameter("@Salary", empSalary)
                };

                int rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "SP_EmployeeUpdate", parameters);

                ClearEmpDetail();
                GetEmployeesDetail();

            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
        


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int empIdToDelete = Convert.ToInt32(row.Cells[2].Text);
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = (new SqlParameter("@EmpId", empIdToDelete));
            int rowAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "SP_DeleteEmployeeById", parameter);
            GetEmployeesDetail();
        }

        protected void employeedetailshow_Click(object sender, EventArgs e)
        {

            Response.Redirect("EmpDetail.aspx");

        }




        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button deleteButton = (Button)e.Row.Cells[1].Controls[0];
                               
                if (objone.IsDelete == false)
                {

                    deleteButton.Enabled = false;
                }
               

            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {



            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("UserLogin.aspx");

        }
    }
}