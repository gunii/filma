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

public partial class addmovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(mname.Value) == false && String.IsNullOrEmpty(runt.Value) == false && ListBox1.SelectedIndex != -1 && String.IsNullOrEmpty(crew.InnerText) == false && String.IsNullOrEmpty(syn.InnerText) == false && String.IsNullOrEmpty(cast.InnerText) == false && FileUpload1.HasFile == true && FileUpload2.HasFile == true)
        {
            int fu1=0; int fu2=0; int fu3=0; int fu4 = 0;
            string s ="";string s1 = ""; string s2 = ""; string s3=""; string s4="";            
            string li1 = "";
            string li2 = "";
            string li = "";
            foreach (ListItem item in ListBox1.Items)
            {
                if(item.Selected)
                {                    
                    li =li + item.Value +",";                    
                }
            }
            System.IO.Directory.CreateDirectory(Server.MapPath("~/Resources/movies/"+mname.Value));
            String path = Server.MapPath("~/Resources/movies/" + mname.Value+"/");
            try
            {
                String fileExtension =
                System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                s = mname.Value + "pic" + fileExtension;
                FileUpload1.PostedFile.SaveAs(path + s);
                fileExtension =
                System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
                s1 = mname.Value + "ba" + fileExtension;
                FileUpload2.PostedFile.SaveAs(path + s1);
            }
            catch { }
            if (FileUpload3.HasFile == true)
            {
                String fileExtension =
                System.IO.Path.GetExtension(FileUpload3.FileName).ToLower();
                s2 = mname.Value + "pic1" + fileExtension;
                FileUpload3.PostedFile.SaveAs(path + s2);
                fu1 = 1;
            }
            if (FileUpload4.HasFile == true)
            {
                String fileExtension =
                System.IO.Path.GetExtension(FileUpload4.FileName).ToLower();
                s3 = mname.Value + "pic2" + fileExtension;
                FileUpload4.PostedFile.SaveAs(path + s3);
                fu2 = 1;
            }
            if (FileUpload5.HasFile == true)
            {
                String fileExtension =
                System.IO.Path.GetExtension(FileUpload5.FileName).ToLower();
                s4 = mname.Value + "pic3" + fileExtension;
                FileUpload5.PostedFile.SaveAs(path + s4);
                fu3 = 1;
            }
            if (String.IsNullOrEmpty(Text1.Value) == false)
            {
                fu4 = 1;
            }
            string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["movieConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionstring);
            cn.Open();
            SqlCommand sc = new SqlCommand();
            sc.Connection = cn;
            sc.CommandText = "insert into movies(name,runtime,cr,lang,crew,casting,syns,genre,pic,banner)values('" + mname.Value + "','" + runt.Value + "','" + DropDownList1.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + crew.InnerText + "','" + cast.InnerText + "','" + syn.InnerText + "','" + li + "','" + s + "','" + s1 + "')";
            sc.ExecuteNonQuery();
            cn.Close();
            if(fu1 == 1)
            {
                cn.Open();                
                sc.Connection = cn;
                sc.CommandText = "update movies set pic1 = '"+s2+"' where name ='"+mname.Value+"'";
                sc.ExecuteNonQuery();
                cn.Close();
            }
            if (fu2 == 1)
            {
                cn.Open();
                sc.Connection = cn;
                sc.CommandText = "update movies set pic2 = '" + s3 + "' where name ='" + mname.Value + "'";
                sc.ExecuteNonQuery();
                cn.Close();
            }
            if (fu3 == 1)
            {
                cn.Open();
                sc.Connection = cn;
                sc.CommandText = "update movies set pic3 = '" + s4 + "' where name ='" + mname.Value + "'";
                sc.ExecuteNonQuery();
                cn.Close();
            }
            if (fu4 == 1)
            {
                cn.Open();
                sc.Connection = cn;
                sc.CommandText = "update movies set trailer = '" + Text1.Value + "' where name ='" + mname.Value + "'";
                sc.ExecuteNonQuery();
                cn.Close();
            }
        }
        else
        {
            Button1.InnerText = "Please Fill Required Fields";
        }
    }
}