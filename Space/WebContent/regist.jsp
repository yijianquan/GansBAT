<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>欢迎来到Space大家庭</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/regist.css" type="text/css" />
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
 <script>
    function check(){
		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
		var obj = document.getElementById("mazey"); //要验证的对象
		if(obj.value === ""){ //输入不能为空
			document.getElementById("tip1").innerText="邮箱不能为空！";
			return false;
		}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
			document.getElementById("tip1").innerText="邮箱格式不正确！";
			return false;}
		else{
			document.getElementById("tip1").innerText="邮箱格式正确！";
			return true;
		}
	}    
    function pwCheck(obj){
    	var pass1 = document.getElementById("p1").value;
    	var pass2 = obj.value;
    	if(pass1 == pass2){
    		document.getElementById("tip").innerText="两次密码一致！";
    	}else{
    		document.getElementById("tip").innerText="两次密码不一致！";
    		
    	}
    	if (pass1 == 0 && pass2 == 0) {
    		document.getElementById("tip").innerText="请输入你的密码";
    	} 

    }
  </script>
<style type="text/css">
	#tip{
		float: right;
		margin-right: 170px;
		margin-top: 10px;
	}
	#tip1{
		float: right;
		margin-right: 170px;
		margin-top: 10px;
	}
</style>
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
	<!--//header-->

	<!-- spacetypes -->
	<div class="container container1">
		<div class="registtitle">
		<p><h1>用 户 注 册</h1></p>
		</div>
		<div class="registinfo">
		<form action="${ctx }regist/storage" method="post">
			<h5>你的邮箱*</h5>
			<input class="registinformation" type="text" name="email" id="mazey" placeholder="请输入你的email" onblur="check()"><div id="tip1"></div>
			<h5>你的昵称*</h5>
			<input class="registinformation" type="text" name="nickname" placeholder="请输入你的昵称">
			<h5>请输入你的密码*</h5>
			<input class="registinformation" type="password" name="password" placeholder="请输入你的密码" id="p1">
			<h5>请确认你的密码*</h5>			
			<input class="registinformation" type="password" name="confirmpassword" placeholder="请确认你的密码" id="p2" onblur="pwCheck(this)"><div id="tip"></div>

			<input type="text" name="code" placeholder="请输入你收到的验证码" class="registcode">
			<input type="submit" value="向邮箱发送验证码" class="sendcode">
			<div>
				<input id="regist" type="submit" value="注 册" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#9D9D9D'" class="registbutton">
			</div>
		</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>