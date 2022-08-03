<%-- 
    Document   : see_all
    Created on : 6 Jul, 2022, 9:13:54 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("cat_code")==null){
    response.sendRedirect("index.jsp?cat_code_err=1");
}
else{
    String code = request.getParameter("cat_code");
    %>
    <!DOCTYPE HTML>
<html>
<head>
<title>Music Player</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.css" type='text/css' />
<!-- //lined-icons -->
<script src="js/jquery-2.1.4.js"></script>

 <!-- Meters graphs -->
 <script>
    $(document).ready(function(){
       var code = "<%=code%>";
       var num=0;
       $.post(
         "Load_more.jsp",{code:code,num:num},function(data){
            $("#record").html(data);
         }
       );
    
    });
    $(document).on("click",".w3-button.w3-red",function(){
      var num = $(this).attr("id");
      var code = "<%=code%>";
      $(this).fadeOut(1000);
      $.post(
         "Load_more.jsp",{code:code,num:num},function(data){
           $("#record").append(data);
         }
      );
    
    });
    
    
</script>

</head> 
    	 <!-- /w3layouts-agile -->
 <body class="sticky-header left-side-collapsed"  onload="initMap()">
    <section>
      <!-- left side start-->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
				<h1><a href="index.html">Music Player</a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="index.jsp">M </a>
			</div>
 	 <!-- /w3l-agile -->
			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
 						<li><a href="#"><i class="lnr lnr-music-note"></i> <span>Albums</span></a></li>						
						  
						<li><a href="#"><i class="lnr lnr-book"></i><span>Blog</span></a></li>
 						<li class="menu-list"><a href="#"><i class="lnr lnr-heart"></i>  <span>My Favourities</span></a> 
							 
						</li>
                                                <%
                                                 String email=null ;
                                                 Cookie c[] = request.getCookies();
                                                 for(int i=0;i<c.length;i++){
                                                     if(c[i].getName().equals("Login")){
                                                         email=c[i].getValue();
                                                         break;
                                                     }
                                                 }
                                                 if(email!=null && session.getAttribute(email)!=null){
                                                      try{
                                                          Class.forName("com.mysql.jdbc.Driver");
                                                          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                                                          Statement  st = cn.createStatement();
                                                          ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                                                          if(rs.next()){
                                                              %>
                                                               	 <li class="menu-list"><a href="user_profile.jsp"><i class="fa fa-user"></i>  <span><%out.print(rs.getString("name"));%></span></a> 

                                                              
                                                              <%
                                                          }
                                                          
                                                      }
                                                      catch(Exception er){
                                                          out.print(er.getMessage());
                                                      }
                                                 }
                                                    
                                                %>
					</ul>
				<!--sidebar nav end-->
			</div>
		</div>
		 	 <!-- /w3layouts-agile -->
					<!-- app-->
			 
			<!-- //app-->
 	 <!-- /w3l-agile -->
		<!-- signup -->
			<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="sign-grids">
								<div class="sign">
									<div class="col-sm-12">
										<form action="registration.jsp" method="post">

											<h3>Create your account </h3>
                                                                                        User-Name :<input type="text" name="user" class="form-control" required=""><br>
                                                                                        Email:<input type="text" name="email" class="form-control" required=""><br>
                                                                                        Password:<input type="password" name="pass" class="form-control" required=""><br>
                                                                                        Country :<select name="country" class="form-control">
                                                                                            <option value="India">India</option>
                                                                                             <option value="Australia">Australia</option>
                                                                                              <option value="England">England</option>
                                                                                               <option value="Sri Lanka">Sri Lanka</option>
                                                                                                <option value="Africa">Africa</option>
                                                                                                 <option value="Rusia">Rusia</option>
                                                                                        </select><br><br>
                                                                                        <input type="submit" value="Submit" class="btn btn-success">
										</form>
									</div>
									<div class="clearfix"></div>								
								</div>
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //signup -->
 	 <!-- /w3l-agile -->
		<!-- left side end-->
		<!-- main content start-->
		<div class="main-content">
			<!-- header-starts -->
			<div class="header-section">
			<!--toggle button start-->
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<!--toggle button end-->
			<!--notification menu start -->
				<div class="menu-right">
					<div class="profile_details">		
						  <div class="col-md-4 serch-part">
								<div id="sb-search" class="sb-search">
									<form action="#" method="post">

										<input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
										<input class="sb-search-submit" type="submit" value="">
										<span class="sb-icon-search"> </span>
									</form>
								</div>
							</div>
							  <!-- search-scripts -->
									<script src="js/classie.js"></script>
									<script src="js/uisearch.js"></script>
										<script>
											new UISearch( document.getElementById( 'sb-search' ) );
										</script>
									<!-- //search-scripts -->
											 <!---->
											  <div class="col-md-4 player">
													<div class="audio-player">
   														</div>
												<!---->
												 
												 


												<!--//-->
												 	
											</div>
											<div class="col-md-4 login-pop">
                                                                                            <div id="loginpop">
                                                                                                <%
                                                                                                  
                                                                                                 if(email==null && session.getAttribute(email)==null){
                                                                                                    
                                                                                                    
                                                                                                %>
                                                                                                <a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                                                                                <%
                                                                                                 }
                                                                                                 else{
                                                                                                     %>
                                                                                                    <a href="Logout.jsp" ><span>Logout <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a>  
                                                                                                <%
                                                                                                 }
                                                                                                 %>
                                                                                               
                                                                                                <div id="loginBox">  
												<form action="check.jsp" method="post" id="loginForm">
																	<fieldset id="body">
																		<fieldset>
																			  <label for="email">Email Address</label>
																			  <input type="text" name="email" id="email">
																		</fieldset>
																		<fieldset>
																				<label for="password">Password</label>
																				<input type="password" name="pass" id="password">
																		 </fieldset>
																		<input type="submit" id="login" value="Login">
																		<label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
																	</fieldset>
																 
														 </form>
													</div>
												</div>

											</div>
										<div class="clearfix"> </div>
								</div>
							<!-------->
						</div>
					<div class="clearfix"></div>
				</div>
			<!--notification menu end -->
			<!-- //header-ends -->
 	 <!-- /w3l-agileits -->
		<!-- //header-ends -->
			<div id="page-wrapper">
                            <%
                              try{
                                  Class.forName("com.mysql.jdbc.Driver");
                                  Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                                  Statement  st = cn.createStatement();
                                  ResultSet rs = st.executeQuery("select * from category where code='"+code+"' ");
                                  if(rs.next()){
                                      %>
                                      <div class="col-sm-12 w3-card"><center><strong><%out.print(rs.getString("category_name"));%></strong></center></div>
                                      <%
                                  }
                              }
                              catch(Exception er){
                                  out.print(er.getMessage());
                              }


                            %> 
                                      <br><br><div id="record"></div>		
						 
			 </div>
					</div>
                                     
			 
        <!--footer section start-->
			<footer>
                             
                      <h3 style="color:white;">MP3 © 2022</h3> <p>Made with ❤ By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p>

 			</footer>
       
   </section>
  
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>

    
    <%
}




%> 