using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace WebForm1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string gender = "Not Mentioned";

        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            gender = "Male";
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            gender = "Female";
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            gender = "Other";
        }

        protected void reg_Click(object sender, EventArgs e)
        {
            if (fname.Text.Length != 0 && lname.Text.Length != 0 && cnum.Text.Length != 0 && dob.Text.Length != 0 && (gender.Equals("Male") || gender.Equals("Female") || gender.Equals("Other")) && adr.Text.Length != 0 && email.Text.Length != 0 && aplimg.HasFiles)
            {
                string extension = Path.GetExtension(aplimg.FileName);
                if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                {

                    string filenm = cnum.Text;
                    string loc = @"~\01 Appl Img";
                    string pathstr = System.IO.Path.Combine(loc, filenm);
                    aplimg.SaveAs(Server.MapPath(pathstr));

                    string security = @"Data Source = SHIVANG04\SQLEXPRESS; Initial Catalog = internform; Integrated Security = True";
                    SqlConnection con = new SqlConnection(security);
                    SqlCommand cmdins = new SqlCommand(@"INSERT INTO [dbo].[Regform]
                    (
                    [FirstName]
                    ,[LastName]
                    ,[Phone]
                    ,[DateofBirth]
                    ,[Gender]
                    ,[Address]
                    ,[Email]
                    ,[Image])
                VALUES
                    ('" + fname.Text + "','" + lname.Text + "','" + cnum.Text + "','" + dob.Text + "','" + gender + "','" + adr.Text + "','" + email.Text + "','" + cnum.Text + "')", con);
                    con.Open();
                    cmdins.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("WebForm1.aspx");
                }
                else
                {
                    lblmsg.Text = "Please insert .jpg or .jpeg or .png image";
                }
            }
            else
            {
                lblmsg.Text = "All The Fields are Compulsory";
            }
        }
        protected void upd_Click(object sender, EventArgs e)
        {
            if (fname.Text.Length != 0 && lname.Text.Length != 0 && cnum.Text.Length != 0 && dob.Text.Length != 0 && gender.Length != 0 && adr.Text.Length != 0 && email.Text.Length != 0)
            {
                string security = @"Data Source = SHIVANG04\SQLEXPRESS; Initial Catalog = internform; Integrated Security = True";
                SqlConnection con = new SqlConnection(security);
                SqlCommand cmdins = new SqlCommand(@"UPDATE [dbo].[Regform] SET [FirstName] = '" + fname.Text + "',[LastName] = '" + lname.Text + "',[Phone] = '" + cnum.Text + "',[DateofBirth] = '" + dob.Text + "',[Gender] = '" + gender + "',[Address] = '" + adr.Text + "',[Email] = '" + email.Text + "' WHERE [Phone]='" + cnum.Text + "'", con);
                con.Open();
                cmdins.ExecuteNonQuery();
                con.Close();
                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                lblmsg.Text = "All The Fields are Compulsory";
            }
        }

        protected void del_Click(object sender, EventArgs e)
        {
            if (cnum.Text.Length != 0)
            {
                string security = @"Data Source = SHIVANG04\SQLEXPRESS; Initial Catalog = internform; Integrated Security = True";
                SqlConnection con = new SqlConnection(security);
                SqlCommand cmdins = new SqlCommand(@"DELETE FROM[dbo].[Regform]
             WHERE ([Phone]='" + cnum.Text + "')", con);
                con.Open();
                cmdins.ExecuteNonQuery();
                con.Close();
                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                lblmsg.Text = "Contact Number is Compulsory";
            }

        }
        protected void sea_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }

    }
}