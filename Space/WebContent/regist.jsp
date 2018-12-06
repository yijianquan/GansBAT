<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<li class="smallicon"><a href="information.html"
							class="scroll"><img src="images/account.jpg"></a></li>
						<li class="smallicon"><a href="trends.html" class="scroll"><img
								src="images/trends.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
	<div class="footer" style="margin-top: 2%;">
		<div class="container">
		
			<div class="foter-bottom" style="text-align: left;">
				<a href="contact.html"><img src="images/icon.jpg" style="text-align: left;"><p style="color: #FFFFFF;display: inline;margin-left: 1%;">欢迎向我们提出建议</p></a><br><br>
				<p class="footer-grid">声明：本网站只为了给用户提供场地信息，如有错误欢迎指正，对网页上内容的真实性不提供确切保证。</p>
				<p class="footer-grid" style="float: right;">联系我们，QQ:138888888</p>
			</div>
		</div>
	</div>
</body>
</html>