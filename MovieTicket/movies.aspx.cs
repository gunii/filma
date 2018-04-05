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

public partial class movies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionstring);
        cn.Open();
        SqlDataAdapter sqlda;
        string query = "select * from movies";
        sqlda = new SqlDataAdapter(query, cn);
        DataSet dataSet = new DataSet();
        sqlda.Fill(dataSet, "movies");
        cn.Close();
        string content = "";
        foreach (DataTable table in dataSet.Tables)
        {
            foreach (DataRow row in table.Rows)
            {
                content = content + "<div class='col-sm-2' style='margin-top:5px;'><div class='thumbnail'><a href='details.aspx?id=" + row[0]+ "'><img src='Resources/movies/" + row[1] + "/" + row[9] + "' style='width:100%'><div class='caption'><h6>"+row[1]+"</h6></div></a></div></div>";
            }
        }
        div1.InnerHtml = content;
        if (!IsPostBack)
        {
            if (Request.QueryString["signemail"] != null && Request.QueryString["signpass"] != null)
            {
                Boolean checking = IsValidEmail(Request.QueryString["signemail"]);
                if (checking != false)
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
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "EmailError()", true);
                }
            }
        }
        string a = Session["use"] as string;
        if (string.IsNullOrEmpty(a) == false)
        {
            navtoping.InnerHtml = "<ul class='list-unstyled' style='float:right;'><li style='display:inline;'><button data-placement='bottom' data-toggle='popover' data-title='Welcome' data-container='body' type='button' data-html='true' class='btn btn-md btn-success' id='login'>HELLO</button><div id='popover-content' class='hide'><a href='Orders.aspx?u=" + Session["use"] + "'>Your Orders</a><br/><a href='logout.aspx'>Log Out</a></div></li></ul>";

        }
    }
    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }
}