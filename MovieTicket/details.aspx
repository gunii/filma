<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Movie World</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Resources/css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="Resources/css/index.css" />
    <script src="Resources/js/jquery.min.js"></script>
    <script src="Resources/js/bootstrap.min.js"></script>
    <style>
        .radioButtonList { list-style:none;  padding-left: 10px;}
        .radioButtonList label{
            display:inline;
            margin-left: 10px;
            margin-right:10px;
        }
    </style>
    <script>
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        function pass(a)
        {
            var b = a.slice(-2);
            var c = "";
            var d = "";
            if (b == 'PM') {
                var c = parseInt(a.slice(0, 2)) + 12;
            }
            else {
                c = parseInt(a.slice(0, 2));
            }
            if (document.getElementById("date1").checked == true)
            {
                d =document.getElementById("date1").value;
            }
            else if (document.getElementById("date2").checked == true) {
                d = document.getElementById("date2").value;
            }
            else  {
                d = document.getElementById("date3").value;
            }
            var id = getParameterByName('id');
            window.location.href = "book.aspx?d=" + d + "&t=" + c+"&f="+ id ;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
              <div class="col-sm-6"><a class="logo left" href="/"></a></div>              
              <div class="col-sm-6">
                  <div class="row">
                      <div class="col-sm-4"></div>
                      <div class="col-sm-7" runat="server" id="navtoping" style="margin-right:0;">
                         <ul class="list-unstyled" style="float:right;">
                        <li style="display:inline;"><button data-placement="bottom" data-toggle="popover" data-title="Login" style="visibility:hidden" data-container="body" type="button" data-html="true" class="btn btn-md btn-success" id="login">Log in</button>
                        <div id="popover-content" class="hide">
                            <form class="form-inline" role="form">
                                <div class="form-group">
                                    <input type="text" placeholder="Email" id="logemail" class="form-control" />
                                    <input type="password" placeholder="Password" id="logpass" runat="server" class="form-control" />
                                    <button type="submit" id="logindone" runat="server" onclick="login()" class="btn btn-success"> Login »</button>                                    
                                </div>
                            </form>
                        </div>
                            </li>
                        <li style="display:inline;"><button data-placement="bottom" data-toggle="popover2" data-title="Signup" data-container="body" type="button" data-html="true" class="btn btn-md btn-success" id="login">Log In / Sign Up</button>
                        <div id="Div3" class="hide">
                            <form class="form-inline" role="form">
                                <div class="form-group">
                                    <input type="text" placeholder="Email" id="signemail" runat="server" class="form-control" />
                                    <input type="password" placeholder="Password" id="signpass" runat="server" class="form-control" />
                                    <button type="submit" id="signupdone" runat="server"  class="btn btn-success"> Log In / Signup »</button>                                                
                                </div>
                            </form>
                        </div>
                            </li>
                       </ul>
                      </div>
                      
                  </div>  
              </div>
            </div>
            <nav class="navbar navbar-inverse">               
                <ul class="nav navbar-nav">
                  <li ><a href="/index.aspx"><i class="icon-home"></i></a></li>
                  <li class="active"><a href="movies.aspx">Movies</a></li>                           
                </ul>              
            </nav>
            <div class="row" id="div2" runat="server" style="background-color: #26abe2; margin-right:0px; margin-left:0px;">
                
            </div>
            <div class="row" id="div1" runat="server" style="background-color: #333333; margin-right:0px; margin-left:0px;">                
                <div class="col-sm-8">
                                        
                </div>
            </div>
            <hr />
            <div class="row" style="margin:0px; margin-bottom:30px; background-color:transparent; color:white !important;">
                <div class="col-sm-2">
                    <a style="color:white;" href="contact.aspx"><h6>Contact Us</h6></a>
                </div>
                <div class="col-sm-2">
                    <a style="color:white;" href="review.aspx"><h6>Review</h6></a>
                </div>
                <div class="col-sm-2">
                    <a style="color:white;" href="movies.aspx"><h6>Now Showing</h6></a>
                </div>
            </div>
        </div>
    </form>
    <script>
        $("[data-toggle=popover]").popover({
            html: true,
            content: function () {
                return $('#popover-content').html();
            }
        });
        $("[data-toggle=popover2]").popover({
            html: true,
            content: function () {
                return $('#Div3').html();
            }
        });
    </script>
</body>
</html>
