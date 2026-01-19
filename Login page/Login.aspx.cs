using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Login_page
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btn_save(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["asp"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                //  Check if username exists
                string checkUser = "SELECT password FROM users_login WHERE user_name=@u";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@u", txtname.Text.Trim());

                object dbPassword = checkCmd.ExecuteScalar();

                // If user NOT exists → auto register
                if (dbPassword == null)
                {
                    string insertUser = "INSERT INTO users_login(user_name,password) VALUES(@u,@p)";
                    SqlCommand insertCmd = new SqlCommand(insertUser, con);
                    insertCmd.Parameters.AddWithValue("@u", txtname.Text.Trim());
                    insertCmd.Parameters.AddWithValue("@p", txtpass.Text.Trim());
                    insertCmd.ExecuteNonQuery();

                    lblresult.Text = "New user created & login successful";
                    lblresult.ForeColor = System.Drawing.Color.Green;
                }
                // User exists → check password
                else if (dbPassword.ToString() == txtpass.Text.Trim())
                {
                    lblresult.Text = "Login Successful";
                    lblresult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblresult.Text = "Wrong Password";
                    lblresult.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
