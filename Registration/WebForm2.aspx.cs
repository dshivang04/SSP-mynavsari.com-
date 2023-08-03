using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using WebForm1;
using System.Configuration;

namespace Intern_Pro1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fltall_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }

        protected void flt_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }
    }
}