<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formumfi.aspx.cs" Inherits="WebApplication3.formumfi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
    <title>UMFI</title>
	<style>
		.container{border:2px solid black;}
		.heading{
		font-size:25px;
		margin-left:35%;}
		.display label{font-size:18px;
		}
		.btn-success{
		margin-top:6%;}
		.display-box{border:2px solid black;
			margin-top:4%;
			height:200px;width:100%;}
		form{margin-top:4%;}
		.btn-primary,.btn-danger{width:120px;		margin-left:1.8%;}
		
	</style>
  </head>
  <body>
	<form id="form2" runat="server">
  <div class="container">
		<span class="heading"> <label>Union Member File Import</label></span>
		<div class="display">
           
			<label>Select File</label>
			 <asp:FileUpload ID="FileUpload1" Class="btn btn-success" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="upload" OnClick="btnUpload_Click"  />
			<div class="display-box">
				<asp:GridView ID="GridView1" runat="server">  
				</asp:GridView>  
			</div>
		</div>
		
		  <div class="form-group row">
			<label for="inputfirstname" class="col-sm-2 col-form-label">First Name</label>
			<div class="col-sm-10">
						<select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
						</select>
			</div>
		  </div>
		  
		  <div class="form-group row">
			<label for="inputlastname" class="col-sm-2 col-form-label">Last Name</label>
			<div class="col-sm-10">
			  <select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
				</select>
			</div>
		  </div>
		   <div class="form-group row">
			<label for="inputemail" class="col-sm-2 col-form-label">Email Address</label>
			<div class="col-sm-10">
			 <select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
			</select>
			</div>
		  </div>
		   <div class="form-group row">
			<label for="inputmemberid" class="col-sm-2 col-form-label">Member ID</label>
			<div class="col-sm-10">
			  <select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
			</select>
			</div>
		  </div>
		   <div class="form-group row">
			<label for="inputmemberstatus" class="col-sm-2 col-form-label">Member Status</label>
			<div class="col-sm-10">
			  <select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
			</select>
			</div>
		  </div>
		   <div class="form-group row">
			<label for="inputunionname" class="col-sm-2 col-form-label">Union Name</label>
			<div class="col-sm-10">
			  <select class="form-control" >
							<option>FirstName</option>
							<option>LastName</option>
							<option>EmailAddress</option>
							<option>MemberID</option>
							<option>MemberStatus</option>
							<option>UnionName</option>
			</select>
			</div>
		  </div>
			<div class="form-group row">
			<button type="button" class="btn btn-primary ">Import</button>
			<div class="col-sm-10">
			  <button type="button" class="btn btn-danger">Download</button>
			</div>
		  </div>
  	</div>
		</form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>

