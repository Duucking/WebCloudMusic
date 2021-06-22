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
<link href="CSS/swiper.min.css" rel="stylesheet">

<title>云音乐</title>
</head>
<body
	style="background-color: #778899; background-image: linear-gradient(#e66465, #9198e5); height: 100%">

	<!-- 头部 -->
	<!-- 判断用户是否处于登陆状态 -->
	<c:if test="${!empty UID}">
		<%@include file="WEB-INF/jspf/header-login.jspf"%>
	</c:if>
	<c:if test="${empty UID}">
		<%@include file="WEB-INF/jspf/header-unlogin.jspf"%>
	</c:if>

	<!-- 身体 -->
	<div class="ax-swiper-outer" style="margin: 0 100px;">
		<div class="swiper-container" id="swiper01">
			<div class="swiper-wrapper">
				<div class="swiper-slide ax-align-origin">
					<img src="IMAGE/IndexSlide/Slide1.jpg"
						style="height: auto; width: 100%" />
				</div>
				<div class="swiper-slide ax-align-origin">
					<img src="IMAGE/IndexSlide/Slide2.jpg"
						style="height: auto; width: 100%" />
				</div>
				<div class="swiper-slide ax-align-origin">
					<img src="IMAGE/IndexSlide/Slide3.jpg"
						style="height: auto; width: 100%" />
				</div>
				<div class="swiper-slide ax-align-origin">
					<img src="IMAGE/IndexSlide/Slide4.jpg"
						style="height: auto; width: 100%" />
				</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>

		</div>
	</div>

	<div style="margin: 0 auto; width: 1000px;">

		<div style="float: left;">
			<div class="ax-filter"
				style="width: 800px; height: 50px; vertical-align: center; background-color: #FF9B00; padding-top: 10px;">
				<div class="ax-item ax-flex-row">
					<span class="ax-iconfont ax-icon-radio-fill"></span> <span
						style="font-size: 21px;">热门音乐</span>
					<div class="ax-flex-block">
						<div class="ax-text" style="padding-left: 20px">
							<a href="##">华语</a><a href="##">流行</a><a href="##">摇滚</a><a
								href="##">民谣</a><a href="##">电子</a> <span class="ax-hide-pc"></span>
						</div>
					</div>
					<a href="##"><em style="font-size: 15px">更多+</em><i
						class="ax-iconfont"></i></a>
				</div>
			</div>

			<div class="ax-padding"
				style="width: 800px; background-color: black;">
				<div class="ax-grid ax-space-xxl">
					<ul class="ax-grid-inner">

						<c:forEach var="music8" items="${musiclisttop8}">
							<li class="ax-grid-block" style="width: 200px;">
								<div class="ax-card-block"
									style="background-color: black; border: 0px;">
									<div style="text-align: center">
										<a id="${music8.getMID()}" href="###" onclick="play(this)"><img
											src="${music8.getCoverFile()}"
											style="width: 100px; height: 100px;"></a>
									</div>
									<div id="${music8.getMID()}-name" style="display: none;">${music8.getName()}</div>
									<div id="${music8.getMID()}-artist" style="display: none;">${music8.getArtist()}</div>
									<div id="${music8.getMID()}-file" style="display: none;">${music8.getFileSource()}</div>
									<div id="${music8.getMID()}-cover" style="display: none;">${music8.getCoverFile()}</div>
									<div style="text-align: center">
										<a id="${music8.getMID()}" href="###" onclick="play(this)"
											style="font-size: 15px; color: #FF9B00">${music8.getName()}</a>
									</div>
								</div>
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>

		<div style="float: left; width: 200px; background-color: black">
			<button class="ax-btn"
				style="margin: 85px 40px 85px 40px; text-align: center; background-color: #ff9b00; width: auto;">Donate
				Me</button>
			<img alt="Dogecoin" src="IMAGE/dogecoin.png"
				style="width: 200px; height: auto; margin-bottom: 10px;">

		</div>
	</div>

	<div style="margin: 0 auto; width: 1000px;">

		<div style="float: left;">
			<div class="ax-filter"
				style="width: 1000px; height: 50px; vertical-align: center; background-color: #FF9B00; padding-top: 10px;">
				<div class="ax-item ax-flex-row">
					<span class="ax-iconfont ax-icon-radio-fill"></span> <span
						style="font-size: 21px;">新曲上架</span>
					<div class="ax-flex-block"></div>
					<a href="##"><em style="font-size: 15px">更多+</em><i
						class="ax-iconfont"></i></a>
				</div>
			</div>

			<div class="ax-padding"
				style="width: 1000px; background-color: black;">
				<div class="ax-grid ax-space-xxl">
					<ul class="ax-grid-inner">

						<c:forEach var="music10" items="${musiclistnew10}">
							<li class="ax-grid-block" style="width: 200px;">
								<div class="ax-card-block"
									style="background-color: black; border: 0px;">
									<div style="text-align: center">
										<a id="${music10.getMID()}" href="##" onclick="play(this)"><img
											src="${music10.getCoverFile()}"
											style="width: 100px; height: 100px;"></a>
									</div>
									<div id="${music10.getMID()}-name" style="display: none;">${music10.getName()}</div>
									<div id="${music10.getMID()}-artist" style="display: none;">${music10.getArtist()}</div>
									<div id="${music10.getMID()}-file" style="display: none;">${music10.getFileSource()}</div>
									<div id="${music10.getMID()}-cover" style="display: none;">${music10.getCoverFile()}</div>
									<div style="text-align: center">
										<a id="${music10.getMID()}" href="##" onclick="play(this)"
											style="font-size: 15px; color: #FF9B00">${music10.getName()}</a>
									</div>
								</div>
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部音乐播放器 -->
	<div id="player-bottom" class="ax-aplayer"
		style="bottom: -1000px; width: 100%;"></div>

	<!-- 右侧悬浮按钮 -->
	<%@include file="WEB-INF/jspf/backtop.jspf"%>

	<!-- 登录弹窗 -->
	<%@include file="WEB-INF/jspf/loginform.jspf"%>


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
	<script type="text/javascript" src="JS/swiper.min.js"></script>
	<script src="JS/APlayer/APlayer.min.js"></script>
	<script src="JS/sweetalert2.min.js" type="text/javascript"></script>

	<script type="text/javascript">
		//单曲播放
		function singleplay(mname, martist, mfile, mcover) {
			const bottom = new APlayer({
				element : document.getElementById('player-bottom'),
				bottom : true,
				fixed : false,
				listFolded : true,
				lrcType : 1,
				audio : {
					name : mname,
					artist : martist,
					url : mfile,
					cover : mcover,
					lrc : '[00:00.00]thisis\n[00:04.01]test\n[00:08.02]lrcfile'

				}
			});
			$("#player-bottom").css("bottom", "0");
			bottom.play();
		}

		//列表播放
		function listplay(musiclist) {
			const bottom = new APlayer({
				element : document.getElementById('player-bottom'),
				bottom : true,
				fixed : false,
				listFolded : true,
				lrcType : 0,
				audio : musiclist
			});
			$("#player-bottom").css("bottom", "0");
			bottom.play();
		}
	</script>
	<script type="text/javascript">
		$("#login").click(function() {
			$("#loginform").addClass("ax-window-show");
		});
	</script>

	<script type='text/javascript'>
		$(document)
				.ready(
						function() {
							//js内容

							var swiper01 = new Swiper('#swiper01', {
								pagination : {
									el : '.swiper-pagination',
									clickable : true,
								},
								navigation : {
									nextEl : '.swiper-button-next',
									prevEl : '.swiper-button-prev',
								},
							});

							$('#selfpop')
									.axPopup(
											{
												content : '<a href="##" class="ax-info-block"><div class="ax-row"><div class="ax-col">马来西亚</div></div></a><div class="ax-break-line"></div><a href="##" class="ax-info-block"><div class="ax-row"><div class="ax-col">美国</div></div></a><div class="ax-break-line"></div><a href="##" class="ax-info-block"><div class="ax-row"><div class="ax-col">新西兰</div></div></a><div class="ax-break-line"></div><a href="##" class="ax-info-block"><div class="ax-row"><div class="ax-col">中国</div></div></a>',
												placement : 'bottom',
												padding : false,
											});
						});

		function play(e) {
			var id = $(e).attr("id");
			var name = document.getElementById(id + "-name").innerText;
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
	</script>


</body>
</html>