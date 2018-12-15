<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>(๑╹◡╹)ﾉ"""の个人动态</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Passion+One:400,700,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
 <script src="js/responsiveslides.min.js"></script>
<link rel="stylesheet" href="css/trends.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!--//header-->
	
	<!-- spacetypes -->
	<div class="container container1">
		<script>
		$(function(){
			var nickname = ${nickname};
			console.log(nickname);
			if(nickname==null){
				$("#nickname").text('您当前还未登录！');
			}
		})
		</script>
		<p><h4 id="nickname">${nickname}</h4>&nbsp&nbsp<h5>${email }</h5></p>
		<img src="images/line.jpg" class="trends_line">
		<div class="trends_type">
			<div class="trends_pchatdiv">
				<p class="trends_pchat" id="trends_pchat" onclick="clickchatroom()"><img class="trends_pchatimg" id="trends_pchatimg" src="images/finger.jpg">曾经加入的聊天室*</p>
			</div>
			<div class="trends_puploaddiv">
				<p class="trends_pupload" id="trends_pupload" onclick="clickupload()"><img class="trends_puploadimg" id="trends_puploadimg" src="images/white.jpg">上传过的场地*</p>
			</div>
		</div>
		<div class="historychat" id="historychat"">
			<div class="singlechat">
				<p>河北师范大学西操场篮球场の聊天室</p><input type="submit" name="" value="删除该聊天室" class="deletechat">
			</div>
			<div class="singlechat">
				<p>平安公园篮球场の聊天室</p><input type="submit" name="" value="删除该聊天室" class="deletechat">
			</div>
			<div class="singlechat">
				<p>河北科技大学体院馆篮球场の聊天室</p><input type="submit" name="" value="删除该聊天室" class="deletechat">
			</div>
			<div class="singlechat">
				<p>桥西恒大小区篮球场の聊天室</p><input type="submit" name="" value="删除该聊天室" class="deletechat">
			</div>
			<div class="singlechat">
				<p>河北师范大学西操场篮球场の聊天室</p><input type="submit" name="" value="删除该聊天室" class="deletechat">
			</div>
			<p class="prompt">最多显示5个最近的，没有更多了哦(￣▽￣)~*</p>
			<!--<div class="promptchatroom">
				<h3>你都还没聊过天！</h3>
			</div>-->
		</div>
		<div class="historyupload" id="historyupload">
			<!--<div class="promptupload">
				<h3>你似乎还没上传过场地！</h3>
				<a href="">上传个自己发现的场地吧(　 ´-ω ･)▄︻┻┳══━一</a>
			</div>-->
			<c:forEach items="${u_history}" var="u_history" >
				<div class="uploadsingle">
					<a href="">${u_history.space_address }</a>
					<div class="uploadimg">
						<a href=""><img src="${u_history.space_img1 }"></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>