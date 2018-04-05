<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addlocation.aspx.cs" Inherits="addlocation" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                      <li role="presentation"><a href="ashows.aspx">Manage Shows</a></li>          
                      <li role="presentation" class="active"><a href="addlocation.aspx">Manage Locations</a></li>                     
                    </ul>
                </div>                
                <div class="col-sm-10">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-4">
                            <input type="text" id="lname" class="form-control" runat="server" placeholder="Name" />
                            <input type="text" id="audicount" class="form-control" runat="server" placeholder="Audi Count" />
                        </div>
                        <div class="col-sm-4">
                            <textarea style="resize:vertical; min-height:72px;" id="laddress" class="form-control" runat="server" placeholder="Address"></textarea>
                        </div>
                        <div class="col-sm-4">
                            <button id="Button1" style="margin-top:20px;" class="btn-success form-control" onserverclick="Button1_ServerClick" type="submit" runat="server" >SUBMIT</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>          
    </form>
</body>
</html>

