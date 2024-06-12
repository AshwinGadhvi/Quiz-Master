<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="login_form_20_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
    <form id="f1" runat="server">

    	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Sign Up</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	
		      		<div class="form-group">
                          <asp:TextBox ID="u_name" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
		      			
		      		</div>
                      <div class="form-group">
                          <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="abc@gmail.com"></asp:TextBox>
		      			
		      		</div> 
                      <div class="form-group">
                          <asp:TextBox ID="mobile_no" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
		      			
		      		</div>
                      <div class="form-group">
                          <asp:TextBox ID="dept" runat="server" CssClass="form-control" placeholder="Department"></asp:TextBox>
		      			
		      		</div>
                      
	            <div class="form-group">
                     <asp:TextBox ID="u_pass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
	              
	              <span toggle="#u_pass" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
                
	            <div class="form-group">
                    <asp:Button ID="Button1" class="form-control btn btn-primary submit px-3"  runat="server" Text="Sign In" />
	            	
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/login-form-20/login.aspx">Login</asp:LinkButton>
								</div>
								
	            </div>
	          
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
    
    </form>
</body>
</html>
