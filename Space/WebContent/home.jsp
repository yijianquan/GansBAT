<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Space智能科技欢迎您</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<script src="js/jquery.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<!--header-->
	
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
								<a href="${ctx }/spacetype/select"><img class="img-responsive left-pic" src="images/moreplace.jpg" alt=" " /></a>
								<a href="${ctx }/spacetype/select"><p>更多场地……</p></a>							
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
	<jsp:include page="foot.jsp"></jsp:include>
		
</body>
</html>