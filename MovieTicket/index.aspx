<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie World</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Resources/css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <base href="/MovieTicket/" />
    <link rel="stylesheet" type="text/css" href="Resources/css/index.css" />
    <script src="Resources/js/jquery.min.js"></script>
    <script src="Resources/js/bootstrap.min.js"></script>
    <script>
        function EmailError() {
            alert('Invalid Email Address');
        }
        function loginError() {
            alert('Invalid Email Address/Password');
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
                             <li style="display:inline;"><button data-placement="bottom" data-toggle="popover" data-title="Login" style="visibility:hidden" data-container="body" type="button" data-html="true" class="btn btn-md btn-success" id="Button1">Log in</button>
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
                        <li style="display:inline;"><button data-placement="bottom" data-toggle="popover2" data-title="Signup"  data-container="body" type="button" data-html="true" class="btn btn-md btn-success" id="login">Log In / Sign Up</button>
                        <div id="Div2" class="hide">
                            <form class="form-inline" role="form">
                                <div class="form-group">
                                    <input type="text" placeholder="Email"  id="signemail" runat="server" class="form-control" />
                                    <input type="password" placeholder="Password" id="signpass" runat="server" class="form-control" />
                                    <button type="submit" id="signupdone" runat="server" class="btn btn-success"> Log In / Signup »</button>                                    
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
                  <li class="active"><a href="index.aspx"><i class="icon-home"></i></a></li>
                  <li><a href="movies.aspx">Movies</a></li>                                    
                </ul>              
            </nav>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">                
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>                
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="Resources/images/slide4.jpg" alt="First Slide">
                    </div>
                    <div class="item">
                        <img src="Resources/images/slide2.jpg" alt="Second Slide">
                    </div>
                    <div class="item">
                        <img src="Resources/images/slide5.jpg" alt="Third Slide">
                    </div>
                </div>        
            </div>
            <div class="row" style="background: #333333; margin-right:0px; margin-top:10px; margin-left:0px;">
                <div class="col-sm-4" style="padding-right:0;">
                  <div>                    
                      <img src="Resources/images/slide1.jpg" alt="Lights" style="width:100%">
                      <div class="caption">
                        <h4 style="background-color:black;">Promotion</h4>
                          <h6>Eat to your heart's content with this incredible offer at Spice Kitchen! For details, call: 044-44444224.</h6>
                      </div>                    
                  </div>
                </div>
                <div class="col-sm-4" style="padding-right:7px; padding-left:7px;">
                  <div >                    
                      <img src="Resources/images/lol.jpg" alt="Lights" style="width:100%">
                      <div class="caption">
                        <h4 style="background-color:black;">Spice Kitchen</h4>
                          <h6>Spice Kitchen is a modern yet contemporary quick service restaurant conceptualised for traditional food lovers.</h6>
                      </div>                    
                  </div>
                </div>
                <div class="col-sm-4" style="padding-left:0;">
                  <div >                    
                      <img src="Resources/images/slide3.jpg" alt="Lights" style="width:100%">
                      <div class="caption">
                        <h4 style="background-color:black;">Fuel Card</h4>
                          <h6>Fuel is the first-ever prepaid movie card and is exclusive to our cinemas. This card enables our customers to pre-load with credit and pay for movie tickets, as well as food and beverages, in all of our cinemas, website.</h6>
                      </div>                    
                  </div>
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
                return $('#Div2').html();
            }
        });
    </script>
</body>
</html>
