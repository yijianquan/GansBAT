<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>上传场地</title>
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
<link rel="stylesheet" href="css/upload.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- header -->
	<c:if test="${results != null }">
		<script>
			alert("${results }");
		</script>
		${results = null };
	</c:if>
	<!-- body -->
	<div class="container container1">
	<div class="upload">
		<p class="upload_title">上传一个你发现的场地</p>
		<form action="${ctx }/upload/upload" method="post" enctype="multipart/form-data" >
			
			<p class="upload_must">*</p><p class="upload_intro">详细地点：</p><a href="mapupload.jsp">点击获取地图定位</a><c:if test="${longitude!=null }"><img alt="" src="images/ok.png"></c:if><br>
			
			<p class="upload_must">*</p><p class="upload_intro">场地类别：</p>
				<select name="type_id">
					<option value="1">篮球场</option>
					<option value="2">足球场</option>
					<option value="3">乒乓球场</option>
					<option value="4">橡胶跑道</option>
					<option value="5">健身场地</option>
					<option value="6">排球场</option>
					<option value="7">其他类别</option>
				</select>
				<br>

			<p class="upload_must">*</p><p class="upload_intro">上传图片：</p><input type="file" name="upfile"/>

			<p class="upload_otherintro">是否收费：</p>
					<input type="radio" name="charge" value="1">是
					<input type="radio" name="charge" value="0">否<br>

			<p class="upload_otherintro">场地描述：</p>
				<input type="textarea" name="intro" class="upload_formw" placeholder="室内室外，地面类型" value="">

			<p class="upload_otherintro">开放时间:</p>
				<input type="text" name="opentime" class="upload_formw" placeholder="简要描述" value=""/><br>

			<input type="submit" class="upload_submit" value="提交"/>
		
		</form>
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
