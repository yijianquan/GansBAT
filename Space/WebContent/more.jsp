<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Space类型</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport"bcontent="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link href='font/font.css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='font/font.css?family=Passion+One:400,700,900' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/more.css" type="text/css" />
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
	<!--//header-->
	<!-- spacetypes -->
	<div class="container">
		<div class="more">
			<div class="upload">
				<input type="button" class="btn btn-upload radius" value="上传场地">
			</div>
			<c:forEach items="${spacetype}" var="spacetype" >		
			<div class="space_types" style="background: url(${spacetype.type_img }) no-repeat; background-size: 100% 100%">
				<span><p>${spacetype.type_name }</p></span> <a href="${ctx }/selectspace/alltypespace?spacetype=${spacetype.type_id }" class="now"></a>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>