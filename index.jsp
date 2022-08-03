<%-- 
    Document   : index
    Created on : 6 May, 2022, 10:43:59 AM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
  String email = null;
      Cookie c[] = request.getCookies();
      for (int i = 0; i < c.length; i++) {
          if (c[i].getName().equals("Login")) {
              email = c[i].getValue();
              break;
          }
      }
    
    
%>
<!--
Author: W3layouts
 Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.css" type='text/css' />
<!-- //lined-icons -->
 <!-- Meters graphs -->
<script src="js/jquery-2.1.4.js"></script>
<script>
    $(document).ready(function(){
        $("#mod").click(function(){
            $("#myModal").modal();
            
        });
        $("#search").keyup(function(){
          var txt="";
          txt = $(this).val();
        if(txt==""){
                $("#record").load("new_index.jsp");
        }
        else{
            $.post(
                  "search.jsp",{txt:txt},function(data){
                      $(".record").html(data);
                   } 
            );  
        }
        
        });
        
    });
    
    
    
    
</script>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color:green;color:white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" ><strong><center>Login</center></strong></h4>
        </div>
        <div class="modal-body">
            <form action="check.jsp" method="post" id="modoloform">
                <label>Email Id:</label>
                <input type="text" name="email" class="form-control"><br>
                <label>Password:</label>
                <input type="password" name="pass" class="form-control"><br>
                <input type="submit" value="submit" class="btn btn-success">
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

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
                                                <%
                                                 if(email==null && session.getAttribute(email)==null){
                                                     %>
                                                <li id="mod"><a><i class="lnr lnr-heart"></i><span>My Favorite</span></a></li>
                                                     <%
                                                 }
                                                 else{
                                                     %>
                                                <li><a href="my_favorite.jsp"><i class="lnr lnr-heart"></i><span>My Favorite</span></a></li>
                                                
                                                     <%
                                                 }
      
       
                                                 %>
                                                    
                                                    <%
                                                  
                                                 if(email!=null && session.getAttribute(email)!=null){
                                                      try{
                                                          Class.forName("com.mysql.jdbc.Driver");
                                                          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                                                          Statement  st = cn.createStatement();
                                                          ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                                                          if(rs.next()){
                                                              %>
                                                               	  
                                                              <li><a href="user_profile.jsp"><i class="fa fa-user"></i><span><%out.print(rs.getString("name"));%></span></a></li>
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
									<form  method="post">

										<input class="sb-search-input" placeholder="Search" type="search" id="search">
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
			<div id="page-wrapper" class="record">
				<div class="inner-content">
				
				      <div class="music-left">
					      <!--banner-section-->
							<div class="banner-section">
								<div class="banner">
									 <div class="callbacks_container">
										<ul class="rslides callbacks callbacks1" id="slider4">
                                                                                    <%
                                                                                        try{
                                                                                            
                                                                                        
                                                                                       Class.forName("com.mysql.jdbc.Driver");
                                                                                       Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                                                                                       Statement st = cn.createStatement();
                                                                                       ResultSet rs = st.executeQuery("Select * from album where status=0");
                                                                                       while(rs.next()){
                                                                                           %>
                                                                                           <li>
                                                                                               <div class="banner-img">

                                                                                                  <a href="play_song.jsp?code=<%=rs.getString("code")%>"> <img src="album/<%=rs.getString("code")%>.jpg" class="img-responsive" alt=""></a>
                                                                                                   
                                                                                               </div>
                                                                                               <div class="banner-info">
                                                                                                   <a class="trend" href="#">TRENDING</a>
                                                                                                   <h3>Let Your Home</h3>
                                                                                                   <p>Album by <strong style="color:blue">&nbsp;&nbsp;&nbsp;       <%out.print(rs.getString("album_name"));%></strong></p>
                                                                       
                                                                                               </div>

                                                                                           </li>
                                                                                           
                                                                                           <%
                                                                                       }
                                                                                        }
                                                                                        catch(Exception er){
                                                                                            out.print(er.getMessage());
                                                                                            
                                                                                        }

                                                                                    %>	   	 
												  
											</ul>
										</div>
										<!--banner-->
									<script src="js/responsiveslides.min.js"></script>
								 <script>
									// You can also use "$(window).load(function() {"
									$(function () {
									  // Slideshow 4
									  $("#slider4").responsiveSlides({
										auto: true,
										pager:true,
										nav:true,
										speed: 500,
										namespace: "callbacks",
										before: function () {
										  $('.events').append("<li>before event fired.</li>");
										},
										after: function () {
										  $('.events').append("<li>after event fired.</li>");
										}
									  });
								
									});
								  </script>
								<div class="clearfix"> </div>
							</div>
						</div>	
                                      </div>
                                                                                    <div class="clearfix"> </div>
                                       <br><br><br><br><br>
				<!--//End-banner-->
					<!--albums-->
					<!-- pop-up-box --> 
							<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all">
							<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
							 <script>
									$(document).ready(function() {
									$('.popup-with-zoom-anim').magnificPopup({
										type: 'inline',
										fixedContentPos: false,
										fixedBgPos: true,
										overflowY: 'auto',
										closeBtnInside: true,
										preloader: false,
										midClick: true,
										removalDelay: 300,
										mainClass: 'my-mfp-zoom-in'
									});
									});
							</script>		
					<!--//pop-up-box -->
                                           <%
                                             try{
                                                 Class.forName("com.mysql.jdbc.Driver");
                                                 Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                                                 Statement st = cn.createStatement();
                                                 ResultSet rs = st.executeQuery("select * from category where status=0");
                                                 while(rs.next()){
                                                     %>
                                                     <div class="col-sm-12">
								<div class="tittle-head">
									<h3 class="tittle"><%=rs.getString("category_name")%></h3>
									<a href="see_all.jsp?cat_code=<%=rs.getString("code")%>"><h4 class="tittle">See all</h4></a>
									<div class="clearfix"> </div>
                                                                         <%
                                                                         Statement st1 =cn.createStatement();
                                                                         ResultSet rs1 = st1.executeQuery("select * from album where category_code='"+rs.getString("code")+"' AND status=0 limit 0,4");
                            
                                                                         while(rs1.next()){
                                                                             %>
                                                                              
                                                                                    <div class="col-sm-3">
                                                                                        <table class="table table-borderless w3-card">
                                                                                            <tr><td align=center><a href="play_song.jsp?code=<%=rs1.getString("code")%>"><img src="album/<%=rs1.getString("code")%>.jpg" class="img-responsive"></a></td></tr>
                                                                                            <tr><td><b><a href="play_song.jsp?code=<%=rs1.getString("code")%>" style="text-decoration:none;"><%out.print(rs1.getString("album_name"));%></a></b>   </td></tr>
                                                                                        </table>

                                                                                    </div>
                                                                            
                                                                                  
                                                                             
                                                                             <%
                                                                         }
                                                     
                                                     
                                                     
                                                                         %>
								</div>
                                                                         
                                                     </div>
                                                     <%
                                                 }
                                             } 
                                             catch(Exception ep){
                                                 out.print(ep.getMessage());
                                             }
                                                                                        
                                                                                        
                                                                                        
                                            %>
						 
					<!--//End-albums-->
						<!--//discover-view-->
						 
								<!--//discover-view-->
							</div>
							<!--//music-left-->
						    <!--/music-right-->
						    
													 <!--//music-right-->
											<div class="clearfix"></div>
			 	 <!-- /w3l-agile-its -->
										</div>
						<!--body wrapper start-->
						
						 
								</div>
							<div class="clearfix"></div>
						<!--body wrapper end-->
 	 <!-- /w3l-agile -->
					</div>
			  <!--body wrapper end-->
			     <div class="footer">
                                 <div class="col-sm-12" ><br><br><br><center><h2 style="color:#93F217">Bas Bajna Chahiye Gaana</h2></br></br></br></center></div>   
				<div class="footer-grid">
					<h3>Albums</h3>
					<ul class="list1">
					  <li><a href="#" style="color:white;text-decoration: none;">English</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Hindi</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Gujrati</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Punjabi</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Haryanvi</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Kanaada</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Songs</h3>
				    <ul class="list1">
					  <li><a href="#" style="color:white;text-decoration: none;">Dhummu Dholi</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Hanuman Chalisa</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Bachpan Ka Pyaar</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Yashoda Ka Nandlala</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Burj Khalifa</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Filhaal 2 Mohabbat</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Artists</h3>
					<ul class="list1">
					  <li><a href="#" style="color:white;text-decoration: none;">Arijit Singh</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Neha Kakkar</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Honey Singh</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Atif Aslam</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">A R Rahman</a></li>
					  <li><a href="#" style="color:white;text-decoration: none;">Kishore Kumar</a></li>
				    </ul>
				  </div>
					  <div class="footer-grid">
						<h3>New Release Song</h3>
                                                <ul class="list1">
                                                    <li><a href="#" style="color:white;text-decoration: none;">De Taali</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Sanam Bewfa</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Barish Ban Jaana</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Dilwalo ki</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Is Qudar</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Jab Tak Pass ho</a></li>
                                                </ul>
					 </div>
					 <div class="footer-grid footer-grid_last">
						<h3>New Release Albums</h3>
                                                 <ul class="list1">
                                                    <li><a href="#" style="color:white;text-decoration: none;">Rock Album</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Sad Album</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Disco Song Album</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Love Song Album</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Bewfa Song Album</a></li>
                                                    <li><a href="#" style="color:white;text-decoration: none;">Historical Song Album</a></li>
                                                </ul>
 					 </div>
					 <div class="clearfix"> </div>
				</div>
			</div>
        <!--footer section start-->
			<footer>
                             
                      <h3 style="color:white;">MP3 © 2022</h3> <p>Made with ❤ By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p>

 			</footer>
        <!--footer section end-->
 	 <!-- /w3l-agile -->
      <!-- main content end-->
   </section>
  
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>
