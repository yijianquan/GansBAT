<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>欢迎反馈意见和建议</title>
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
<link rel="stylesheet" href="css/contact.css" type="text/css" />
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
	<jsp:include page="head.jsp"></jsp:include>
	
		<!--content-->
		<div class="container">
			<div class="contact">
				<div class="sendmail">
					<h4> 向我们发送邮件:</h4>
					<form action="${ctx }contact/storage" method="post">
						<div class="yourname">
							<p> 您的姓名<span>*</span></p>
							<input type="text" name="contact_name">
						</div>
						<div class="youremail">
							<p> 您的邮箱地址/联系方式<span>*</span></p>
							<input type="text" name="contact_infro" placeholder="电话/QQ/Wechat">
						</div>
						<div class="yourcontent">
							<p> 标题/类型<span>*</span></p>
							<input type="text" name="contact_title" size="50">
						</div>
						<div class="yoursuggest">
							<p>具体建议<span>*</span></p>
							<textarea cols="50" rows="8" name="contact_con"></textarea>
						</div>
						<div class="send">
							<input type="submit" value="发送" >
						</div>
					</form>
			 	</div>
				<div class="joinus">
					<h4>欢迎加入我们的项目组进行讨论</h4>
					<div class="qrcode">
						<img src="images/twoforhouse.jpg">
						<p><h4>扫一扫，加入工作人员的群聊！</h4></p>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 上传建议成功提示页面  -->
		<% String uoloadok = (String)request.getAttribute("contact_ok");
		if("1".equals(uoloadok)||uoloadok=="1"){%>
		<script>
			alert('感谢您的反馈，工作人员将尽快处理这些意见和建议!');
		</script>
		<%} %>
		
		<!--content-->
	<!--footer-->	
	<jsp:include page="foot.jsp"></jsp:include>
		
</body>
</html>