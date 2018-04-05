<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addmovie.aspx.cs" Inherits="addmovie" %>

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
                      <li role="presentation" class="active"><a href="addmovie.aspx">Add Movie</a></li>                      
                        <li role="presentation"><a href="ashows.aspx">Manage Shows</a></li>    
                        <li role="presentation"><a href="addlocation.aspx">Manage Locations</a></li>                    
                    </ul>
                </div>                
                <div class="col-sm-10">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-4">
                            <input type="text" id="mname" class="form-control" runat="server" placeholder="Movie Name" />
                            <input type="text" id="runt" class="form-control" runat="server" placeholder="Runtime" />
                            <span class="label label-success">Add Genre :</span>
                            <asp:ListBox ID="ListBox1" runat="server" class="form-control" Height="280px" SelectionMode="Multiple">
                                <asp:ListItem>Comedy</asp:ListItem>
                                <asp:ListItem>Action</asp:ListItem>
                                <asp:ListItem>Animation</asp:ListItem>
                                <asp:ListItem>Adventure</asp:ListItem>
                                <asp:ListItem>Family</asp:ListItem>
                                <asp:ListItem>Fantasy</asp:ListItem>
                                <asp:ListItem>Scifi</asp:ListItem>
                                <asp:ListItem>Biography</asp:ListItem>
                                <asp:ListItem>Documentry</asp:ListItem>
                                <asp:ListItem>Horror</asp:ListItem>
                                <asp:ListItem>History</asp:ListItem>
                                <asp:ListItem>Romance</asp:ListItem>
                                <asp:ListItem>Thriller</asp:ListItem>
                                <asp:ListItem>War</asp:ListItem>
                                <asp:ListItem>Crime</asp:ListItem>
                            </asp:ListBox>
                            
                        </div>
                        <div class="col-sm-4">
                            <span class="label label-success">Content Rating :</span>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem>U/A</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                            </asp:DropDownList>
                            <span class="label label-success">Add Language :</span>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                <asp:ListItem>English</asp:ListItem>
                                <asp:ListItem>Hindi</asp:ListItem>
                            </asp:DropDownList>
                            <textarea class="form-control" style="min-height:82px;" id="crew" runat="server" placeholder="Crew Information"></textarea>
                            <textarea class="form-control" style="min-height:82px;" id="syn" runat="server" placeholder="Synopsis"></textarea>
                            <textarea class="form-control" style="min-height:82px;" id="cast" runat="server" placeholder="Cast"></textarea>
                            
                        </div>
                        <div class="col-sm-4">
                            <span class="label label-success">Upload 150x207 Image :</span>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            <span class="label label-success">Upload 1000x320 Image :</span>
                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                            <span class="label label-default">Optional Image 1 :</span>
                            <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control" />
                            <span class="label label-default">Optional Image 2 :</span>
                            <asp:FileUpload ID="FileUpload4" runat="server" CssClass="form-control" />
                            <span class="label label-default">Optional Image 3 :</span>
                            <asp:FileUpload ID="FileUpload5" runat="server" CssClass="form-control" />
                            <span class="label label-default">Optional Trailer Link:</span>
                            <input id="Text1" type="text" style="min-height:60px;" class="form-control" runat="server" placeholder="Trailer Link" />                            
                        </div>
                        <div class="col-lg-12">
                            <center>
                                <button id="Button1" class="btn-success form-control" onserverclick="Button1_ServerClick" style="margin-top:45px; width:30%;" type="submit" runat="server" >SUBMIT</button>
                            </center>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>          
    </form>
</body>
</html>
