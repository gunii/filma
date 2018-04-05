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

public partial class ashows : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Visible = false;
        Button2.Visible = false;
    }
    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();        
        SqlDataAdapter sqlda;
        string query = "select * from shows where movie_id = "+ListBox1.SelectedValue+" and audi = '"+ListBox4.SelectedValue+"' and location = '"+ ListBox2.SelectedValue +"'";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "updatecheck");        
        string li2 = "";
        foreach (ListItem item in ListBox3.Items)
        {
            if (item.Selected)
            {
                li2 = li2 + item.Value + ",";
            }
        }
        SqlCommand sc = new SqlCommand();
        sc.Connection = cn;
        if (dataSet.Tables[0].Rows.Count == 0)
        {            
            sc.CommandText = "insert into shows(movie_id,audi,location,times) values(" + ListBox1.SelectedValue + ",'" + ListBox4.SelectedValue + "','" + ListBox2.SelectedItem + "','" + li2 + "')";
            sc.ExecuteNonQuery();
            cn.Close();
        }
        else
        {
            sc.CommandText = "update shows set times = '" + li2 + "' where  movie_id = " + ListBox1.SelectedValue + " and audi = '" + ListBox4.SelectedValue + "' and location = '" + ListBox2.SelectedValue + "'";
            sc.ExecuteNonQuery();
            cn.Close();
        }
        Response.Redirect("ashows.aspx");
    }
    protected void Button2_ServerClick(object sender, EventArgs e)
    {
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select name from movies where id_num = " + ListBox1.SelectedValue;
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "name");
        string simpleValue = "";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                simpleValue = row[0].ToString();
            }
        }
        SqlCommand sc = new SqlCommand();
        sc.Connection = cn;
        sc.CommandText = "delete from shows where movie_id = " + ListBox1.SelectedValue;
        sc.ExecuteNonQuery();
        sc.CommandText = "delete from movies where id_num = " + ListBox1.SelectedValue;
        sc.ExecuteNonQuery();
        cn.Close();
        System.IO.Directory.Delete(Server.MapPath("~/Resources/movies/" + simpleValue),true);
        Response.Redirect("ashows.aspx");
    }
    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {        

        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select audi_count from locations where id_loc = '"+ListBox2.SelectedValue+"'";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "location");
        cn.Close();
        int count = 0;
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                count = (int)row[0];
            }
        }
        ListBox4.Items.Clear();
        for (int i = 1; i <= count; i++)
        {
            ListBox4.Items.Add("Audi " + i);
        }
    }
    protected void ListBox4_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Visible = true;
        ListBox3.Items.Clear();
        ListBox3.Items.Add("10:00 AM");
        ListBox3.Items.Add("12:45 PM");
        ListBox3.Items.Add("03:00 PM");
        ListBox3.Items.Add("05:45 PM");
        ListBox3.Items.Add("09:00 PM");
        ListBox3.Items.Add("11:30 PM");
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select times,audi,location from shows where location = '" + ListBox2.SelectedItem + "' and audi='"+ListBox4.SelectedValue+"'";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "shows");
        cn.Close();
        string tm = "";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                tm = row[0].ToString();
            }
        }
        string[] values2 = tm.Split(',');
        for (int i = 0; i < values2.Length - 1; i++)
        {
            values2[i] = values2[i].Trim();
        }
        List<string> list = new List<string>(values2);
        foreach (ListItem item in ListBox3.Items)
        {
            if (list.Contains(item.Text))
            {
                item.Selected = true;
            }
        }
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button2.Visible = true;
        ListBox3.Items.Clear();
        ListBox4.Items.Clear();
        ListBox2.ClearSelection();
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select location from shows where movie_id = '" + ListBox1.SelectedValue + "'";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "location");
        cn.Close();
        string tm= "";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                tm = row[0].ToString();
            }
        }
        string[] values2 = tm.Split(',');
        for (int i = 0; i < values2.Length - 1; i++)
        {
            values2[i] = values2[i].Trim();
        }
        List<string> list = new List<string>(values2);
        foreach (ListItem item in ListBox2.Items)
        {
            if (list.Contains(item.Text))
            {
                item.Selected = true;
            }
        }
    }
}