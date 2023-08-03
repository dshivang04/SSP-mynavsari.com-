using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class volservices : System.Web.UI.Page
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
            SqlCommand sqlcomn = new SqlCommand("select * from dbo.type ", sqlconn);
            sqlcomn.CommandType = CommandType.Text;
            Drop2.DataSource = sqlcomn.ExecuteReader();
            Drop2.DataTextField = "TypeName";
            Drop2.DataValueField = "TypeID";
            Drop2.DataBind();
            Drop2.Items.Insert(0, new ListItem("--Select Type--", "0"));
        }
        else if (FilterID == 2)
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
            if (FilterID == 1)
            {
                int TypeID = Convert.ToInt32(Drop2.SelectedValue);
                SqlConnection sqlconn = new SqlConnection(cs);
                sqlconn.Open();
                string sqlcomn = @"SELECT dbo.voluenteer.VID, dbo.voluenteer.VName, dbo.voluenteer.VContactNo1, dbo.voluenteer.VContactNo2, dbo.voluenteer.VEmail,
                  dbo.voluenteer.VAddress, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, dbo.voluenteer.VPincode,
                  dbo.type.TypeName, dbo.category.CategoryName, dbo.voluenteer.VStart, dbo.voluenteer.VEnd
                  FROM dbo.voluenteer INNER JOIN
                  dbo.city ON dbo.voluenteer.VCity = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.voluenteer.VService = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.voluenteer.VCountry = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.voluenteer.VState = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.voluenteer.VCategory = dbo.type.TypeID where dbo.voluenteer.VCategory =" + TypeID;
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
            else if (FilterID == 2)
            {
                int CategoryID = Convert.ToInt32(Drop2.SelectedValue);
                SqlConnection sqlconn = new SqlConnection(cs);
                sqlconn.Open();
                string sqlcomn = @"SELECT dbo.voluenteer.VID, dbo.voluenteer.VName, dbo.voluenteer.VContactNo1, dbo.voluenteer.VContactNo2, dbo.voluenteer.VEmail, dbo.voluenteer.VAddress, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, dbo.voluenteer.VPincode,
                  dbo.type.TypeName, dbo.category.CategoryName, dbo.voluenteer.VStart, dbo.voluenteer.VEnd
                  FROM     dbo.voluenteer INNER JOIN
                  dbo.city ON dbo.voluenteer.VCity = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.voluenteer.VService = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.voluenteer.VCountry = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.voluenteer.VState = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.voluenteer.VCategory = dbo.type.TypeID where dbo.voluenteer.VCategory =" + CategoryID;
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
                string sqlcomn = @"SELECT dbo.voluenteer.VID, dbo.voluenteer.VName, dbo.voluenteer.VContactNo1, dbo.voluenteer.VContactNo2, dbo.voluenteer.VEmail, dbo.voluenteer.VAddress, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, dbo.voluenteer.VPincode,
                  dbo.type.TypeName, dbo.category.CategoryName, dbo.voluenteer.VStart, dbo.voluenteer.VEnd
                  FROM     dbo.voluenteer INNER JOIN
                  dbo.city ON dbo.voluenteer.VCity = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.voluenteer.VService = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.voluenteer.VCountry = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.voluenteer.VState = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.voluenteer.VCategory = dbo.type.TypeID where dbo.voluenteer.VCity =" + CityID;
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
            string qr1 = @"SELECT dbo.voluenteer.VID, dbo.voluenteer.VName, dbo.voluenteer.VContactNo1, dbo.voluenteer.VContactNo2, dbo.voluenteer.VEmail, dbo.voluenteer.VAddress, dbo.country.CountryName, dbo.state.StateName, dbo.city.CityName, dbo.voluenteer.VPincode,
                  dbo.type.TypeName, dbo.category.CategoryName, dbo.voluenteer.VStart, dbo.voluenteer.VEnd
                  FROM     dbo.voluenteer INNER JOIN
                  dbo.city ON dbo.voluenteer.VCity = dbo.city.CityID INNER JOIN
                  dbo.category ON dbo.voluenteer.VService = dbo.category.CategoryID INNER JOIN
                  dbo.country ON dbo.voluenteer.VCountry = dbo.country.CountryID INNER JOIN
                  dbo.state ON dbo.voluenteer.VState = dbo.state.StateID INNER JOIN
                  dbo.type ON dbo.voluenteer.VCategory = dbo.type.TypeID";
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