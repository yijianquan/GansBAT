<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
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
		
		<c:forEach items="${typeallspace}" var="allspace" >
			<div class="detail_body">
				<a href="${ctx }/selectthisspace/aspace?space_id=${allspace.space_id }">
				<div class="detail_pic">
					<img width="100%" height="100%" src="${allspace.space_img1 }">
				</div>
				<div class="detail_text">
					<span>地点：${allspace.space_address }</span><br>
					<span>距离：0.3km</span><br>
					<span>查看详情</span>
				</div>
				</a>
			</div>
		</c:forEach>
				
	</div>

	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>