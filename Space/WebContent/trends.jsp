<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<p><h4>********昵称</h4>&nbsp&nbsp<h5><1355335683@qq.com></h5></p>
		<img src="images/line.jpg" class="trends_line">
		<div class="trends_type">
			<div class="trends_pchatdiv">
				<p class="trends_pchat" id="trends_pchat"><img class="trends_pchatimg" id="trends_pchatimg" src="images/finger.jpg"><a href="" onclick="clickchatroom()">曾经加入的聊天室*</a></p>
			</div>
			<div class="trends_puploaddiv">
				<p class="trends_pupload" id="trends_pupload"><img class="trends_puploadimg" id="trends_puploadimg" src="images/white.jpg"><a href="" onclick="clickupload()">上传过的场地*</a></p>
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
			<div class="uploadsingle">
				<a href="">河北师大体育学院</a>
				<div class="uploadimg">
					<a href=""><img src="images/history.jpg"></a>
				</div>
			</div>
			<div class="uploadsingle">
				<a href="">河北师大体育学院</a>
				<div class="uploadimg">
					<a href=""><img src="images/history.jpg"></a>
				</div>
			</div>
			<div class="uploadsingle">
				<a href="">河北师大体育学院</a>
				<div class="uploadimg">
					<a href=""><img src="images/history.jpg"></a>
				</div>
			</div>
			<div class="uploadsingle">
				<a href="">河北师大体育学院</a>
				<div class="uploadimg">
					<a href=""><img src="images/history.jpg"></a>
				</div>
			</div>
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