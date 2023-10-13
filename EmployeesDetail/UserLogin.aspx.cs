
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using ClassLibrary5;


namespace EmployeesDetail
{



    public partial class UserLogin : System.Web.UI.Page

    
    {
                              
        Class1 obj = new Class1();

        Userdata objone = new Userdata();     
        
      

        string con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)

        {


            //Label1.Text = "Cashed user name : " + userName.Text + ".";


                                                  

            if (!IsPostBack)
            {
                if(Request.Cookies["name"] !=null && Request.Cookies["password"] != null )
                {
                 userName.Text = Request.Cookies["name"].Value;
        
                userPassword.Text = Request.Cookies["password"].Value;

                 ////Label1.Text = "Cashed user name : " + userName.Text + ".";

                }
            }


        }                     


        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Session["permission"] != null)
            {
                Response.Write(" Another User already login. You can not Login ");
             
            }

            else
            {
                string username = userName.Text;

                Session["username"] = username;
                Session["userpassword"] = GetEncrypted(Session["username"].ToString());         

                if ((string)Session["userpassword"] == userPassword.Text.ToLower())
                {

                    if(ChkMe.Checked)
                    {
                        Response.Cookies["name"].Value = userName.Text;
                        Response.Cookies["password"].Value = userPassword.Text;
                        Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(50);
                        Response.Cookies["password"].Expires = DateTime.Now.AddMinutes(50);


                    }

                    else
                    {

                        Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(-1);
                    }

                    DataSet ds = GetPermission(username);
                    DataRow dr = ds.Tables[0].Rows[0];
                    string id = dr["UserId"].ToString();
                    string IsAdded = dr["IsAdded"].ToString();
                    string IsEdit = dr["IsEdit"].ToString();
                    string IsDelete = dr["IsDelete"].ToString();
                    string IsView = dr["IsView"].ToString();

                    ////objone.UserId = Convert.ToInt32(id);
                    objone.UserId = int.Parse(id);
                    objone.UserId = int.Parse(id);
                    objone.IsAdded = bool.Parse(IsAdded);
                    objone.IsEdit = bool.Parse(IsEdit);
                    objone.IsDelete = bool.Parse(IsDelete);
                    objone.IsView = bool.Parse(IsView);

                    Session["permission"] = objone;
                                                                         

                    Response.Redirect("WebForm1.aspx");


                }


            }
        }
               

        public string GetEncrypted(string username)
        {

            string query = "Select Password From Users where UserName=@UserName";
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@UserName", username),
            };

            string encryptedPassword = (string)SqlHelper.ExecuteScalar(con, CommandType.Text, query,parameters);
            string decpassword = "";
            if (encryptedPassword!=null && encryptedPassword!="")
            {
                decpassword=DecodeFrom64(encryptedPassword);
            }
            return decpassword;
        }



        public string DecodeFrom64(string password)
        {
            byte[] todecode_bytes = Convert.FromBase64String(password);
            string result = Encoding.UTF8.GetString(todecode_bytes);
            return result;
        }


        public DataSet GetPermission(string username)
        {
           
        
            //DataSet DatasetTesting = new DataSet();
            DataSet statusdataset = new DataSet();
            SqlParameter[] parameters = new SqlParameter[]
      {
            new SqlParameter("@UserName",username),
      };
            SqlHelper.FillDataset(con, CommandType.StoredProcedure, "SP_getUserPermission", statusdataset, new string[] { "table" }, parameters);
             return statusdataset;

            }

               

        //protected void Login1_Authenticate(object sender, System.Web.UI.WebControls.AuthenticateEventArgs e)
        //{

        //}

        public static void funct()
        {
            int num = 100;
            string name = "Ram";
            string fathername = "Rajeev";

        }


        public void test()
        {


            int i = 12;
            double myDouble = i;

            double myd = 23.21;

            int myint = (int)(myd);

            int m = Convert.ToInt32(myd);
         




        }
    }                     

    }
