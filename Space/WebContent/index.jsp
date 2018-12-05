<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Space智能科技欢迎您</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='font/font.css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='font/font.css?family=Passion+One:400,700,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
 <script src="js/responsiveslides.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
		$('#login-button').click(function(event) {
			event.preventDefault();
			$('form').fadeOut(500);
			$('.wrapper').addClass('form-success');
		});
</script>
</head>
<body>
	<!--header-->
	<div class="header-bottom-top">
		<div class="container">
			<div class="clearfix"></div>
			<div class="header-bottom">
				<div class="logo" style="margin-top: 2% ；">
					<a href="index.html"><img src="images/logo.jpg" alt=" " /></a>
				</div>
				<div class="top-nav">
					<ul>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><img
								src="images/login.jpg"></a> <!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content login">
										<div class="wrapper">
											<div class="cont">
												<h1>Welcome</h1>
												<form class="form">
													<input type="text" placeholder="Email Address（邮箱）"> <input
														type="password" placeholder="Password （密码）">
													<button type="submit" id="login-button">Login（登陆）</button><br>
													<a href="#"><div class="login_foot_left">忘记密码</div></a>
													<a href="regist.html"><div class="login_foot_right" ">注册</div></a>
												</form>
											</div>
											<ul class="bg-bubbles">
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
											</ul>

										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div></li>
						<li class="smallicon"><a href="information.jsp"
							class="scroll"><img src="images/account.jpg"></a></li>
						<li class="smallicon"><a href="trends.jsp" class="scroll"><img
								src="images/trends.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
		<!--banner-->
		 <div class="slider" style="z-index:-1;">
			<ul class="rslides" id="slider2">
			  <li><a href="#"><img src="images/ban.jpg" alt="">
			  <div class="banner">
			  <span class=" matter "> </span>
			  </div>
			  </a></li>
			  <li><a href="#"><img src="images/bb1.jpg" alt="">
			   <div class="banner">
			  <span class=" matter"> </span>
			  </div>
			   </a></li>
			  <li><a href="#"><img src="images/bb.jpg" alt="">
				<div class="banner">
			  <span class="matter "> </span>
			  </div>
			  </a></li>
			   
			  </a></li>
			</ul>
		</div>

		<!--content-->
			<div class="content">
				<div class="content-app">
					<div class="container">
						<div class="content-from">
							<div class="col-md-4 from-grid ">
								<a href="detail.html"><img class="img-responsive left-pic" src="images/basketball.jpg" alt=" " /></a>
								<a href="detail.html"><p>篮球场</p></a>							
							</div>
							<div class="col-md-4 from-grid ">
								<a href="detail.html"><img class="img-responsive left-pic" src="images/football.jpg" alt=" " /></a>
								<a href="detail.html"><p>足球场</p></a>							
							</div>
							<div class="col-md-4 from-grid ">
								<a href="detail.html"><img class="img-responsive left-pic" src="images/pingpong.jpg" alt=" " /></a>
								<a href="detail.html"><p>乒乓球</p></a>							
							</div>
							<div class="col-md-4 from-grid ">
								<a href="detail.html"><img class="img-responsive left-pic" src="images/ground.jpg" alt=" " /></a>
								<a href="detail.html"><p>橡胶跑道</p></a>							
							</div>
							<div class="col-md-4 from-grid ">
								<a href="detail.html"><img class="img-responsive left-pic" src="images/bodybuild.jpg" alt=" " /></a>
								<a href="detail.html"><p>健身场地</p></a>							
							</div>
							<div class="col-md-4 from-grid ">
								<a href="more.html"><img class="img-responsive left-pic" src="images/moreplace.jpg" alt=" " /></a>
								<a href="more.html"><p>更多场地……</p></a>							
							</div>							
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<!---->
		<!---->		
		</div>
	<!--footer-->
	<div class="footer">
		<div class="container">
		
			<div class="foter-bottom">
				<a href="contact.html"><img src="images/icon.jpg"><p style="color: #FFFFFF;display: inline;margin-left: 1%;">欢迎向我们提出建议</p></a><br><br>
				<p class="footer-grid">声明：本网站只为了给用户提供场地信息，如有错误欢迎指正，对网页上内容的真实性不提供确切保证。</p>

				<p class="footer-grid" style="float: right;">联系我们，QQ:138888888</p>
			</div>
		</div>
	</div>
		
</body>
</html>