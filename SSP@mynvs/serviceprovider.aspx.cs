using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class serviceprovider : System.Web.UI.Page
{
    string cs = @"Data Source=SHIVANG04\SQLEXPRESS;Initial Catalog=mynvs;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        spID.ReadOnly = true;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
        con.Open();
        string qry = "select max(SP_ID) from serviceprovider";
        SqlCommand cmd = new SqlCommand(qry, con);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        int cid = Convert.ToInt32(dr[0]);
        cid++;
        spID.Text = cid.ToString();
        if (!IsPostBack)
        {
            cascadingdropdown();
        }
    }
    protected void cascadingdropdown()
    {
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.country",sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        Country.DataSource = sqlcomn.ExecuteReader();
        Country.DataTextField = "CountryName";
        Country.DataValueField = "CountryID";
        Country.DataBind();
        Country.Items.Insert(0, new ListItem("--Select Country--", "0"));

        SqlConnection sqlconn1 = new SqlConnection(cs);
        sqlconn1.Open();
        SqlCommand sqlcomn1 = new SqlCommand("select * from dbo.type", sqlconn1);
        sqlcomn1.CommandType = CommandType.Text;
        Type.DataSource = sqlcomn1.ExecuteReader();
        Type.DataTextField = "TypeName";
        Type.DataValueField = "TypeID";
        Type.DataBind();
        Type.Items.Insert(0, new ListItem("--Select Type--", "0"));
    }
    protected void Country_SelectedIndexChanged(object sender, EventArgs e)
    {
        int CountryID = Convert.ToInt32(Country.SelectedValue);
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.state where CountryID =" + CountryID, sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        State.DataSource = sqlcomn.ExecuteReader();
        State.DataTextField = "StateName";
        State.DataValueField = "StateID";
        State.DataBind();
        State.Items.Insert(0, new ListItem("--Select State--", "0"));
    }
    protected void State_SelectedIndexChanged(object sender, EventArgs e)
    {
        int StateID = Convert.ToInt32(State.SelectedValue);
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.city where StateID =" + StateID, sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        City.DataSource = sqlcomn.ExecuteReader();
        City.DataTextField = "CityName";
        City.DataValueField = "CityID";
        City.DataBind();
        City.Items.Insert(0, new ListItem("--Select City--", "0"));
    }
    protected void Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.category", sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        Category.DataSource = sqlcomn.ExecuteReader();
        Category.DataTextField = "CategoryName";
        Category.DataValueField = "CategoryID";
        Category.DataBind();
        Category.Items.Insert(0, new ListItem("--Select Category--", "0"));
    }
    protected void txtReg_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[serviceprovider]
                    ([SP_ID],[RegistrationID],[Types],[Category],[Address],[Country],[State],[City],[Pincode],[Contact1],[Contact2],[Email],[Website],[ContactPerson],[ContactPerson_No]) VALUES
                    ('" + spID.Text + "','" + registrationID.Text + "', '" + Type.SelectedItem.Value + "', '" + Category.SelectedItem.Value + "' , '" + txtadd.Text + "' , '" + Country.SelectedItem.Value + "' , '" + State.SelectedItem.Value + "' , '" + City.SelectedItem.Value + "' , '" + txtpin.Text + "' , '" + txtcn1.Text + "', '" + txtcn2.Text + "', '" + txtemail.Text + "', '" + txtweb.Text + "', '" + txtcp.Text + "', '" + txtcpno.Text + "')", con);
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('user is registerd successfully')</script>");
                if (rowsAffected > 0)
                {
                    Label.Text = "Registration successfull.";
                }
                else
                {
                    Label.Text = "Registration failed.";
                }
            }
        }
        catch (Exception)
        {
            // Handle the exception
            Response.Write("<script>alert('An error occurred while registering:')</script>");
            Label.Text = "Registration failed due to an error.";
        }
    }
}