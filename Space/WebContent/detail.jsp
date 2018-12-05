<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>场地列表</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/detail.css" type="text/css" />
<link rel="stylesheet" href="css/more.css" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

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
	<div class="container" style="z-index: -1;">
	<div id="detail">
		<div class="detail_top">
			<div class="detail_sort">
			<form action="" method="post">
				<select name="sort" class="sort_select">  
					<option value="综合排序">综合排序</option>  
					<option value="距离最近">距离最近</option>  
					<option value="评分最高">评分最高</option> 
      			</select>
			</form>
			</div>
			<div class="detail_upload">
				<a href="upload.html"><input type="button" class="btn btn-upload radius" value="上传场地" ></a>
			</div>
		</div>

		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball1.jpg">
			</div>
			<div class="detail_text">
				<span>地点：河北师范大学体育学院</span><br>
				<span>距离：0.3km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball2.jpg">
			</div>
			<div class="detail_text">
				<span>地点：河北师范大学西操场</span><br>
				<span>距离：0.5km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball6.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄体育馆</span><br>
				<span>距离：6km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball3.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄平安公园篮球场</span><br>
				<span>距离：2.6km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball4.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄粟水清苑</span><br>
				<span>距离：0.2km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball5.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄南山小区</span><br>
				<span>距离：7.8km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball4.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄粟水清苑</span><br>
				<span>距离：0.2km</span><br>
				<span>查看详情</span>
			</div>
			</a>
		</div>
		<div class="detail_body">
			<a href="space.html">
			<div class="detail_pic">
				<img width="100%" height="100%" src="images/basketball5.jpg">
			</div>
			<div class="detail_text">
				<span>地点：石家庄南山小区</span><br>
				<span>距离：7.8km</span><br>
				<span>查看详情</span>
			</div>
			</a>
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