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

public partial class book : System.Web.UI.Page
{
    string film = "";
    string d = "";
    string f = "";
    string t = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string a = Session["use"] as string;
        if (string.IsNullOrEmpty(a) == false)
        {
            tet.Attributes.Add("readonly", "readonly");
            navtoping.InnerHtml = "<ul class='list-unstyled' style='float:right;'><li style='display:inline;'><button data-placement='bottom' data-toggle='popover' data-title='Welcome' data-container='body' type='button' data-html='true' class='btn btn-md btn-success' id='login'>HELLO</button><div id='popover-content' class='hide'><a href='Orders.aspx?u=" + Session["use"] + "'>Your Orders</a><br/><a href='logout.aspx'>Log Out</a></div></li></ul>";
            d = Request.QueryString["d"].ToString();
            f = Request.QueryString["f"].ToString();            
            t = Request.QueryString["t"].ToString();
            string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionstring);
            cn.Open();
            SqlDataAdapter sqlda;
            string query = "select name from movies where id_num ='" + f + "'";
            sqlda = new SqlDataAdapter(query, cn);
            DataSet dataSet = new DataSet();
            sqlda.Fill(dataSet, "movies");            
            foreach (DataTable table in dataSet.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    film = row[0].ToString();
                }
            }
            div2.InnerHtml = "<div class='col-sm-4'><h6>Movie</h6><h5>" + film + "</h5></div><div class='col-sm-4'><h6>Date</h6><h5>" + d + "</h5></div><div class='col-sm-4'><h6>Time</h6><h5>" + t + ":00</h5></div>";
            query = "select seat from book where movie ='"+f+"' and timeo = '"+t+"' and datee = '"+d+"'";
            SqlDataAdapter sqlda1;
            sqlda1 = new SqlDataAdapter(query, cn);
            DataSet dataSet1 = new DataSet();
            sqlda1.Fill(dataSet1, "book");
            string[] arr = new string[50];
            int p = 0;
            foreach (DataTable table in dataSet1.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    arr[p++] = row[0].ToString();
                }
            }
            string toDisplay = string.Join(Environment.NewLine, arr);                        
            string set1 = "";
            string qaz = "";
            for (int i = 1; i < 57; i++)
            {
                for (int j = 0; j < arr.Length; j++)
                {
                    if (i != Convert.ToInt32(arr[j]))
                    {
                        qaz = "<a style='padding:5px;' href='#'><img onclick=\"changeImg(this," + i + ")\" src='Resources/images/buttonA_off.jpg'></a>";
                    }
                    else {
                        qaz = "<a style='padding:5px;' href='#'><img src='Resources/images/seat2.jpg'></a>";
                            break;
                    }
                }
                set1 = set1 + qaz;
            }
            div3.InnerHtml = set1;
            set1 = "";
            for (int i = 57; i < 147; i++)
            {
                for (int j = 0; j < arr.Length; j++)
                {
                    if (i != Convert.ToInt32(arr[j]))
                    {                        
                        qaz = "<a style='padding:5px;' href='#'><img onclick=\"changeImg(this," + i + ")\" src='Resources/images/buttonA_off.jpg'></a>";
                    }
                    else {                        
                        qaz = "<a style='padding:5px;' href='#'><img src='Resources/images/seat2.jpg'></a>";
                            break;
                    }
                }
                set1 = set1 + qaz;
            }
            div4.InnerHtml = set1;
            set1 = "";
            for (int i = 147; i < 203; i++)
            {
                for (int j = 0; j < arr.Length; j++)
                {
                    if (i != Convert.ToInt32(arr[j]))
                    {
                        qaz = "<a style='padding:5px;' href='#'><img onclick=\"changeImg(this," + i + ")\" src='Resources/images/buttonA_off.jpg'></a>";
                    }
                    else { 
                        qaz = "<a style='padding:5px;' href='#'><img src='Resources/images/seat2.jpg'></a>";
                            break;
                    }
                }
                set1 = set1 + qaz;
            }
            div5.InnerHtml = set1;
        }
        else {
            Response.Write("<script>alert('Please Login First');</script>");
            Response.Redirect("index.aspx");
        }
    }

    protected void subbutton_ServerClick(object sender, EventArgs e)
    {        
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlCommand sc = new SqlCommand();
        sc.Connection = cn;
        sc.CommandText = "insert into orderhistory(movie,seat,uname,timeo,datee)values('" + film + "','" + tet.Value + "','" + Session["use"].ToString() + "','" + t + "','" + d + "')";
        sc.ExecuteNonQuery();
        string loc = tet.Value;
        string[] values1 = loc.Split(',');
        for (int i = 0; i < values1.Length; i++)
        {
            values1[i] = values1[i].Trim();
        }
        for (int i = 0; i < values1.Length; i++)
        {
            sc.CommandText = "insert into book(movie,uname,seat,timeo,datee)values('" + f + "','" + Session["use"].ToString() + "','" + values1[i] + "','" + t + "','" + d + "')";
            sc.ExecuteNonQuery();
        }            
        cn.Close();
        Response.Redirect("Orders.aspx?u="+Session["use"].ToString());
    }
}