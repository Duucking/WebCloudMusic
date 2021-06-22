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
<body
	style="background-color: #778899; background-image: linear-gradient(#e66465, #9198e5); height: 100%">

	<!-- 头部 -->
	<%@include file="WEB-INF/jspf/header-login.jspf"%>

	<!-- 身体 -->
	<div class="ax-grid"
		style="margin: 0 auto; width: 1000px; min-height: 90%; background-color: white;">
		<ul class="ax-grid-inner">
			<li class="ax-grid-block ax-col-7">
				<div class="ax-accordion ax-border ax-radius">
					<div class="ax-item ax-show">
						<div class="ax-panel-header">
							<a href="##">个人页面</a>
						</div>
					</div>
					<div class="ax-break-line"></div>
					<div class="ax-item ax-show">
						<div class="ax-panel-header">
							<a href="My">修改信息</a>
						</div>
						<div class="ax-panel-header">
							<a onclick="changeview()">修改密码</a>
						</div>
					</div>
					<div class="ax-break-line"></div>
				</div>
			</li>

			<li class="ax-grid-block ax-col-17">
				<div class="ax-row">
					<form action="">
						<div class="ax-break-md"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-label">头像：</div>
								<c:if test="${!empty avator}">
									<a href="###" class="ax-form-head"
										style="background-image: url(${avator}), url(IMAGE/loading.gif);width:60px;height:60px;"></a>
								</c:if>
								<c:if test="${empty avator}">
									<a href="###" class="ax-form-head"
										style="background-image: url(IMAGE/default-head.jpg), url(IMAGE/loading.gif);"></a>
								</c:if>
							</div>
						</div>

						<div class="ax-break-md"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-label">选择文件：</div>
								<div class="ax-form-con">
									<div class="ax-form-input">
										<input type="file">
									</div>
								</div>
							</div>
						</div>


						<div class="ax-break-md"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-label">性别：</div>
								<div class="ax-form-con">
									<div class="ax-form-input">
										<div class="ax-row">
											<div class="ax-col ax-col-8">
												<label class="ax-radio"><input name="fix-cat"
													value="0" type="radio"><span>男</span></label>
											</div>
											<div class="ax-col ax-col-8">
												<label class="ax-radio"><input name="fix-cat"
													value="1" type="radio"><span>女</span></label>
											</div>
											<div class="ax-col ax-col-8">
												<label class="ax-radio"><input name="fix-cat"
													value="2" type="radio"><span>保密</span></label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="ax-break-md"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-label">兴趣：</div>
								<div class="ax-form-con">
									<div class="ax-form-input">
										<div class="ax-row">
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat"
													value="0" type="checkbox"><span>流行</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat"
													value="1" type="checkbox"><span>古典</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat"
													value="2" type="checkbox"><span>Pop</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="3" type="checkbox"><span>ACG</span></label>
											</div>
										</div>
										<div class="ax-row">
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="4" type="checkbox"><span>摇滚</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="5" type="checkbox"><span>Bass</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="6" type="checkbox"><span>重金属</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="7" type="checkbox"><span>抒情</span></label>
											</div>
											<div class="ax-col ax-col-6">
												<label class="ax-checkbox"><input name="fix-cat-x"
													value="8" type="checkbox"><span>粤语</span></label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="ax-break-md"></div>

					</form>
				</div>
				<div class="ax-row">
					<div class="ax-col">
						<button id="xiugaibtn" type="button"
							style="margin: 0 auto; width: 100px;"
							class="ax-btn ax-primary ax-full" onclick="activateForm()">修改</button>
					</div>
					<div class="ax-col">
						<button id="submitbtn" type="button"
							style="margin: 0 auto; width: 100px;"
							class="ax-btn ax-ignore ax-full" disabled="disabled"
							onclick="submit()">提交</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<!-- 密码修改框 -->
	<div class="ax-window" data-mask="true" id="updatePassform">
		<form id="updatePass" name="updatePass" action="">
			<div class="ax-window-overlay"></div>
			<div class="ax-window-contain">
				<a href="##" class="ax-window-close"><i
					class="ax-iconfont ax-icon-close"></i></a>
				<div class="ax-window-title">更改密码</div>
				<div class="ax-break-line"></div>
				<div class="ax-window-content">
					<div class="ax-border-tel ax-radius-tel ax-margin ax-response-tel ">

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-con">
									<div class="ax-form-input">
										<span class="ax-pos-left" style="width: 28px;"><svg
												class="ax-svg">
												<use xlink:href="#ax-icon-lock-fill"></use></svg></span> <input
											id="opassword" name="opassword" placeholder="原密码"
											type="password" onblur="checkUsername()"><span
											class="ax-pos-right"><a href="##"
											class="ax-iconfont ax-icon-close ax-val-none"></a></span>
									</div>
								</div>
							</div>
						</div>

						<div class="ax-break-md ax-hide-tel"></div>
						<div class="ax-break-line ax-hide-pad ax-hide-pc"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-con">
									<div class="ax-form-input">
										<span class="ax-pos-left" style="width: 28px;"><svg
												class="ax-svg">
												<use xlink:href="#ax-icon-lock-fill"></use></svg></span><input
											id="npassword" name="npassword" placeholder="新密码"
											type="password" onblur="checkPassword()"><span
											class="ax-pos-right"><a href="##"
											class="ax-iconfont ax-icon-close ax-val-none"></a></span>
									</div>
								</div>
							</div>
						</div>

						<div class="ax-break-md ax-hide-tel"></div>
						<div class="ax-break-line ax-hide-pad ax-hide-pc"></div>

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-con">
									<div class="ax-form-input">
										<span class="ax-pos-left" style="width: 28px;"><svg
												class="ax-svg">
												<use xlink:href="#ax-icon-lock-fill"></use></svg></span><input
											id="qpassword" name="qpassword" placeholder="确认新密码"
											type="password" onblur="checkPassword()"><span
											class="ax-pos-right"><a href="##"
											class="ax-iconfont ax-icon-close ax-val-none"></a></span> <span
											id="passwordtip"
											class="ax-form-txt ax-color-primary ax-iconfont ax-icon-check-o-fill"
											style="display: none;"></span>
									</div>
								</div>
							</div>
						</div>


						<div class="ax-break-md ax-hide-tel"></div>
						<div class="ax-break-line ax-hide-pad ax-hide-pc"></div>


						<div class="ax-break-line"></div>
						<div class="ax-padding ax-window-operate">
							<div class="ax-row">
								<div class="ax-col">
									<div class="ax-col">
										<div class="ax-explain" style="color: gray;">
											<a href="##">联系管理员</a>
										</div>
									</div>
								</div>
								<div class="ax-col">
									<div class="ax-btns">
										<a href="##" class="ax-btn ax-text ax-ignore ax-window-close">取消</a>
										<a href="##" class="ax-btn ax-primary" onclick="passsubmit()">提交</a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<!-- 底部音乐播放器 -->
	<div id="player-bottom" class="ax-aplayer"
		style="bottom: -1000px; width: 100%;"></div>

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
	<script src="JS/APlayer/APlayer.min.js"></script>
	<script src="JS/sweetalert2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function activateForm() {
		$('#xiugaibtn').attr('disabled','disabled');
		$('#xiugaibtn').removeClass('ax-primary');
		$('#xiugaibtn').addClass('ax-ignore');
		$('#submitbtn').removeAttr('disabled');
		$('#submitbtn').removeClass('ax-ignore');
		$('#submitbtn').addClass('ax-primary');
	}

	function toast() {
	            Swal.fire({
	                toast: true,
	                position: 'center',
	                icon: 'success',
	                title: '正在提交！',
	                showCloseButton:false,
	                text: '正在提交数据，请勿关闭窗口！',
	                timer: 3000,
	                timerProgressBar: true,
	                onOpen: (toast) => {
	                toast.addEventListener('mouseenter', Swal.stopTimer)
	            toast.addEventListener('mouseleave', Swal.resumeTimer)
	        }
	        });
	}
	function submit() {
		
		toast()
	}
	function passsubmit() {
		var opassword=$('#opassword').val();
		var npassword=$('#npassword').val();
		var qpassword=$('#qpassword').val();
		if (opassword==""||opassword==""||npassword==""||npassword==""||qpassword==""||qpassword=="") {
			alert("密码不能为空！");
			return false;
		}
		else if (npassword!=qpassword) {
			alert("确认密码与新密码不相同！");
			return false;
		}
		$.ajax({
			url:"updatePass",
			type:"POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			data:{
				'opassword':opassword,
				'npassword':npassword,
			},
			success:function(data){
				var isSuccess=data.success;
				if(isSuccess){
					alert("修改密码成功！点击重新登录...");
					location.replace("Logout");
				}
				else {
					alert("修改密码失败，原密码错误！");
				}
			}
			});
	}
	function changeview() {
		$("#updatePassform").addClass("ax-window-show");
		
	}
	</script>


</body>
</html>