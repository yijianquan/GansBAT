<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>聊天室</title>
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
<link rel="stylesheet" href="css/chatroom.css" type="text/css" />
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
	<!-- header -->

	<!-- body -->
	<div class="container container1">
		<div class="chatroom">
			<!--三个按钮-->
			<div class="threebutton">
				<a href="">
					<p style="background-color: yellow;">聊天室</p>
				</a>
				<p style="background-color: green;" data-toggle="modal" data-target="#edit">个人设置</p>
								
				<!--弹框-->
				<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
               					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
           					</div>

           					<div class="edit_data" style="color:black;">
           						<center>
	           							<form onsubmit="return checkForm()" action="${ctx }/chatroom/changeinformation?space_id=${space_id }" method="post" style="margin-bottom:15px ;margin-top:15px">
	           								昵称：<input type="text" name="user_nickname" value="" placeholder="请输入你的昵称"style="width:300px; height:40px;" />*<br><br>
	           								介绍：<input type="text" name="intro" value="" placeholder="请输入你的爱好"style="width:300px; height:40px;" /> <br><br>
	           								年龄：<input type="text" name="age" value="" placeholder="请输入你的年龄"style="width:300px; height:40px;" /> <br><br>
	           								身高：<input type="text" name="height" value="" placeholder="请输入你的身高（cm）"style="width:300px; height:40px;" /> <br><br>
	           								体重：<input type="text" name="weight" value="" placeholder="请输入你的体重（kg）"style="width:300px; height:40px;" /> <br><br>
	           							 	<input type=submit name="submit1"  class="btn "  value="保存 " onclick="return check(this.form)">  
	           							</form>
	           					</center>
	           					<script type="text/javascript">
	           					function checkForm(){
	           						<%String user = (String)session.getAttribute("nowuser");
	           						if(user==null){%>
	           						alert("请先登录！");
	           						return false;
	           						<%}%>
	           						if(window.confirm("确认保存修改吗？")){
	           							return true;
	           						}
	           						return false;
	           					}
	           					</script>
           					</div>

				        </div><!-- /.modal-content -->
				    </div><!-- /.modal -->
				</div>
				
				<a href="">
					<p style="background-color: red;">退出聊天</p>
				</a>
			</div>

			<!--聊天框-->
			<div class="chatframe">

				<!--聊天内容-->
				<div class="chatcontent">
					<c:forEach items="${c_list}" var="c_list" >
						<div class="human">
							<p>${c_list.user_nickname }：</p>
							<p>${c_list.chat_content }</p>
						</div>
					</c:forEach>
				</div>
				
				<!--发送聊天-->
				<div class="sendmessage">
				
					<form action="${ctx }/chatroom/sendmessage?space_id=${space_id }" method="post" onsubmit="return check()">
						<div class="sendframe">
							<textarea name="message" id="message"></textarea>
						</div>
						<div class="chatbutton">
							<input type="submit" name="" value="刷 新" class="chatfresh">
							<input type="submit" name="" value="发 送" class="chatsend" onclick="sendMessage()">
						</div>
					</form>
				</div>
				<script>
				function sendMessage(){
					var message = $("#message").val();
					if(message==null){
						alert("请填写文章内容！");
						return false;
					}
					<%if(user==null){%>
					alert("请登录后再发送！");
					return false;
					<%}%>
					return true;
				}
				function check() { 
					 var check = false;
					 var check = sendMessage();
					 return check; 
				}
				</script>
			</div>

			<!--成员-->
			<div class="member">
				<c:forEach items="${u_list}" var="u_list" >
					<div class="membersingle">
						<p style="display:inline;">${u_list.nickname }：</p><p style="display: inline;margin-left: 20%;">年龄：${u_list.age }</p><br>
						<p style="display:inline;">身高：${u_list.height }</p><p style="display: inline;margin-left: 20%;">体重：${u_list.weight }</p>
						<p>自我介绍：${u_list.intro }</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- footer -->	
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>