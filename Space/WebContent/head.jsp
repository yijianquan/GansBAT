<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="header-bottom-top">
		<div class="container">
			<div class="clearfix"></div>
			<div class="header-bottom">
				<div class="logo" style="margin-top: 2% ；">
					<a href="index.html"><img src="images/logo.jpg" alt=" " /></a>
				</div>
				<div class="top-nav">
					<ul>
						
						<li id="userlogin"><a href="#" data-toggle="modal" data-target="#myModal"><img
								src="images/login.jpg"></a></li>
						<li id="userwelcome" style="display:none;"><p style="font-size:1.1em;color:#fff;">尊敬的 ${username }，你好！</p></li>
							<!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content login">
										<div class="wrapper">
											<div class="cont">
												<h1>Welcome</h1>
												<form class="form" method="post">
													<input type="text" placeholder="Email Address（邮箱）" id="email" name="email">
													<input type="password" placeholder="Password （密码）" id="password" name="password">
													<button type="submit" id="login-button">Login（登陆）</button><br>
													<a href="#"><div class="login_foot_left">忘记密码</div></a>
													<a href="regist.html"><div class="login_foot_right">注册</div></a>
												</form>
												<script type="text/javascript">
												$(function(){
													 $("#login-button").click(function(){
													 	var email = $("#email").val();  
												        var password = $("#password").val();
														$.post("${ctx}/login/ajax",{email:email,password:password},function(data){
															var res = $.parseJSON(data);//把后台传回的json数据解析
															alert(res);
															console.log(res);
															if(res=="Login success!"){
																$("#userwelcome").css("display","inline-block");
																$("#userlogin").css("display","none");
															}
														});
													})
												})
												</script>
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
								</div>
							</div>
						<li class="smallicon"><a href="information.jsp"
							class="scroll"><img src="images/account.jpg"></a></li>
						<li class="smallicon"><a href="trends.jsp" class="scroll"><img
								src="images/trends.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!--
 	<script>
	function loginAction() {
	    // 获取用户输入的账号和密码
	    var email = $('#login_email').val();
	    var password = $('#login_password').val();
	    $.ajax({
	        url : 'login/loginin',
	        type : 'post',
	        // data对象中的属性名要和服务端控制器的参数名一致 login(name, password)
	        data : {
	            'email' : name,
	            'password' : password
	        },
	        dataType : 'json',
	        success : function(result) {
	            if (result.state == 0) {
	                // 登录成功，设置cookie并跳转edit.html
	                addCookie('userId', result.data.id);
	                addCookie('nick', result.data.nick);
	                location.href = 'edit.html';
	            } else {
	                // 登录失败
	                var msg = result.message;
	                $('#sig_in').next().html(msg);
	                $('#sig_in').next().css("color", "red");
	            }
	        },
	        error : function(e) {
	            alert("系统异常");
	        }
	    });
	    $('#password').val("");
	}
</script>
-->