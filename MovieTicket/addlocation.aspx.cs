using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Net;
using System.Drawing;

public partial class addlocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(lname.Value) == false && String.IsNullOrEmpty(laddress.Value) == false)
        {
            
            string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionstring);
            cn.Open();
            SqlCommand sc = new SqlCommand();
            sc.Connection = cn;
            sc.CommandText = "insert into locations(name,locationaddress,audi_count)values('" + lname.Value + "','" + laddress.Value + "','" + audicount.Value + "')";
            sc.ExecuteNonQuery();
            cn.Close();
            lname.Value = "";
            laddress.Value = "";
            Button1.InnerText = "Submitted";
        }
        else
        {
            Button1.InnerText = "Please Fill Required Fields";
        }
    }
}