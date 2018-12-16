<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
		$('#login-button').click(function(event) {
			event.preventDefault();
			$('form').fadeOut(500);
			$('.wrapper').addClass('form-success');
		});
</script>
<div class="header-bottom-top">
		<div class="container">
			<div class="clearfix"></div>
			<div class="header-bottom">
				<div class="logo" style="margin-top: 2% ；">
					<a href="${ctx }/home/tohome"><img src="images/logo.jpg" alt=" " /></a>
				</div>
				<div class="top-nav">
					<ul>
						<li class="userwelcome" id="userwelcome" style="display:none;"><p style="font-size:1.1em;color:#fff;display:inline;">尊敬的</p><p id="username" style="font-size:1.1em;color:#fff;display:inline;"></p><p style="font-size:1.1em;color:#fff;display:inline;">，你好！</p></li>
						<% String user=(String)session.getAttribute("nowuser");
						if(user!=null){%>
							<script type="text/javascript">
								window.onload = function() {
									$("#userwelcome").css("display","inline")
									$("#userlogin").css("display","none")
									$("#username").text("<%=user%>");
								};
							</script>
						<%}else{ %>
							<li id="userlogin"><a href="#" data-toggle="modal" data-target="#myModal"><img
								src="images/login.jpg"></a></li>
						<%}%>						
						<!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content login">
										<div class="wrapper">
											<div class="cont">
												<h1>Welcome</h1>
												<form class="form" method="post" onsubmit="return saveReport()">
													<input type="text" placeholder="Email Address（邮箱）" id="email" name="email">
													<input type="password" placeholder="Password （密码）" id="password" name="password">
													<button type="submit" id="login-button">Login（登陆）</button><br>
													<a href="#"><div class="login_foot_left">忘记密码</div></a>
													<a href="regist.html"><div class="login_foot_right">注册</div></a>
												</form>
												<script type="text/javascript">
												$(function(){
													 $("#login-button").click(function(event){
														var a=null;
														var b = null;
													 	var email = $("#email").val();  
												        var password = $("#password").val();
														$.post("${ctx}/login/ajax",{email:email,password:password},function(data){
															var res = $.parseJSON(data);//把后台传回的json数据解析
															alert(res);
															$.each(res,function(index,value){
															     a = res[0];
															     b = res[1];
															});
															if(a=="Login success!"){
																$("#userwelcome").show();
																$("#userlogin").hide();
																$("#username").text(b);
															}
														});
														event.preventDefault();
													});
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
						<li class="smallicon"><a href="${ctx}/usercenter/tocenter"
							class="scroll"><img src="images/account.jpg"></a></li>
						<li class="smallicon"><a href="${ctx}/trends/totrends" class="scroll"><img
								src="images/trends.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>