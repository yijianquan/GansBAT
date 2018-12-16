<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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

</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!--//header-->

	<!-- spacetypes -->
	<div class="container container1">

		<!--个人信息-->
		<div class="intro">
			<p class="introprefix">昵称：</p><p class="introvalue">${user.nickname }</p><a href="#" style="display: block;float: right;font-size: 1.3em;color: blue;margin-top: 1%;" data-toggle="modal" data-target="#edit">编辑资料</a>
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
			<p class="introprefix">邮箱：</p><p class="introvalue">${user.email }</p><br/>
			<p class="introprefix"><img src="images/sex.jpg">：</p><p class="introvalue" id="usersex"></p><br/>
			<p class="introprefix">爱好：</p><p class="introvalue">${user.hobby }</p><br/>
			<p class="introprefix">住址：</p><p class="introvalue">${user.address }</p><br/>
		</div>
			<!-- 根据传来的数字判断性别是男是女 -->
			<script>
			$(function(){
				var sex = ${user.sex};
				console.log(sex);
				if(sex==1){
					$("#usersex").text('男');
				}else{
					$("#usersex").text('女');
				}
			})
			</script>

		<!--上传过的场地-->
		<div class="historyupload" id="historyupload">
			<p>上传过的场地：</p>
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
			<div style="float:right;margin-right:5%;margin-top:2%;">
				<a href="${ctx}/usercenter/tocenter?pageNum=1">首页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${u_page.prePageNum}">上一页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${u_page.nextPageNum}">下一页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${u_page.totalPageNum}">末页</a>
			</div>
		</div>

		<!--用户浏览过的场地历史-->
		<div class="browserhistory">
			<p class="historycontent">浏览历史：</p>
			<div class="browsercontent">
				<c:forEach items="${p_history}" var="p_history" >
					<p><a href="#">${p_history.space_name}</a></p>
				</c:forEach>
			</div>
			<div style="float:right;margin-right:5%;">
				<a href="${ctx}/usercenter/tocenter?pageNum=1">首页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${page.prePageNum}">上一页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${page.nextPageNum}">下一页</a>
				<a href="${ctx}/usercenter/tocenter?pageNum=${page.totalPageNum}">末页</a>
			</div>
		</div>

	</div>
	
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
	
</body>
</html>