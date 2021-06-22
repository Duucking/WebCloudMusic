<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	<!-- 判断用户是否处于登陆状态 -->
	<c:if test="${!empty UID}">
		<%@include file="WEB-INF/jspf/header-login.jspf"%>
	</c:if>
	<c:if test="${empty UID}">
		<%@include file="WEB-INF/jspf/header-unlogin.jspf"%>
	</c:if>

	<!-- 身体 -->
	<!-- 搜索框 -->
	<div class="ax-break-md ax-hide-tel"></div>
	<div style="margin: 0 auto; width: 400px;">
		<form name="search" method="post" action="Search">
			<div class="ax-form-group">
				<div class="ax-flex-row">
					<div class="ax-form-con">
						<div class="ax-form-input">
							<c:if test="${empty searchtext}">
								<input name="searchtext" placeholder="音乐/专辑/艺人" value=""
									type="text">
							</c:if>
							<c:if test="${!empty searchtext}">
								<input name="searchtext" placeholder="音乐/专辑/艺人"
									value="${searchtext}" type="text">
							</c:if>
						</div>
					</div>
					<button type="submit" class="ax-form-btn ax-btn ax-primary">搜索</button>
				</div>
			</div>
		</form>
	</div>
	<div class="ax-break-md ax-hide-tel"></div>
	<!-- 音乐列表 -->
	<div style="margin: 0 auto; width: 800px; min-height: 70%">
		<c:if test="${empty musiclist}">
			<h1 style="text-align: center;">未找到相关音乐</h1>
		</c:if>
		<c:if test="${!empty musiclist}">
			<table class="ax-table ax-border">
				<thead>
					<tr>
						<th style="width: 380px"><div class="ax-align-left">歌曲名称</div></th>
						<th style="width: 120px;">艺术家/乐队</th>
						<th style="width: 350px;">专辑</th>
						<th style="width: 50px;">收藏</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="music" items="${musiclist}">
						<tr>
							<td><div class="ax-align-left">
									<a href="##" class="ax-ell" id="${music.getMID()}"
										onclick="play(this)"><span
										class="ax-iconfont ax-icon-play-o"></span> ${music.getName()}</a>
								</div></td>
							<td><a href="##" id="${music.getMID()}-artist">${music.getArtist()}${music.getBand()}</a></td>
							<td><a href="##">${music.getAlbum().getName()}</a></td>
							<td><a href="##" onclick="Collect(${music.getMID()})"><span
									class="ax-iconfont ax-icon-heart"></span></a></td>
							<td style="display: none;" id="${music.getMID()}-cover">${music.getCoverFile()}</td>
							<td style="display: none;" id="${music.getMID()}-file">${music.getFileSource()}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</c:if>

	</div>

	<!-- 右侧悬浮按钮 -->
	<%@include file="WEB-INF/jspf/backtop.jspf"%>

	<!-- 登录弹窗 -->
	<%@include file="WEB-INF/jspf/loginform.jspf"%>

	<!-- 底部音乐播放器 -->
	<div id="player-bottom" class="ax-aplayer"
		style="bottom: -1000px; width: 100%;"></div>

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
		$("#login").click(function() {
			$("#loginform").addClass("ax-window-show");
		});
	</script>
	<script type="text/javascript">
	function singleplay(mname, martist, mfile, mcover) {
		const bottom = new APlayer({
			element : document.getElementById('player-bottom'),
			bottom : true,
			fixed : false,
			listFolded : true,
			lrcType : 0,
			audio : [ {
				name : mname,
				artist : martist,
				url : mfile,
				cover : mcover,
				href : "##"
			} ]
		});
		$("#player-bottom").css("bottom", "0");
		bottom.play();
	}
	
	function play(e) {
		var id = $(e).attr("id");
		var name = document.getElementById(id).innerText;
		var file = document.getElementById(id + "-file").innerText;
		var cover = document.getElementById(id + "-cover").innerText;
		var artist = document.getElementById(id + "-artist").innerText;

		singleplay(name, artist, file, cover);
	}
	function checkUsername() {
		var username = $("#username").val();
		if (username == null || username == "") {
			$("#nametip").removeClass("ax-color-primary");
			$("#nametip").removeClass("ax-icon-check-o-fill");
			$("#nametip").addClass("ax-color-danger");
			$("#nametip").addClass("ax-icon-close-o-fill");
			$("#nametip").css("display", "inline");
			$("#nametip").html("用户名不能为空！");
			return false;
		} else {
			$("#nametip").removeClass("ax-color-danger");
			$("#nametip").removeClass("ax-icon-close-o-fill");
			$("#nametip").addClass("ax-color-primary");
			$("#nametip").addClass("ax-icon-check-o-fill");
			$("#nametip").css("display", "none");
			$("#nametip").html("");
			return true;
		}
	}
	function checkPassword() {
		var password = $("#password").val();
		if (password == null || password == "") {
			$("#passwordtip").removeClass("ax-color-primary");
			$("#passwordtip").removeClass("ax-icon-check-o-fill");
			$("#passwordtip").addClass("ax-color-danger");
			$("#passwordtip").addClass("ax-icon-close-o-fill");
			$("#passwordtip").css("display", "inline");
			$("#passwordtip").html("密码不能为空！");
			return false;
		} else {
			$("#passwordtip").removeClass("ax-color-danger");
			$("#passwordtip").removeClass("ax-icon-close-o-fill");
			$("#passwordtip").addClass("ax-color-primary");
			$("#passwordtip").addClass("ax-icon-check-o-fill");
			$("#passwordtip").css("display", "none");
			$("#passwordtip").html("");
			return true;
		}
	}
	function validateForm() {
		if (checkUsername() && checkPassword()) {
			return true;
		} else {
			return false;
		}
	}
	function Collect() {
		alert("收藏歌曲");
	}
	</script>



</body>
</html>