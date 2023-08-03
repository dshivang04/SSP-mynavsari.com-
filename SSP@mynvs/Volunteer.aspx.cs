using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    readonly string cs = @"Data Source=SHIVANG04\SQLEXPRESS;Initial Catalog=mynvs;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        vid.ReadOnly = true;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        string qry = "select max(VID) from voluenteer";
        SqlCommand cmd = new SqlCommand(qry, con);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        int cid = Convert.ToInt32(dr[0]);
        cid++;
        vid.Text = cid.ToString();
        if (!IsPostBack)
        {
            cascadingdropdown();
        }
    }
    protected void cascadingdropdown()
    {
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.country", sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        vctry.DataSource = sqlcomn.ExecuteReader();
        vctry.DataTextField = "CountryName";
        vctry.DataValueField = "CountryID";
        vctry.DataBind();
        vctry.Items.Insert(0, new ListItem("--Select Country--", "0"));

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
        int CountryID = Convert.ToInt32(vctry.SelectedValue);
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.state where CountryID =" + CountryID, sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        vst.DataSource = sqlcomn.ExecuteReader();
        vst.DataTextField = "StateName";
        vst.DataValueField = "StateID";
        vst.DataBind();
        vst.Items.Insert(0, new ListItem("--Select State--", "0"));
    }
    protected void State_SelectedIndexChanged(object sender, EventArgs e)
    {
        int StateID = Convert.ToInt32(vst.SelectedValue);
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.city where StateID =" + StateID, sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        vcity.DataSource = sqlcomn.ExecuteReader();
        vcity.DataTextField = "CityName";
        vcity.DataValueField = "CityID";
        vcity.DataBind();
        vcity.Items.Insert(0, new ListItem("--Select City--", "0"));
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
                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[voluenteer]
            ([VID],[VName],[VContactNo1],[VContactNo2],[VEmail],[VAddress],[VCity],[VState],[VCountry],[VPincode],[VCategory],[VService],[VStart],[VEnd]) VALUES
            ('" + vid.Text + "','" + vname.Text + "', '" + vnumber1.Text + "', '" + vnumber2.Text + "' , '" + vemail.Text + "' , '" + vadd.Text + "' , '" + vctry.SelectedItem.Value + "' , '" + vst.SelectedItem.Value + "' , '" + vcity.SelectedItem.Value + "' , '" + vpin.Text + "' , '" + Type.SelectedItem.Value + "', '" + Category.SelectedItem.Value + "','" + vstdt.Text +"','" + vendt.Text +"')", con);
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('user is registerd successfully')</script>");
                if (rowsAffected > 0)
                {
                    vlbl.Text = "Registration successfull.";
                }
                else
                {
                    vlbl.Text = "Registration failed.";
                }

            }
        }
        catch (Exception)
        {
            // Handle the exception
            Response.Write("<script>alert('An error occurred while registering OR User is already Registered.')</script>");
            vlbl.Text = "Registration failed due to an error OR User is already Registered.";
        }
    }
}