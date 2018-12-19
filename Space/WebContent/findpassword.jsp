<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%> 
<base href="<%=basePath%>">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/findpassword.css">
<script src="js/jquery.min.js"></script>
</head>
<body>
	<div class="main">
		<p class="pswdtitle">找 回 密 码 ：<p>
		<form class="pswdform" onsubmit="return false">
			<p>请输入你的邮箱：</p><input type="text" class="youremail" id="youremail" onblur="checkemail()"/><div id="tip1" style="display: inline;"></div><br>
			 <script type="text/javascript">
				 $(function () {
					$("#btnSendCode").val("请先输入你的邮箱");
					$("#btnSendCode").attr("disabled", "true");
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
						$("#btnSendCode").val("请先输入你的邮箱");
						$("#btnSendCode").attr("disabled", "true");
						$("#tip1").html("邮箱不能为空！");
						check = false;
					}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
						$("#btnSendCode").val("请先输入你的邮箱");
						$("#btnSendCode").attr("disabled", "true");
						$("#tip1").html("邮箱格式不正确！");
						check = false;
					}else{
						document.getElementById("tip1").innerText="邮箱格式正确！";
						$("#btnSendCode").val("发送验证码");
				        $("#btnSendCode").removeAttr("disabled");//启用按钮
						check = true;
					}
					return check;
				}
			  </script>
			<p>点击发送验证码：</p><input type="submit" class="sendcode" value="发送验证码" id="btnSendCode" onclick="sendMessage()"/><br>
			<script type="text/javascript">
				var InterValObj; //timer变量，控制时间
				var count = 100; //间隔函数，1秒执行
				var curCount;//当前剩余秒数
				var a = ",./,/.,/.,";
				var email = null;
				function sendMessage() {
					email = $("#youremail").val();
					console.log(email);
					curCount = count;
					//设置button效果，开始计时
					$("#btnSendCode").attr("disabled", "true");
					$("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
					InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
					//向后台发送处理数据
					$.post("${ctx}/findpswd/sendcode",{email:email},function(data){
						var res = $.parseJSON(data);
						$.each(res,function(index,value){
							a = res[0];
							b = res[1];
						});
					});
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
				function code(){
					var code = $("#entrycode").val();
					if(code==""){
						alert("请输入验证码！")
						return false;
					}
					if(a==code){
						alert("你的密码是："+b);
						return true;	
					}else{
						alert("验证码错误！");
						return false;
					}
				}
			</script>
			<p>输入你的验证码：</p><input type="text" class="entrycode" id="entrycode"/><br>
			<input type="button" value="点击查看密码" class="confirm" onclick="code()" />
		</form>
	</div>
</body>
</html>