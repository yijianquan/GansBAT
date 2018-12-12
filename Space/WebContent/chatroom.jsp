<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>聊天室</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport"bcontent="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link href='font/font.css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='font/font.css?family=Passion+One:400,700,900' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/chatroom.css" type="text/css" />
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
		<div class="chatroom">
			<!--三个按钮-->
			<div class="threebutton">
				<a href="">
					<p style="background-color: yellow;">聊天室</p>
				</a>
				<a href="">
					<p style="background-color: green;">个人设置</p>
				</a>
				<a href="">
					<p style="background-color: red;">退出聊天</p>
				</a>
			</div>

			<!--聊天框-->
			<div class="chatframe">

				<!--聊天内容-->
				<div class="chatcontent">
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
					<div class="human">
						<p>王伟老师：</p>
						<p>大家下午都来打球啊！</p>
					</div>
				</div>
				
				<!--发送聊天-->
				<div class="sendmessage">
					<div class="chatbutton">
						<input type="button" name="" value="刷 新" class="chatfresh">
						<input type="button" name="" value="发 送" class="chatsend">
					</div>
					<div class="sendframe">
						<textarea></textarea>
					</div>
				</div>
			</div>

			<!--成员-->
			<div class="member">
				<div class="membersingle">
					<p style="display:inline;">王伟老师：</p><p style="display: inline;margin-left: 20%;">年龄：42</p><br>
					<p style="display:inline;">身高：175</p><p style="display: inline;margin-left: 20%;">体重：140</p>
					<p>自我介绍：我的优点是我很帅，我的缺点是我帅的并不明显</p>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->	
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>