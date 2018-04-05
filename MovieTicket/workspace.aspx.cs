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

public partial class workspace : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlCommand sc = new SqlCommand();
        sc.Connection = cn;
        sc.CommandText = "select count(id_num) from movies";
        int a = (Int32)sc.ExecuteScalar();
        sc.CommandText = "select count(email) from users";
        int b = (Int32)sc.ExecuteScalar();
        sc.CommandText = "select count(seat) from book";
        int c = (Int32)sc.ExecuteScalar();
        cn.Close();
        span1.InnerHtml = "<i style='font-size:48px' class='icon-film'></i>&nbsp;Now Showing : "+a+"";
        span2.InnerHtml = "<i style='font-size:48px' class='icon-dollar'></i>&nbsp;Ticket Sold : " + c + "";
        span3.InnerHtml = "<i style='font-size:48px' class='icon-user'></i>&nbsp;Total Users : " + b + "";
    }
    protected void Button2_ServerClick(object sender, EventArgs e)
    {
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select timeo , datee from book where movie = '"+ListBox1.SelectedValue+ "'group by timeo,datee";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "movies");        
        List<string> list1 = new List<string>();
        List<string> list2 = new List<string>();
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                list1.Add(row[0].ToString());
                list2.Add(row[1].ToString());
            }
        }
        string content = "";
        for (int i = 0; i < list1.Count; i++ )
        {
            query = "select count (seat) from book where movie = "+ListBox1.SelectedValue+" and timeo = '"+list1[i]+"' and datee = '"+list2[i]+"'";
            DataSet data = new DataSet();
            sqlda = new SqlDataAdapter(query, cn);
            sqlda.Fill(data, "movies");
            foreach (DataTable table in data.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    content = content + "<div class='col-sm-2'></div><div class='col-sm-3'><h5>"+list2[i]+"</h5></div><div class='col-sm-2'><h5>"+list1[i]+" : 00</h5></div><div class='col-sm-3'><h5>"+row[0]+"</h5></div><div class='col-sm-2'></div>";
                }
            }
        }
        lol.InnerHtml = content;
    }
}