<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="format-detection" content="email=no" />
<meta name="wap-font-scale" content="no" />
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta content="telephone=no" name="format-detection" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="http://at.alicdn.com/t/font_1551254_rxrrzgz2kjc.css"
	rel="stylesheet" type="text/css" />
<link href="CSS/ax.css" rel="stylesheet" type="text/css">
<link href="CSS/ax-response.css" rel="stylesheet" type="text/css">
<link href="CSS/css.css" rel="stylesheet" type="text/css">
<link href="CSS/sweetalert2.css" rel="stylesheet" type="text/css">
<title>云音乐</title>
</head>
<body>

	<!-- 头部 -->
	<div id="header" style="display: none;">头部标记</div>
	<%@include file="WEB-INF/jspf/header-unlogin.jspf"%>

	<!-- 身体 -->
	<div style="margin: 0px auto; width: 700px; min-height: 80%">
		<h1 style="text-align: center">用户注册</h1>
		<div class="ax-break-md"></div>
		<form id="register" name="register" onsubmit="return validateForm()"
			method="post" action="Register">
			<div class="ax-form-group">
				<div class="ax-flex-row" style="text-align: center;">
					<div class="ax-form-label">昵称：</div>
					<div class="ax-form-con">
						<div class="ax-form-input">
							<input id="username" name="username" placeholder="输入昵称"
								type="text" onblur="checkUsername(this.value)">
						</div>
					</div>
					<span id="nametip"
						class="ax-form-txt ax-color-primary ax-iconfont ax-icon-check-o-fill"
						style="visibility: hidden;"></span>
					<div id="usernames" style="display: none;">false</div>
				</div>
			</div>

			<div class="ax-break-md"></div>

			<div class="ax-form-group">
				<div class="ax-flex-row">
					<div class="ax-form-label">密码：</div>
					<div class="ax-form-con">
						<div class="ax-form-input">
							<input id="password" name="password" placeholder="输入密码"
								type="password" onblur="checkPassword(this.value)">
						</div>
					</div>
					<span id="passwordtip"
						class="ax-form-txt ax-color-primary ax-iconfont ax-icon-check-o-fill"
						style="visibility: hidden;"></span>
					<div id="passwords" style="display: none;">false</div>
				</div>
			</div>
			<div class="ax-break-md"></div>
			<div class="ax-form-group">
				<div class="ax-flex-row">
					<div class="ax-form-label">手机号：</div>
					<div class="ax-form-con">
						<div class="ax-form-input">
							<input id="phone" name="phone" placeholder="输入手机号" type="text"
								onblur="checkPhone(this.value)">
						</div>
					</div>
					<span id="phonetip"
						class="ax-form-txt ax-color-primary ax-iconfont ax-icon-check-o-fill"
						style="visibility: hidden;"></span>
					<div id="phones" style="display: none;">false</div>
				</div>
			</div>

			<div class="ax-break-md"></div>

			<div class="ax-form-group">
				<div class="ax-flex-row">
					<div class="ax-form-label">手机验证码：</div>
					<div class="ax-form-con">
						<div class="ax-form-input">
							<input name="phonekey" placeholder="输入验证码" value="" type="text"
								disabled="disabled" readonly="readonly">
						</div>
					</div>
					<button onclick="###" class="ax-form-btn ax-btn ax-ignore"
						disabled="disabled">获取验证码</button>
				</div>
			</div>

			<div class="ax-break-md"></div>

			<div class="ax-form-group">
				<div class="ax-flex-row">
					<div class="ax-form-label"></div>
					<div class="ax-flex-block">
						<div class="ax-form-input">
							<button type="submit" class="ax-btn ax-primary ax-full">注册</button>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>


	<!-- 右侧悬浮按钮 -->
	<%@include file="WEB-INF/jspf/backtop.jspf"%>

	<!-- 底部版权信息及ICP备案号 -->
	<%@include file="WEB-INF/jspf/footer.jspf"%>


	<!-- 接收Servlet的消息并弹窗(存在的话) -->
	<c:if test="${!empty Msg}">
		<%@include file="WEB-INF/jspf/dialog.jspf"%>
	</c:if>

	<!-- JS引用及JS函数 -->
	<script src="JS/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="JS/ax.min.js" type="text/javascript"></script>
	<script src="JS/svgSprites.js" type="text/javascript"></script>
	<script src="JS/sweetalert2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function checkUsername(name) {
		if(name==null||name==""){
			$("#nametip").removeClass("ax-color-primary");
			$("#nametip").removeClass("ax-icon-check-o-fill");
			$("#nametip").addClass("ax-color-danger");
			$("#nametip").addClass("ax-icon-close-o-fill");
			$("#nametip").css("visibility","visible");
			$("#nametip").html("用户名不能为空！");
			$("#usernames").html("false");
			return false;
		}
		else {
			$.ajax({
				url:"checkUsername",
				type:"POST",
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'username':name,
				},
				success:function(data){
					var isExist=data.isExist;
					if(isExist){
						$("#nametip").removeClass("ax-color-primary");
						$("#nametip").removeClass("ax-icon-check-o-fill");
						$("#nametip").addClass("ax-color-danger");
						$("#nametip").addClass("ax-icon-close-o-fill");
						$("#nametip").css("visibility","visible");
						$("#nametip").html("此用户名已被注册！");
						$("#usernames").html("false");
						return false;
					}
					else {
						$("#nametip").removeClass("ax-color-danger");
						$("#nametip").removeClass("ax-icon-close-o-fill");
						$("#nametip").addClass("ax-color-primary");
						$("#nametip").addClass("ax-icon-check-o-fill");
						$("#nametip").css("visibility","visible");
						$("#nametip").html("");
						$("#usernames").html("true");
						return true;
					}
					}
				});
		}
		
		}
	</script>
	<script type="text/javascript">
	
	function checkPassword(pass) {
		if(pass==null||pass==""){
			$("#passwordtip").removeClass("ax-color-primary");
			$("#passwordtip").removeClass("ax-icon-check-o-fill");
			$("#passwordtip").addClass("ax-color-danger");
			$("#passwordtip").addClass("ax-icon-close-o-fill");
			$("#passwordtip").css("visibility","visible");
			$("#passwordtip").html("密码不能为空！");
			$("#passwords").html("false");
			return false;
		}
		else if (pass.length<6) {
			$("#passwordtip").removeClass("ax-color-primary");
			$("#passwordtip").removeClass("ax-icon-check-o-fill");
			$("#passwordtip").addClass("ax-color-danger");
			$("#passwordtip").addClass("ax-icon-close-o-fill");
			$("#passwordtip").css("visibility","visible");
			$("#passwordtip").html("密码不能少于6位！");
			$("#passwords").html("false");
			return false;
		}
		else {
			$("#passwordtip").removeClass("ax-color-danger");
			$("#passwordtip").removeClass("ax-icon-close-o-fill");
			$("#passwordtip").addClass("ax-color-primary");
			$("#passwordtip").addClass("ax-icon-check-o-fill");
			$("#passwordtip").css("visibility","visible");
			$("#passwordtip").html("");
			$("#passwords").html("true");
			return true;
		}
		
	}
	function checkPhone(phone) {
		if(phone==null||phone==""){
			$("#phonetip").removeClass("ax-color-primary");
			$("#phonetip").removeClass("ax-icon-check-o-fill");
			$("#phonetip").addClass("ax-color-danger");
			$("#phonetip").addClass("ax-icon-close-o-fill");
			$("#phonetip").css("visibility","visible");
			$("#phonetip").html("手机号不能为空！");
			$("#phones").html("false");
			return false;
		}
		else if(!(/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/.test(phone))){ 
			$("#phonetip").removeClass("ax-color-primary");
			$("#phonetip").removeClass("ax-icon-check-o-fill");
			$("#phonetip").addClass("ax-color-danger");
			$("#phonetip").addClass("ax-icon-close-o-fill");
			$("#phonetip").css("visibility","visible");
			$("#phonetip").html("手机号错误！");
			$("#phones").html("false");
			return false;
	    } 
		else {
			$("#phonetip").removeClass("ax-color-danger");
			$("#phonetip").removeClass("ax-icon-close-o-fill");
			$("#phonetip").addClass("ax-color-primary");
			$("#phonetip").addClass("ax-icon-check-o-fill");
			$("#phonetip").css("visibility","visible");
			$("#phonetip").html("");
			$("#phones").html("true");
			return true;
		}
	}
	function validateForm() {
		var username=$('#username').val();
		var password=$('#password').val();
		var phone=$('#phone').val();
		var result0=$("#usernames").text();
		var result1=$("#passwords").text();
		var result2=$("#phones").text();
		if(result0=="true"&&result1=="true"&&result2=="true"){
			
			return true;
		}
		else {
			checkUsername(username);
			checkPassword(password);
			checkPhone(phone);
			return false;
		}
	}
	
	</script>


</body>
</html>