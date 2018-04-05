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


public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["signemail"] != null && Request.QueryString["signpass"] != null)
            {
                int flag = 0;
                int flag1 = 0;
                Session["use"] = null;
                string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
                SqlConnection cn = new SqlConnection(connectionstring);
                cn.Open();
                SqlDataAdapter sqlda;
                string query = "select * from users";
                sqlda = new SqlDataAdapter(query, cn);
                DataSet dataSet = new DataSet();
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
                        else if (row[0].ToString() == Request.QueryString["signemail"] && row[1].ToString() != Request.QueryString["signpass"])
                        {
                            flag1 = 1;
                        }
                    }
                }
                if (flag == 0 && flag1 == 0)
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