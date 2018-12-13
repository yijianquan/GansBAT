<%@page import="com.gansbat.space.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>space</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/space.css" type="text/css" />
<link rel="stylesheet" href="css/buttons.css">
</head>
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
</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- header -->
	<!-- body -->
	<div class="container container1">
	<div id="space">
		<div class="space_pic">
		<!-- 轮播图像素大小：640*470 -->
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner pic">
					<div class="item active">
						<img src="${space.space_img1 }" width="100%" height=auto>
					</div>
					<div class="item">
						<img src="${space.space_img2 }">
					</div>
					<div class="item">
						<img src="${space.space_img3 }">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="space_comment">
			<textarea class="space_textarea" name="" placeholder="发表下你对球场的评论："></textarea>
			<div class="space_sbm">
				<a href="#" class="button button-glow button-rounded button-raised button-primary">send</a>
			</div>
			<div class="cmt">				
				
				<c:forEach items="${comment}" var="comment" >
				<div class="space_cmt">
					<div class="cmt_pic">
						<a href="#"><img class="user_pic" src="images/account.jpg" /></a>
					</div>
					<div class="cmt_content">
						<span><a href="#">${comment.user_nickname }</a></span>
						<span class="pl"><a href="#">评论：</a></span>
						<p>${ comment.comment}</p>
					</div>
				</div>	
				</c:forEach>

			</div>
		</div>
		<div class="space_introduction">
			<div class="intro">
				<!-- 简介 -->
				<span class="intro_font">位置：</span>${space.space_address }<br> 
				<span class="intro_font">距你：</span>0.5km<br> 
				<a href="#"><img class="space_icon" src="images/like.png" /></a>&nbsp;&nbsp;<span>“点赞数：”${space.likenum }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img class="space_icon" src="images/share.png" />&nbsp;&nbsp;&nbsp;分享</a><br>
				<span style="font-size:1.3em"><a href="#">"聊天室"</a></span><span style="font-size:1.3em;margin-left:2em;"><a href="${ctx }/selectthisspace/map">"查看地图"</a></span>
			</div>
			<div class="intro">
				<!-- 详情 -->
				<span class="intro_font">是否收费：</span><span id="charge"></span><br>
				<span class="intro_font">场地类型：</span><span>${space.space_intro }</span><br> 
				<span class="intro_font">开放时间：</span><span>${space.opentime }</span><br>
			</div>
			<div class="space_btn">
			<a href="#" class="button button-glow button-border button-rounded button-primary">信息不准确，我要反馈</a>
			</div>			
		</div>
		<script>
			$(function(){
				var charge = ${charge};
				console.log(charge);
				if(charge==1){
					$("#charge").text('是');
				}else{
					$("#charge").text('否');
				}
			})
		</script>
	</div>
	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>