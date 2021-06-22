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
	<div
		style="margin: 0px auto; width: 1000px; min-height: 90%; background-color: white;">
		<!-- 搜索框 -->
		<div class="ax-break-md ax-hide-tel"></div>
		<div style="margin: 0 auto; width: 400px;">
			<form name="searchfriends" method="post" action="Friends">
				<div class="ax-form-group">
					<div class="ax-flex-row">
						<div class="ax-form-con">
							<div class="ax-form-input">
								<c:if test="${empty searchtext}">
									<input name="searchtext" placeholder="好友名字" value=""
										type="text">
								</c:if>
								<c:if test="${!empty searchtext}">
									<input name="searchtext" placeholder="好友名字"
										value="${searchtext}" type="text">
								</c:if>
							</div>
						</div>
						<button type="submit" class="ax-form-btn ax-btn ax-primary">搜索</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 搜索朋友列表 -->
		<c:if test="${!empty SFriendsList}">
			<div class="ax-padding" style="width: 1000px;">
				<h2>搜索好友：</h2>
				<div class="ax-break-line"></div>
				<div class="ax-grid ax-space-xxl">
					<ul class="ax-grid-inner">

						<c:forEach var="user" items="${SFriendsList}">
							<li class="ax-grid-block" style="width: 200px;">
								<div class="ax-card-block" style="border: 0px;">
									<c:if test="${!empty user.getImage()}">
										<div style="text-align: center">
											<a href="##" class="ax-avatar ax-xxl ax-round"
												style="background-image: url(${user.getImage()})"></a>
										</div>
									</c:if>
									<c:if test="${empty user.getImage()}">
										<div style="text-align: center">
											<a href="##" class="ax-avatar ax-xxl ax-round"
												style="background-image: url(IMAGE/default-head.jpg)"></a>
										</div>
									</c:if>
									<div style="text-align: center">
										<a id="${user.getUID()}" href="###" style="font-size: 15px;">${user.getName()}</a>
										<a onclick="addFriend(${user.getUID()})"><span
											class="ax-iconfont ax-icon-plus-o-fill"></span></a>
									</div>
								</div>
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
		</c:if>



		<!-- 推荐朋友 -->
		<div class="ax-padding" style="width: 1000px;">
			<h2>推荐好友：</h2>
			<div class="ax-break-line"></div>
			<div class="ax-grid ax-space-xxl">
				<ul class="ax-grid-inner">

					<c:forEach var="user" items="${TFriendsList}">
						<li class="ax-grid-block" style="width: 200px;">
							<div class="ax-card-block" style="border: 0px;">
								<c:if test="${!empty user.getImage()}">
									<div style="text-align: center">
										<a href="##" class="ax-avatar ax-xxl ax-round"
											style="background-image: url(${user.getImage()})"></a>
									</div>
								</c:if>
								<c:if test="${empty user.getImage()}">
									<div style="text-align: center">
										<a href="##" class="ax-avatar ax-xxl ax-round"
											style="background-image: url(IMAGE/default-head.jpg)"></a>
									</div>
								</c:if>
								<div style="text-align: center">
									<a id="${user.getUID()}" href="###" style="font-size: 15px;">${user.getName()}</a>
									<a onclick="addFriend(${user.getUID()})"><span
										class="ax-iconfont ax-icon-plus-o-fill"></span></a>
								</div>
							</div>
						</li>
					</c:forEach>

				</ul>
			</div>
		</div>
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
	function addFriend(e) {
		$.ajax({
			url:"addUserFriends",
			type:"POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			data:{
				'FriendUID':e,
			},
			success:function(data){
				var isSuccess=data.success;
				if(isSuccess){
					location.reload();
				}
				else {
					alert("添加朋友失败！你可能已经添加过该好友了！");
				}
			}
			});
	}
	</script>
</body>
</html>