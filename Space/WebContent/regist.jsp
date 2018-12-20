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
		<form action="${ctx }/regist/storage" method="post" onsubmit="return check()">
			<h5>你的邮箱*</h5>
			<input class="registinformation" type="text" name="email" id="youremail" placeholder="请输入你的email" onblur="checkemail()"><div id="tip1"></div>
			 <script>
				 $(function () {
					var registok = "${registok}";
					if(registok == ""){
					}else{
						alert(registok);
					}
				 });
			    function checkemail(){
				 	var check = false;
					var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
					var obj = document.getElementById("youremail"); //要验证的对象
					if(obj.value === ""){ //输入不能为空
						$("#tip1").html("邮箱不能为空！");
						check = false;
					}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
						$("#tip1").html("邮箱格式不正确！");
						check = false;
					}else{
						document.getElementById("tip1").innerText="邮箱格式正确！";
						check = true;
					}
					return check;
				}    
			    function pwCheck(){
				 	var check = false;
			    	var pass1 = document.getElementById("p1").value;
			    	var pass2 = document.getElementById("p2").value;
			    	if(pass1 == pass2){
			    		document.getElementById("tip").innerText="两次密码一致！";
						check = true;
			    	}else{
			    		document.getElementById("tip").innerText="两次密码不一致！";
						check = false;			    		
			    	}
			    	if (pass1 == 0 && pass2 == 0) {
			    		document.getElementById("tip").innerText="请输入你的密码";
						check = false;
			    	} 
					return check;
			    }
				function check() { 
					 var check = false;
					 var check = pwCheck() && checkemail() && registcode();
					 if(pwCheck()==false){
						 alert("密码有误！");
						 return check;
					 }else if(checkemail()==false){
						 alert("邮箱错误！");
						 return check;
					 }else if(registcode()==false){
						 alert("验证码错误");
						 return check;
					 }
					 return check; 
				}
				function check1() { 
					 var check = false;
					 var check = pwCheck() && checkemail();
					 if(check==false){
						 return check;
					 }
					 return check; 
				}
			  </script>
			<h5>你的昵称*</h5>
			<input class="registinformation" type="text" name="nickname" placeholder="请输入你的昵称">
			<h5>请输入你的密码*</h5>
			<input class="registinformation" type="password" name="password" placeholder="请输入你的密码" id="p1">
			<h5>请确认你的密码*</h5>			
			<input class="registinformation" type="password" name="confirmpassword" placeholder="请确认你的密码" id="p2" onblur="pwCheck(this)"><div id="tip"></div>

			<input type="text" name="code" placeholder="请输入你收到的验证码" id="registcode" class="registcode">
			<input type="submit" value="向邮箱发送验证码" class="sendcode" id="btnSendCode" onclick="sendMessage()">
			<script type="text/javascript">
				var InterValObj; //timer变量，控制时间
				var count = 100; //间隔函数，1秒执行
				var curCount;//当前剩余秒数
				var a = ",./,/.,/.,";
				var email = null;
				function sendMessage() {
					if(check1()){
						email = $("#youremail").val();
						console.log(email);
						curCount = count;
						//设置button效果，开始计时
						$("#btnSendCode").attr("disabled", "true");
						$("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
						InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
						//向后台发送处理数据
						$.post("${ctx}/regist/sendcode",{email:email},function(data){
							var res = $.parseJSON(data);
							$.each(res,function(index,value){
								a = res[0];
							});
						});
					}else{
						 alert("请先正确填写你的信息！");
					}
				}
				//timer处理函数
				function SetRemainTime() {
				    if (curCount == 0) {                
				        window.clearInterval(InterValObj);//停止计时器
				        $("#btnSendCode").removeAttr("disabled");//启用按钮
				        $("#btnSendCode").val("重新发送验证码");
				    }else {
				        curCount--;
				        $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
				    }
				}
				function registcode(){
					var code = $("#registcode").val();
					if(a==code){
						return true;	
					}else{
						return false;
					}
				}
			</script>
			<div>
				<input id="regist" type="submit" value="注 册" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#9D9D9D'" onclick="registcode()" class="registbutton">
			</div>
		</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>