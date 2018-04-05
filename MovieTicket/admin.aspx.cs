using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void admilog_ServerClick(object sender, EventArgs e)
    {
        if (admu.Value == "admin" && pass.Value == "123456")
        {
            Response.Redirect("workspace.aspx");
        }
    }
}