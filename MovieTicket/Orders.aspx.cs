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

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string a = Session["use"] as string;
        if (string.IsNullOrEmpty(a) == false && Request.QueryString["u"] != null && a == Request.QueryString["u"])
        {
            navtoping.InnerHtml = "<ul class='list-unstyled' style='float:right;'><li style='display:inline;'><button data-placement='bottom' data-toggle='popover' data-title='Welcome' data-container='body' type='button' data-html='true' class='btn btn-md btn-success' id='login'>HELLO</button><div id='popover-content' class='hide'><a href='Orders.aspx?u=" + Session["use"] + "'>Your Orders</a><br/><a href='logout.aspx'>Log Out</a></div></li></ul>";
            string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionstring);
            cn.Open();
            SqlDataAdapter sqlda;
            string query = "select * from orderhistory where uname='"+Session["use"].ToString()+"'";
            sqlda = new SqlDataAdapter(query, cn);
            DataSet dataSet = new DataSet();
            sqlda.Fill(dataSet, "order");
            cn.Close();
            string content = "";
            foreach (DataTable table in dataSet.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    content = content + "<div class='col-sm-3'><h4>" + row[1].ToString() + "</h4></div><div class='col-sm-2'><h5>" + row[5].ToString() + "</h5></div><div class='col-sm-2'><h4>" + row[4].ToString() + " :00</h4></div><div class='col-sm-3'><h4>" + row[2].ToString() + "</h4></div><div class='col-sm-2'><h4>" + row[0].ToString() + "</h4></div>";
                }
            }
            div32.InnerHtml = content;
        }
        else
        {            
            Response.Redirect("index.aspx");
        }
    }
}