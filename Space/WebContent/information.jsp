<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ヾ(◍°∇°◍)ﾉﾞの空间</title>
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
<link rel="stylesheet" href="css/information.css" type="text/css" />
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

		<!--个人信息-->
		<div class="intro">
			<p class="introprefix">昵称：</p><p class="introvalue">GansBAT炒鸡小组冲鸭</p><a href="#" style="display: block;float: right;font-size: 1.3em;color: blue;margin-top: 1%;" data-toggle="modal" data-target="#edit">编辑资料</a>
				<!--弹框-->
				<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
               					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
           					</div>

           					<div class="edit_data" style="color:black;">
           						<center>
	           							<form style="margin-bottom:15px ;margin-top:15px">

	           								昵称：<input type="text" name="userID" value="" placeholder="请输入你的昵称"style="width:300px; height:40px;" />*<br><br>
	           								性别：<label><input name="sex" type="radio" value="男" />男 </label> 
											     <label><input name="sex" type="radio" value="女" />女 </label><br><br> 
	           								爱好：<input type="text" name="hobby" value="" placeholder="请输入你的爱好"style="width:300px; height:40px;" /> <br><br>
	           								住址：<input type="text" name="address" value="" placeholder="省/市/(区/县)"style="width:300px; height:40px;" /> <br><br>
	           								年龄：<input type="text" name="age" value="" placeholder="请输入你的年龄"style="width:300px; height:40px;" /> <br><br>
	           							 	<input type=submit name="submit1"  class="btn "  value="保存 " onclick="return check(this.form)">  
	           							</form>
	           					</center>
           					</div>

				        </div><!-- /.modal-content -->
				    </div><!-- /.modal -->
				</div>
			<br/>
			<p class="introprefix">邮箱：</p><p class="introvalue">1388888888@qq.com</p><br/>
			<p class="introprefix"><img src="images/sex.jpg">：</p><p class="introvalue">男</p><br/>
			<p class="introprefix">爱好：</p><p class="introvalue">篮球 足球</p><br/>
			<p class="introprefix">住址：</p><p class="introvalue">湖南省湘潭市</p><br/>
		</div>

		<!--上传过的场地-->
		<div class="historyupload" id="historyupload">
			<p>上传过的场地：</p>
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

		<!--用户浏览过的场地历史-->
		<div class="browserhistory">
			<p class="historycontent">浏览历史：</p>
			<div class="browsercontent">
				<a href="#"><p>河北师范大学西操场篮球场の聊天室</p></a>
				<a href="#"><p>河北师范大学西操场篮球场の聊天室</p></a>
				<a href="#"><p>河北师范大学西操场篮球场の聊天室</p></a>
				<a href="#"><p>河北师范大学西操场篮球场の聊天室</p></a>
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