<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ashows.aspx.cs" Inherits="ashows" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie World</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Resources/css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">    
    <script src="Resources/js/jquery.min.js"></script>
    <script src="Resources/js/bootstrap.min.js"></script>
    <style>
        .form-control {
            margin-top:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2" style="border-right:1px solid gray;">
                    <h1>WELCOME</h1>
                    <ul class="nav nav-pills nav-stacked">
                      <li role="presentation"><a href="workspace.aspx">Dasboard</a></li>
                      <li role="presentation"><a href="addmovie.aspx">Add Movie</a></li>                      
                        <li role="presentation" class="active"><a href="ashows.aspx">Manage Shows</a></li>
                        <li role="presentation"><a href="addlocation.aspx">Manage Locations</a></li>                
                    </ul>
                </div>                
                <div class="col-sm-10">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-4">
                            <asp:ListBox ID="ListBox1" class="form-control" Height="500px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"  AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id_num"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnectionString %>" SelectCommand="SELECT [name], [id_num] FROM [movies]"></asp:SqlDataSource>
                            <button id="Button2" class="btn-danger form-control" onserverclick="Button2_ServerClick" style="margin-top:45px;" type="submit" runat="server" >Delete Movie</button>
                        </div>
                        <div class="col-sm-4">
                            <asp:ListBox ID="ListBox2" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged" class="form-control" Height="500px" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id_loc"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnectionString %>" SelectCommand="SELECT [name], [id_loc] FROM [locations]"></asp:SqlDataSource>
                        </div>
                        <div class="col-sm-4">
                            <asp:ListBox ID="ListBox4" class="form-control" Height="250px" OnSelectedIndexChanged="ListBox4_SelectedIndexChanged" runat="server" AutoPostBack="true"  SelectionMode="Single">

                            </asp:ListBox>
                            <asp:ListBox ID="ListBox3" class="form-control" Height="250px" runat="server" SelectionMode="Multiple">
                                
                            </asp:ListBox>
                            <button id="Button1" class="btn-success form-control" onserverclick="Button1_ServerClick" style="margin-top:45px;" type="submit" runat="server" >SUBMIT</button>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>          
    </form>
</body>
</html>
