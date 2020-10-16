<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" />
    
   <script>
       $(document).ready(function () {
           $('#ddlFirstName').select2();
           $('#ddlLastName').select2();
           $('#ddlEmailAddress').select2();
           $('#ddlMemberID').select2();
           $('#ddlMemberStatus').select2();
           $('#ddlUnionName').select2();
       });
       
   </script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>UMFI</title>
    <style>
        .container {
            border: 2px solid black;
        }

        .heading {
            font-size: 25px;
            margin-left: 35%;
        }

        .display label {
            font-size: 18px;
        }

        .btn-success {
            margin-top: 6%;
        }

        .display-box {
            border: 2px solid black;
            margin-top: 4%;
            height: 200px;
            width: 100%;
        }

        form {
            margin-top: 4%;
        }

        .btn-primary, .btn-danger {
            width: 120px;
            margin-left: 1.8%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <span class="heading">
                <label>Union Member File Import</label></span>
            <div class="display">

                <label>Select File</label>
                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-success" runat="server" accept=".csv" />
                <asp:Button ID="btnImport" CssClass="btn btn-primary" runat="server" Text="Upload" OnClick="ImportCSV" />
                <div> <asp:Label ID="fileName" runat="server" Text="" style="color:blue;font-size:20px"></asp:Label></div>
                <div class="display-box">
                    <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </div>
            </div>
            <br>
            <div class="form-group row">
                <label for="inputfirstname" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlFirstName" CssClass="form-control " EnableIncrementalSearch="true" CaseSensitiveSearch="true" runat="server">
                        
                    </asp:DropDownList>
                    
                </div>
            </div>

            <div class="form-group row">
                <label for="inputlastname" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlLastName" CssClass="form-control" class="chosen" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputemail" class="col-sm-2 col-form-label">Email Address</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlEmailAddress" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputmemberid" class="col-sm-2 col-form-label">Member ID</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlMemberID" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputmemberstatus" class="col-sm-2 col-form-label">Member Status</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlMemberStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputunionname" class="col-sm-2 col-form-label">Union Name</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlUnionName" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <button type="button" class="btn btn-primary ">Import</button>
                <div class="col-sm-10">
                    <asp:Button ID="btnDownload" class="btn btn-danger" runat="server" Text="Download" OnClick="btnDownload_Click" />
                </div>
            </div>
    </form>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
</body>
</html>

