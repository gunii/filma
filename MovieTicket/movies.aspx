<%@ Page Language="C#" AutoEventWireup="true" CodeFile="movies.aspx.cs" Inherits="movies" %>

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
    <script>
        function EmailError() {
            alert('a');
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
                        <div id="Div2" class="hide">
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
                  <li ><a href="index.aspx"><i class="icon-home"></i></a></li>
                  <li class="active"><a href="movies.aspx">Movies</a></li>                          
                </ul>              
            </nav>
            <div class="row" style="background-color: #26abe2; margin-right:0px; margin-left:0px;">
                <h5 style="margin-left:10px;">PICK A MOVIE</h5>
            </div>
            <div class="row" id="div1" runat="server" style="background-color: #333333; margin-right:0px; margin-left:0px;">
                
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
                return $('#Div2').html();
            }
        });
    </script>
</body>
</html>
