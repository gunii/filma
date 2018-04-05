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

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (Request.QueryString["id"] == null){
            Response.Redirect("index.aspx");
        }
        string id = Request.QueryString["id"].ToString();
        string c1 = "";
        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select * from movies where id_num ='"+id+"'";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "movies");
        string content = "";
        string newa="";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                c1 = c1 + "<h3 style='margin-left:10px;'>"+row[1]+"("+row[4]+")("+row[3]+")</h3>";
                content = content + "<img src='Resources/Movies/" + row[1] + "/" + row[10] + "' style='margin-right:0px; margin-left:0px; max-width:970px;' /><div class='col-sm-8' style='margin-top:10px; border-right:1px solid gray;'><span class='label label-success'>Synopsis :</span><h5>" + row[7] + "</h5><h5><strong>Genre :</strong>" + row[8] + "</h5><h5><strong>Crew :</strong>" + row[5] + "</h5><h5><strong>Cast :</strong>" + row[6] + "</h5><h5><strong>Runtime :</strong>" + row[2] + "</h5><div class='row'><div style='margin-top:10px;' class='col-sm-1'><span class='label label-success'>Book Tickets :</span></div><div class='col-sm-2'></div><div style='margin-top:10px;' class='col-sm-1'><span class='label label-success'>Date :</span></div><div style='margin-top:10px;' class='col-sm-8'><label class='radio-inline'><input checked='checked' data-val='true' id='date1' name='date' type='radio' value='" + DateTime.Now.ToString("dd") + "  " + DateTime.Now.DayOfWeek + "'>" + DateTime.Now.ToString("dd") + "  " + DateTime.Now.DayOfWeek + "</label><label class='radio-inline'><input id='date2' name='date' type='radio' value='" + DateTime.Now.AddDays(1).ToString("dd") + "  " + DateTime.Now.AddDays(1).DayOfWeek + "'>" + DateTime.Now.AddDays(1).ToString("dd") + "  " + DateTime.Now.AddDays(1).DayOfWeek + "</label><label class='radio-inline'><input id='date3' name='date' type='radio' value='" + DateTime.Now.AddDays(2).ToString("dd") + "  " + DateTime.Now.AddDays(2).DayOfWeek + "'>" + DateTime.Now.AddDays(2).ToString("dd") + "  " + DateTime.Now.AddDays(2).DayOfWeek + "</label></div></div><div class='row' style='margin-top:2px; height:30px; background-color:#59595C;'><div style='margin-top:7px;' class='col-sm-3'><span class='label label-primary'>Location</span></div><div style='margin-top:7px;' class='col-sm-5'><span class='label label-primary'>ShowTime</span></div></div>";
                newa="</div><div style='margin-top:10px;' class='col-sm-4'><span class='label label-success'>Trailer :</span><iframe style='margin-top:10px;' src='" + row[11] + "' frameborder='0' allowfullscreen></iframe><br/><br/><span class='label label-success'>Images :</span><div class='row' style='margin-top:10px;'><div class='col-sm-4'><div class='thumbnail'><a href='Resources/Movies/" + row[1] + "/" + row[12] + "'><img src='Resources/Movies/" + row[1] + "/" + row[12] + "' style='width:100%'></a></div></div><div class='col-sm-4'><div class='thumbnail'><a href='Resources/Movies/" + row[1] + "/" + row[13] + "'><img src='Resources/Movies/" + row[1] + "/" + row[13] + "' style='width:100%'></a></div></div><div class='col-sm-4'><div class='thumbnail'><a href='Resources/Movies/" + row[1] + "/" + row[14] + "'><img src='Resources/Movies/" + row[1] + "/" + row[14] + "' style='width:100%'></a></div></div></div></div>";
            }
        }
        sqlda = new SqlDataAdapter("select location from shows where movie_id = "+id, cn);
        dataSet = new DataSet();
        sqlda.Fill(dataSet, "location");
        string tm = "";
        int count = 0;
        string[] b = {"abc"};
        string s2 = "<div class='col-sm-9' style='margin-top:6px;'>";
        string s1 = "<div class='row' style='margin-top:2px;' ><div class='col-sm-3' style='margin-top:4px;' id='loca' runat='server'>";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                count++;
                tm = "";
                s2 = s2 + "<div class='btn-group' style='margin-top:17px;' >";
                s1 = s1 + "<h6 style='margin-top:13px;'>" + row[0].ToString() + "</h6>";
                SqlDataAdapter sqlda1;
                sqlda1 = new SqlDataAdapter("select times from shows where movie_id = " + id +" and location = '"+row[0].ToString()+"'",cn);
                DataSet dataSet1 = new DataSet();
                dataSet1 = new DataSet();
                sqlda1.Fill(dataSet1, "times");
                foreach (DataTable table1 in dataSet1.Tables)
                {
                    foreach (DataRow row1 in table1.Rows)
                    {
                        tm += row1[0].ToString();                        
                    }
                }
                string[] values2 = tm.Split(',');
                for (int i = 0; i < values2.Length; i++)
                {
                    values2[i] = values2[i].Trim();
                }
                b = new HashSet<string>(values2).ToArray();
                for (int j = 0; j < b.Length - 1; j++)
                {
                    s2 = s2 + "<button type='button' style='margin-left:10px;' onclick=\"pass('" + b[j].ToString() + "')\" value='" + b[j].ToString() + "' class='btn btn-default btn-xs'>" + b[j].ToString() + "</button>";
                }
                s2 = s2 + "</div></br>";
            }
        }
        s1 = s1 + "</div>";
        s2 = s2 + "</div></div>";
            div2.InnerHtml = c1;
        div1.InnerHtml = content+s1+s2+newa;
        if (!IsPostBack)
        {
            if (Request.QueryString["signemail"] != null && Request.QueryString["signpass"] != null)
            {
                int flag = 0;
                Session["use"] = null;                
                cn.Open();                
                query = "select * from users";
                sqlda = new SqlDataAdapter(query, cn);                
                sqlda.Fill(dataSet, "users");
                foreach (DataTable table in dataSet.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        if (row[0].ToString() == Request.QueryString["signemail"] && row[1].ToString() == Request.QueryString["signpass"])
                        {
                            Session["use"] = Request.QueryString["signemail"];
                            flag = 1;
                            break;
                        }
                    }
                }
                if (flag == 0)
                {
                    SqlCommand sc = new SqlCommand();
                    sc.Connection = cn;
                    sc.CommandText = "insert into users values('" + Request.QueryString["signemail"] + "','" + Request.QueryString["signpass"] + "')";
                    sc.ExecuteNonQuery();
                    cn.Close();
                    Session["use"] = Request.QueryString["signemail"];
                    Response.Redirect("index.aspx");
                }
                else { Response.Redirect("index.aspx"); }
            }
        }
        string a = Session["use"] as string;
        if (string.IsNullOrEmpty(a) == false)
        {
            navtoping.InnerHtml = "<ul class='list-unstyled' style='float:right;'><li style='display:inline;'><button data-placement='bottom' data-toggle='popover' data-title='Welcome' data-container='body' type='button' data-html='true' class='btn btn-md btn-success' id='login'>HELLO</button><div id='popover-content' class='hide'><a href='Orders.aspx?u=" + Session["use"] + "'>Your Orders</a><br/><a href='logout.aspx'>Log Out</a></div></li></ul>";

        }
    }
}