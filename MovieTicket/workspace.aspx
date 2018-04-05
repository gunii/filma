<%@ Page Language="C#" AutoEventWireup="true" CodeFile="workspace.aspx.cs" Inherits="workspace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie World</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Resources/css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">    
    <script src="Resources/js/jquery.min.js"></script>
    <script src="Resources/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2" style="border-right:1px solid gray;">
                    <h1>WELCOME</h1>
                    <ul class="nav nav-pills nav-stacked">
                      <li role="presentation" class="active"><a href="workspace.aspx">Dasboard</a></li>
                      <li role="presentation"><a href="addmovie.aspx">Add Movie</a></li>                      
                        <li role="presentation"><a href="ashows.aspx">Manage Shows</a></li>
                        <li role="presentation"><a href="addlocation.aspx">Manage Locations</a></li>                
                    </ul>
                </div>                
                <div class="col-sm-10">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <span runat="server" id="span1" style="font-size:24px"><i style="font-size:48px" class="icon-film"></i>&nbsp;Now Showing : </span> 
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <span runat="server" id="span2" style="font-size:24px"><i style="font-size:48px" class="icon-dollar"></i>&nbsp;Ticked Sold : 46</span>                                
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <span runat="server" id="span3" style="font-size:24px"><i style="font-size:48px" class="icon-user"></i>&nbsp;Total Users : 58</span>                                
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <center><h3>Check Tickets sold according to show.</h3></center>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-5">
                            <asp:ListBox ID="ListBox1" runat="server" class="form-control" Height="350px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id_num"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnectionString %>" SelectCommand="SELECT [id_num], [name] FROM [movies]"></asp:SqlDataSource>
                            <button id="Button2" class="btn-success form-control" onserverclick="Button2_ServerClick" style="margin-top:45px;" type="submit" runat="server" >Check</button>
                        </div>
                        <div class="col-sm-7">
                            <div class="row" style="margin-top:10px;">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-3">
                                    <h5><strong>Date</strong></h5>
                                </div>
                                <div class="col-sm-2">
                                    <h5><strong>Time</strong></h5>
                                </div>
                                <div class="col-sm-3">
                                    <h5><strong>Ticket Sold</strong></h5>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <div class="row" runat="server" id="lol" style="margin-top:10px;">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>          
    </form>
</body>
</html>
