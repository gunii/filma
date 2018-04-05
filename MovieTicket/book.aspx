<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="book" %>

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
    <script src="Resources/js/easyResponsiveTabs.js"></script>
    <style>
        div#parentHorizontalTab {
    padding: 0 5%;
	width:90%!important;
}
ul.resp-tabs-list, p {
    margin: 0px;
    padding: 0px;
}

.resp-tabs-list li {
    font-weight: 600;
    font-size: 13px;
    display: inline-block;
    padding: 13px 15px;
    margin: 0 4px 0 0;
    list-style: none;
    cursor: pointer;
    float: left;
}

.resp-tabs-container {
    padding: 0px;
    background-color:transparent;
    clear: left;
}

h2.resp-accordion {
    cursor: pointer;
    padding: 5px;
    display: none;
}

.resp-tab-content {
    display: none;
    padding: 15px;
}
.resp-tab-active {
	border: 1px solid #5AB1D0 !important;
	border-bottom: none;
	margin-bottom: -1px !important;
	padding: 12px 14px 14px 14px !important;
	border-top: 4px solid #000 !important;
	border-bottom: 0px #fff solid !important;
}

.resp-tab-active {
    border-bottom: none;
    background-color: #fff;
}

.resp-content-active, .resp-accordion-active {
    display: block;
}

.resp-tab-content {
    border: 1px solid #c1c1c1;
	border-top-color: #5AB1D0;
}

h2.resp-accordion {
    font-size: 13px;
    border: 1px solid #c1c1c1;
    border-top: 0px solid #c1c1c1;
    margin: 0px;
    padding: 10px 15px;
}

h2.resp-tab-active {
    border-bottom: 0px solid #c1c1c1 !important;
    margin-bottom: 0px !important;
    padding: 10px 15px !important;
}

h2.resp-tab-title:last-child {
    border-bottom: 12px solid #c1c1c1 !important;
    background: blue;
}
a.back{
	padding:10px;
	background:#3b85d5;
	color:white;
	display:inline-block;
	text-decoration:none;
	margin: 10px;
	
}
.tab1 input[type="text"]{
	width:90%;
	padding:10px;
	margin:20px 0px 0px 0px;
	background:transparent;
	border:1px solid black;
}
select.month{
    margin: 10px 0px 0px 0px;
	padding:5px;
	background:transparent;
	border:1px solid #000;
	/*-- w3layouts --*/
}
select.year {
    margin: 10px 0px 0px 0px;
	padding:5px;
	background:transparent;
	border:1px solid #000;
}
.tab1 p{
	margin-top:20px;
	font-size:14px;
	text-transform:uppercase;
}
.tab1 input.cvv {
	width: 11%;
    margin-right: 5em;
    padding: 6px;
}
input.go-to-pay {
    text-align: center;
    color: #fff;
    padding: 7px 10px;
    background: #0E2075;
    display: block;
    font-size: 0.875em;
    font-weight: 500;
    text-decoration: none;
    border: none;
    display:inline-block;
    margin:15px 0px 0px 0px;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
	cursor:pointer;
}
.tab2 h3{
	margin:0;
	padding:15px 0px 10px 0px;
	color:#000;
	font-size:14px;
	font-weight:400;
}
select.bank {
    margin: 10px 0px 0px 0px;
	padding:10px 0px;
	background:transparent;
	border:1px solid #000;
	width:100%;
}
.tab2 input[type="text"]{
	width:93%;
	/*-- agileits --*/
	margin:2px 0px;
	padding:10px;
	background:transparent;
	border:1px solid #000;
}
.tab2 input[type="password"]{
 width:93%;
  padding:10px;
  background:transparent;

	border:1px solid #000;
}
.tab2 input[type="submit"] {
    background: black;
    color: white;
    border: none;
	padding: 10px 35px;
    margin: 15px 0px 0px 0px;
	cursor:pointer;
}
.tab3 h3{
	font-size:15px;
	padding:0;
	color:white;
}
.tab3 h4{
	color:#000;
	padding:0px;
	font-weight:400;
	margin:20px 0px 10px 0px;
	font-size:14px;
}
.tab3 input[type="text"]{
	 width:80%;
	padding:10px;
	background:transparent;

	border:1px solid #000;
}
.tab3 input[type="password"]{
	 width:80%;
  padding:10px;
  background:transparent;

  border:1px solid #000;
}
.tab3 input[type="submit"] {
	background: black;
    color: white;
	/*-- w3layouts --*/
    border: none;
	padding: 10px 35px;
    margin: 15px 0px 0px 0px;
	cursor:pointer;
}
h2.resp-tab-active {
    background: #DBDBDB;/* !important;*/
}

.resp-easy-accordion h2.resp-accordion {
    display: block;
}

.resp-easy-accordion .resp-tab-content {
    border: 1px solid #c1c1c1;
}

.resp-easy-accordion .resp-tab-content:last-child {
    border-bottom: 1px solid #c1c1c1;/* !important;*/
}

.resp-jfit {
    width: 100%;
    margin: 0px;
}

.resp-tab-content-active {
    display: block;
}

h2.resp-accordion:first-child {
    border-top: 1px solid #c1c1c1;/* !important;*/
}
        .hor_1 {
            margin-top:-430px;
        }
    </style>
    <script type="text/javascript">
        var ar = [];
        function removeA(arr) {
            var what, a = arguments, L = a.length, ax;
            while (L > 1 && arr.length) {
                what = a[--L];
                while ((ax = arr.indexOf(what)) !== -1) {
                    arr.splice(ax, 1);
                }
            }
            return arr;
        }
        function changeImg(img, a) {
            
            if (img.src.indexOf("_on") > 0) {
                img.src = img.src.replace("_on", "_off");
                removeA(ar, a);
                document.getElementById("tet").value = ar.toString();
            }
            else {
                img.src = img.src.replace("_off", "_on");
                ar.push(a);
                document.getElementById("tet").value = ar.toString();
            }
        }
        function here(){
            document.getElementById("div1").style.visibility = "hidden";
            document.getElementById("div2").style.visibility = "hidden";
            document.getElementById("mo1").style.visibility = "hidden";
            document.getElementById("mo").style.visibility = "hidden";
            document.getElementById("hello").style.visibility = "visible";
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
                        <div id="Div6" class="hide">
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
            <div id="mo1" class="row" style="background-color: white; color:gray !important; margin-right:0px; margin-left:0px;">                
                <center><h2>Please Select Your Seats</h2></center>
                <div class="col-sm-3">

                </div>
                <div class="col-sm-2">
                    <img src="Resources/images/buttonA_off.jpg" />
                    Available
                </div>
                <div class="col-sm-2">
                    <img src="Resources/images/seat2.jpg" />
                    Not Available
                </div>
                <div class="col-sm-2">
                    <img src="Resources/images/buttonA_on.jpg" />
                    Selection
                </div>
            </div>
            <div class="row" runat="server" id="div1" style="background-color: white; color:gray !important; margin-right:0px; margin-left:0px;">                
                <div id="div3" runat="server" style="margin-top:10px;" class="col-sm-3">
                                       
                </div>
                <div class="col-sm-1" style="margin-top:10px;"></div>
                <div id="div4" runat="server" style="margin-top:10px;" class="col-sm-4">
                    
                </div>
                <div class="col-sm-1" style="margin-top:10px;"></div>
                <div id="div5" runat="server" style="margin-top:10px;" class="col-sm-3">
                    
                </div>
            </div>
            <div class="row" id="mo" style="background-color: white; color:gray !important; margin-right:0px; margin-left:0px;">                
                <center><h2>Screen This Side</h2></center>
                <div class="col-sm-4"></div>
                <div class="col-sm-4"><input type="text" runat="server" id="tet" class="form-control"/></div>
                <div class="col-sm-4"><input type="button" onclick="here()" class="btn-success btn form-control" value="Pay" /></div>
            </div>
            <div class="row" id="hello" style="background-color: white; margin-top:-452px; visibility:hidden; color:gray !important; margin-right:0px; margin-left:0px;">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div id="parentHorizontalTab">
            <ul class="resp-tabs-list hor_1">
                <li>CREDIT/DEBIT CARD</li>
                <li>INTERNET BANKING</li>
                <li>TESTING</li>
            </ul>
            <div class="resp-tabs-container hor_1" style="margin-top:500px; position:absolute;">
                <div class="tab1">
                 <img src="Resources/images/paymentimg.png">
					 <form>
					<input type="text" class="payment"  value="Enter Your Card Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Card Number';}" required=""><br>
							<input type="text" class="payment" value="Your Name On Card" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name On Card';}" required=""><br>
							<p>Expiry:<br><select class="month" required="">
														<option value="">Month</option>
														<option value="01">Jan</option>
														<option value="02">Feb</option>
														<option value="03">Mar</option>
														<option value="04">Apr</option>
														<option value="05">May</option>
														<option value="06">Jun</option>
														<option value="07">Jul</option>
														<option value="08">Aug</option>
														<option value="09">Sep</option>
														<option value="10">Oct</option>
														<option value="11">Nov</option>
														<option value="12">Dec</option>
													</select>
													<select class="year" required="">
														<option value="">Year</option>
														<option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option><option value="2027">2027</option><option value="2028">2028</option><option value="2029">2029</option><option value="2030">2030</option><option value="2031">2031</option><option value="2032">2032</option><option value="2033">2033</option><option value="2034">2034</option><option value="2035">2035</option><option value="2036">2036</option><option value="2037">2037</option><option value="2038">2038</option><option value="2039">2039</option><option value="2040">2040</option><option value="2041">2041</option><option value="2042">2042</option><option value="2043">2043</option><option value="2044">2044</option><option value="2045">2045</option><option value="2046">2046</option><option value="2047">2047</option><option value="2048">2048</option><option value="2049">2049</option><option value="2050">2050</option><option value="2051">2051</option><option value="2052">2052</option><option value="2053">2053</option><option value="2054">2054</option><option value="2055">2055</option><option value="2056">2056</option><option value="2057">2057</option><option value="2058">2058</option><option value="2059">2059</option><option value="2060">2060</option><option value="2061">2061</option><option value="2062">2062</option><option value="2063">2063</option><option value="2064">2064</option><option value="2065">2065</option><option value="2066">2066</option><option value="2067">2067</option><option value="2068">2068</option><option value="2069">2069</option><option value="2070">2070</option><option value="2071">2071</option><option value="2072">2072</option><option value="2073">2073</option><option value="2074">2074</option></select>
														<input type="text" class="cvv" value="cvv" maxlength="3" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'cvv';}" required="">
														</p>
														<input type="submit" class="go-to-pay" value="make payment">
														</form>
                </div>
                <div  class="tab2">
             <p>Select your Bank :<select class="bank"><option value="">=== choose a Bank ===</option><option value="ALB-NA">Allahabad Bank NetBanking</option><option value="ADB-NA">Andhra Bank</option><option value="BBK-NA">Bank of Bahrain and Kuwait NetBanking</option><option value="BBC-NA">Bank of Baroda Corporate NetBanking</option><option value="BBR-NA">Bank of Baroda Retail NetBanking</option><option value="BOI-NA">Bank of India NetBanking</option><option value="BOM-NA">Bank of Maharashtra NetBanking</option><option value="CSB-NA">Catholic Syrian Bank NetBanking</option><option value="CBI-NA">Central Bank of India</option><option value="CUB-NA">City Union Bank NetBanking</option><option value="CRP-NA">Corporation Bank</option><option value="DBK-NA">Deutsche Bank NetBanking</option><option value="DCB-NA">Development Credit Bank</option><option value="DC2-NA">Development Credit Bank - Corporate</option><option value="DLB-NA">Dhanlaxmi Bank NetBanking</option><option value="FBK-NA">Federal Bank NetBanking</option><option value="IDS-NA">Indusind Bank NetBanking</option><option value="IOB-NA">Indian Overseas Bank</option><option value="ING-NA">ING Vysya Bank (now Kotak)</option><option value="JKB-NA">Jammu and Kashmir NetBanking</option><option value="JSB-NA">Janata Sahakari Bank Limited</option><option value="KBL-NA">Karnataka Bank NetBanking</option><option value="KVB-NA">Karur Vysya Bank NetBanking</option><option value="LVR-NA">Lakshmi Vilas Bank NetBanking</option><option value="OBC-NA">Oriental Bank of Commerce NetBanking</option><option value="CPN-NA">PNB Corporate NetBanking</option><option value="PNB-NA">PNB NetBanking</option><option value="RSD-DIRECT">Rajasthan State Co-operative Bank-Debit Card</option><option value="RBS-NA">RBS (The Royal Bank of Scotland)</option><option value="SWB-NA">Saraswat Bank NetBanking</option><option value="SBJ-NA">SB Bikaner and Jaipur NetBanking</option><option value="SBH-NA">SB Hyderabad NetBanking</option><option value="SBM-NA">SB Mysore NetBanking</option><option value="SBT-NA">SB Travancore NetBanking</option><option value="SVC-NA">Shamrao Vitthal Co-operative Bank</option><option value="SIB-NA">South Indian Bank NetBanking</option><option value="SBP-NA">State Bank of Patiala NetBanking</option><option value="SYD-NA">Syndicate Bank NetBanking</option><option value="TNC-NA">Tamil Nadu State Co-operative Bank NetBanking</option><option value="UCO-NA">UCO Bank NetBanking</option><option value="UBI-NA">Union Bank NetBanking</option><option value="UNI-NA">United Bank of India NetBanking</option><option value="VJB-NA">Vijaya Bank NetBanking</option></select></p>
					<form>
									<h3> E-MAIL</h3>
									<input type="text" class="name"  required="">
									<h3>PASSWORD</h3>
									<input type="password" class="password"  required=""><br>
									<input type="submit" value="SUBMIT"><br>
					</form>
                </div>
                <div class="tab3">                          
					    <input type="button" id="subbutton" onserverclick="subbutton_ServerClick" runat="server" style="width:400px;" class="btn btn-success form-control" value="PAY" />                    
                </div>
            </div>
        </div>
                </div>
                <div class="col-sm-2"></div>
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
    </script>
     <script type="text/javascript">
         $(document).ready(function () {             
             $('#parentHorizontalTab').easyResponsiveTabs({
                 type: 'default', 
                 width: 'auto',
                 fit: true,
                 tabidentify: 'hor_1', 
                 activate: function (event) { 
                     var $tab = $(this);
                     var $info = $('#nested-tabInfo');
                     var $name = $('span', $info);
                     $name.text($tab.text());
                     $info.show();
                 }
             });
         });
</script>
</body>
</html>
