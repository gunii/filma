<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie World</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Resources/css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="Resources/css/index.css" />
    <script src="Resources/js/jquery.min.js"></script>
    <script src="Resources/js/bootstrap.min.js"></script>
</head>
<body style="background: url(../images/body-bg.png) repeat; height:100%;">
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row" style="background-color:#00ba8b; padding:7px;">
            <h3>Movie World Admin Panel</h3>
        </div>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4" style="margin-top:100px;     
    border: 1px solid #d5d5d5;
    border-radius: 5px;
    box-shadow: 0px 0px 2px #dadada,inset 0px -3px 0px #e6e6e6;">
                <div>
                    <h2>Admin Login</h2>
                    <h6>Please Provide Your Details :</h6>
                    <div class="input-group">
                      <span id="basic-addon1"  class="input-group-addon"><i class="icon-user"></i></span>
                      <input type="text" runat="server" id="admu" class="form-control" placeholder="Username" aria-describedby="basic-addon1" />
                    </div>
                    <div class="input-group" style="margin-top:10px;">
                      <span id="basic-addon2"  class="input-group-addon"><i class="icon-key"></i></span>
                      <input type="password" runat="server" id="pass" class="form-control" placeholder="Password" aria-describedby="basic-addon2" />
                    </div>
                    <button type="submit" runat="server" id="admilog" onserverclick="admilog_ServerClick" class="btn btn-success" style="float:right; margin-top:10px; margin-bottom:35px;">Sign In</button>
                </div>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
    </form>
</body>
</html>
