using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Services : System.Web.UI.Page
{
    string cs = @"Data Source=SHIVANG04\SQLEXPRESS;Initial Catalog=mynvs;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cascadingdropdown();
        }
    }
    protected void cascadingdropdown()
    {
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        SqlCommand sqlcomn = new SqlCommand("select * from dbo.filter", sqlconn);
        sqlcomn.CommandType = CommandType.Text;
        FilterDrop.DataSource = sqlcomn.ExecuteReader();
        FilterDrop.DataTextField = "FilterName";
        FilterDrop.DataValueField = "FilterID";
        FilterDrop.DataBind();
        FilterDrop.Items.Insert(0, new ListItem("--Filter Feild--", "0"));
    }
    protected void Filter_SelectedIndexChanged(object sender, EventArgs e)
    {
        int FilterID = Convert.ToInt32(FilterDrop.SelectedValue);
        SqlConnection sqlconn = new SqlConnection(cs);
        sqlconn.Open();
        if (FilterID == 1)
        {
            SqlCommand sqlcomn = new SqlCommand("select * from dbo.type " ,sqlconn);
            sqlcomn.CommandType = CommandType.Text;
            Drop2.DataSource = sqlcomn.ExecuteReader();
            Drop2.DataTextField = "TypeName";
            Drop2.DataValueField = "TypeID";
            Drop2.DataBind();
            Drop2.Items.Insert(0, new ListItem("--Select Type--", "0"));
        }
        else if(FilterID == 2)
        {
            SqlCommand sqlcomn = new SqlCommand("select * from dbo.category ", sqlconn);
            sqlcomn.CommandType = CommandType.Text;
            Drop2.DataSource = sqlcomn.ExecuteReader();
            Drop2.DataTextField = "CategoryName";
            Drop2.DataValueField = "CategoryID";
            Drop2.DataBind();
            Drop2.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }
        else
        {
            SqlCommand sqlcomn = new SqlCommand("select * from dbo.city ", sqlconn);
            sqlcomn.CommandType = CommandType.Text;
            Drop2.DataSource = sqlcomn.ExecuteReader();
            Drop2.DataTextField = "CityName";
            Drop2.DataValueField = "CityID";
            Drop2.DataBind();
            Drop2.Items.Insert(0, new ListItem("--Select City--", "0"));
        }
    }
    protected void txtFilter_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs)) 
        {
            int FilterID = Convert.ToInt32(FilterDrop.SelectedValue);
            SqlConnection sqlconn1 = new SqlConnection(cs);
            sqlconn1.Open();
            if(FilterID==1)
            {
                int TypeID = Convert.ToInt32(Drop2.SelectedValue);
                SqlConnection sqlconn = new SqlConnection(cs);
                sqlconn.Open();
                string sqlcomn = @"SELECT dbo.serviceprovider.SP_ID, dbo.serviceprovider.RegistrationID, dbo.type.TypeName, dbo.category.CategoryName, dbo.serviceprovider.Address, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, 
                  dbo.serviceprovider.Pincode, dbo.serviceprovider.Contact1, dbo.serviceprovider.Contact2, dbo.serviceprovider.Email, dbo.serviceprovider.Website, dbo.serviceprovider.ContactPerson, dbo.serviceprovider.ContactPerson_No
                  FROM     dbo.serviceprovider INNER JOIN
                  dbo.city ON dbo.serviceprovider.City = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.serviceprovider.Category = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.serviceprovider.Country = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.serviceprovider.State = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.serviceprovider.Types = dbo.type.TypeID where dbo.serviceprovider.Types =" + TypeID;
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = sqlcomn;
                cmd2.Connection = con;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd2;
                DataTable dt = new DataTable();
                da1.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else if(FilterID==2)
            {
                int CategoryID = Convert.ToInt32(Drop2.SelectedValue);
                SqlConnection sqlconn = new SqlConnection(cs);
                sqlconn.Open();
                string sqlcomn = @"SELECT dbo.serviceprovider.SP_ID, dbo.serviceprovider.RegistrationID, dbo.type.TypeName, dbo.category.CategoryName, dbo.serviceprovider.Address, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, 
                  dbo.serviceprovider.Pincode, dbo.serviceprovider.Contact1, dbo.serviceprovider.Contact2, dbo.serviceprovider.Email, dbo.serviceprovider.Website, dbo.serviceprovider.ContactPerson, dbo.serviceprovider.ContactPerson_No
                  FROM     dbo.serviceprovider INNER JOIN
                  dbo.city ON dbo.serviceprovider.City = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.serviceprovider.Category = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.serviceprovider.Country = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.serviceprovider.State = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.serviceprovider.Types = dbo.type.TypeID where dbo.serviceprovider.Category =" + CategoryID;
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = sqlcomn;
                cmd2.Connection = con;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd2;
                DataTable dt = new DataTable();
                da1.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                int CityID = Convert.ToInt32(Drop2.SelectedValue);
                SqlConnection sqlconn = new SqlConnection(cs);
                sqlconn.Open();
                string sqlcomn = @"SELECT dbo.serviceprovider.SP_ID, dbo.serviceprovider.RegistrationID, dbo.type.TypeName, dbo.category.CategoryName, dbo.serviceprovider.Address, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, 
                  dbo.serviceprovider.Pincode, dbo.serviceprovider.Contact1, dbo.serviceprovider.Contact2, dbo.serviceprovider.Email, dbo.serviceprovider.Website, dbo.serviceprovider.ContactPerson, dbo.serviceprovider.ContactPerson_No
                  FROM     dbo.serviceprovider INNER JOIN
                  dbo.city ON dbo.serviceprovider.City = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.serviceprovider.Category = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.serviceprovider.Country = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.serviceprovider.State = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.serviceprovider.Types = dbo.type.TypeID where dbo.serviceprovider.City =" + CityID;
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = sqlcomn;
                cmd2.Connection = con;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd2;
                DataTable dt = new DataTable();
                da1.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
    protected void txtView_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string qr1 = @"SELECT dbo.serviceprovider.SP_ID, dbo.serviceprovider.RegistrationID, dbo.type.TypeName, dbo.category.CategoryName, dbo.serviceprovider.Address, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, 
                  dbo.serviceprovider.Pincode, dbo.serviceprovider.Contact1, dbo.serviceprovider.Contact2, dbo.serviceprovider.Email, dbo.serviceprovider.Website, dbo.serviceprovider.ContactPerson, dbo.serviceprovider.ContactPerson_No
                  FROM     dbo.serviceprovider INNER JOIN
                  dbo.city ON dbo.serviceprovider.City = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.serviceprovider.Category = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.serviceprovider.Country = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.serviceprovider.State = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.serviceprovider.Types = dbo.type.TypeID";
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = qr1;
            cmd2.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd2;
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}