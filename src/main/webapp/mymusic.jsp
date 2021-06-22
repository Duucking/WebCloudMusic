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
		style="margin: 0 auto; width: 1000px; min-height: 80%; background-color: white;">
		<ul class="ax-grid-inner">
			<li class="ax-grid-block ax-col-7">
				<div class="ax-accordion ax-border ax-radius">
					<div class="ax-item ax-show">
						<div class="ax-panel-header">
							<a href="Mymusic">每日推荐</a>
						</div>
					</div>
					<div class="ax-break-line"></div>
					<div class="ax-item ax-show">
						<div class="ax-panel-header">创建的歌单</div>
						<div class="ax-panel-body">
							<div class="ax-break-line"></div>
							<c:forEach var="SongSheet" items="${userSongSheets}">
								<a href="##" class="ax-info-block"
									onclick="displaySheet(${SongSheet.getUSSID()})"> <span
									class="ax-head"
									style="background-image: url(IMAGE/default-head.jpg), url(IMAGE/loading.svg);"></span>
									<span class="ax-ell" id="${SongSheet.getUSSID()}-sheetname">${SongSheet.getName()}</span>
									<span class="ax-badge ax-info">${SongSheet.getCount()}首</span>
									<span id="${SongSheet.getUSSID()}-createdate"
									style="display: none;">${SongSheet.getCreateDate()}</span>
								</a>
							</c:forEach>
							<a id="addsheet" href="##" class="ax-info-block"
								onclick="displayAddForm()"> <span
								class="ax-iconfont ax-icon-plus-o-fill"></span> <span
								class="ax-ell"> 添加歌单</span>
							</a>


						</div>
					</div>
					<div class="ax-break-line"></div>
					<div class="ax-item ax-show">
						<div class="ax-panel-header">收藏的歌单</div>
						<div class="ax-panel-body">
							<div class="ax-break-line"></div>
							<c:if test="${!empty userCollections}">
								<c:forEach var="Collection" items="${userCollections}">
									<a href="##" class="ax-info-block"
										onclick="displayCollect(${Collection.getUSSID()})"> <span
										class="ax-head"
										style="background-image: url(IMAGE/default-head.jpg), url(IMAGE/loading.svg);"></span>
										<span class="ax-ell" id="${Collection.getUSSID()}-sheetname">${Collection.getName()}</span>
										<span class="ax-badge ax-info">${Collection.getCount()}首</span>
										<span class="ax-ell" id="${Collection.getUSSID()}-username"
										style="display: none;">${Collection.getUser().getName()}</span>
										<span class="ax-ell" id="${Collection.getUSSID()}-createdate"
										style="display: none;">${Collection.getUserSongSheet().getCreateDate()}</span>
									</a>
								</c:forEach>
							</c:if>
							<c:if test="${empty userCollections}">
								<a href="##" class="ax-info-block"> <span class="ax-ell">你还没有收藏任何歌单，快去收藏吧</span>
								</a>
							</c:if>


						</div>
					</div>
					<div class="ax-break-line"></div>
				</div>
			</li>
			<li class="ax-grid-block ax-col-17" style="min-height: 80%">
				<div class="ax-break-md"></div>
				<div class="ax-row" style="padding: 40px 40px 40px 40px;">
					<div class="ax-col">
						<img alt="歌单封面" src="IMAGE/Logo.png" height="200px" width="200px">
					</div>
					<div class="ax-col" style="width: 408px; padding-left: 20px;">
						<div class="ax-break-md"></div>
						<div class="ax-row">
							<h2 id="sheetname">每日推荐</h2>
						</div>
						<div class="ax-break-md"></div>
						<div class="ax-row" id="sheetuser">根据你的喜好生成</div>
						<div class="ax-break-md"></div>
						<div class="ax-row">
							<div class="ax-col">
								<a href="##" class="ax-btn ax-primary" onclick="list()">播放</a>
							</div>
							<div class="ax-col">
								<a href="##" class="ax-btn">分享</a>
							</div>
							<div class="ax-col">
								<a href="##" class="ax-btn">下载</a>
							</div>
						</div>
					</div>
				</div>
				<div class="ax-row" style="padding-left: 40px;">
					<h2>歌曲列表</h2>
				</div>
				<div class="ax-row"
					style="padding-left: 10px; padding-right: 10px; padding-bottom: 50px;">
					<!-- 音乐列表 -->
					<table class="ax-table">
						<thead>
							<tr>
								<th style="width: 300px"><div class="ax-align-left">歌曲名称</div></th>
								<th style="width: 170px;">艺术家/乐队</th>
								<th style="width: 188px;">专辑</th>
								<th style="width: 50px;">收藏</th>
							</tr>
						</thead>
						<tbody id="musicarea">
							<c:forEach var="music" items="${musiclist}">
								<tr>
									<td><div class="ax-align-left">
											<a href="##" class="ax-ell" id="${music.getMID()}"
												onclick="play(this)"><span
												class="ax-iconfont ax-icon-play-o"></span>
												${music.getName()}</a>
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
				</div>
				<div id="loading" class="ax-row"
					style="padding-left: 10px; padding-right: 10px; display: none; text-align: center;">
					<span class="ax-loading" style="width: 60px; height: 60px;"><i></i></span>
					<br> <span>正在加载</span>
				</div>
			</li>
		</ul>
	</div>

	<!-- 添加歌单弹窗 -->
	<div class="ax-window" data-mask="true" id="addsheetform">
		<form id="addsongsheet" name="addsongsheet">
			<div class="ax-window-overlay"></div>
			<div class="ax-window-contain">
				<a href="##" class="ax-window-close"><i
					class="ax-iconfont ax-icon-close"></i></a>
				<div class="ax-window-title">添加歌单</div>
				<div class="ax-break-line"></div>
				<div class="ax-window-content">
					<div class="ax-border-tel ax-radius-tel ax-margin ax-response-tel ">

						<div class="ax-form-group">
							<div class="ax-flex-row">
								<div class="ax-form-con">
									<div class="ax-form-input">
										<span class="ax-pos-left" style="width: 28px;"><svg
												class="ax-svg">
												<use xlink:href="#ax-icon-menu"></use></svg></span> <input id="SheetName"
											name="SheetName" placeholder="输入歌单名称名称" type="text"><span
											class="ax-pos-right"><a href="##"
											class="ax-iconfont ax-icon-close ax-val-none"></a></span> <span
											id="nametip"
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
								<div class="ax-btns">
									<a href="##" class="ax-btn ax-text ax-ignore ax-window-close">取消</a>
									<a href="##" class="ax-btn ax-primary" onclick="addSongSheet()">确认</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>


		<div id="loadinginform" class="ax-row"
			style="padding-left: 10px; padding-right: 10px; display: none; text-align: center;">
			<span class="ax-loading" style="width: 60px; height: 60px;"><i></i></span>
			<br> <span>正在加载</span>
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
		//单曲播放
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
		function play(e) {
			var id = $(e).attr("id");
			var name = document.getElementById(id).innerText;
			var file = document.getElementById(id + "-file").innerText;
			var cover = document.getElementById(id + "-cover").innerText;
			var artist = document.getElementById(id + "-artist").innerText;

			singleplay(name, artist, file, cover);
		}
		function list() {
			if($('#sheetname').text()=="每日推荐"){
				var arrlist = []
				<c:forEach items="${musiclist}" var="music">
				var arr = {};
				arr = {
					name : "${music.getName()}",
					artist : "${music.getArtist()}",
					url : "${music.getFileSource()}",
					cover : "${music.getCoverFile()}",
					href : "##"
				}
				arrlist.push(arr);
				</c:forEach>
				listplay(arrlist);
			}
			else{
				listplay(JSON.parse($.cookie('musiclist')));
			}
		}
		function addSongSheet() {
			var SheetName = $('#SheetName').val();
			if (SheetName == null || SheetName == "") {
				$("#nametip").removeClass("ax-color-primary");
				$("#nametip").removeClass("ax-icon-check-o-fill");
				$("#nametip").addClass("ax-color-danger");
				$("#nametip").addClass("ax-icon-close-o-fill");
				$("#nametip").css("display", "inline");
				$("#nametip").html("歌单名称不能为空！");
				return false;
			} else {
				$("#nametip").removeClass("ax-color-danger");
				$("#nametip").removeClass("ax-icon-close-o-fill");
				$("#nametip").addClass("ax-color-primary");
				$("#nametip").addClass("ax-icon-check-o-fill");
				$("#nametip").css("display", "none");
				$("#nametip").html("");
				$('#addsongsheet').css("display","none");
				$('#loadinginform').css("display","block");
				$.ajax({
					url:"addSongSheet",
					type:"POST",
					contentType:"application/x-www-form-urlencoded; charset=utf-8",
					data:{
						'SheetName':SheetName,
					},
					success:function(data){
						var isSuccess=data.success;
						if(isSuccess){
							$("#addsheetform").removeClass("ax-window-show");
							location.reload();
						}
					}
					});
			}
			
		}
		function displayAddForm() {
			$("#addsheetform").addClass("ax-window-show");
		}
		function displaySheet(e) {
			//
			document.getElementById("sheetname").innerText=document.getElementById(e+"-sheetname").innerText;
			document.getElementById("sheetuser").innerText="由我创建于"+document.getElementById(e+"-createdate").innerText;
			$('#musicarea').empty();
			$('#loading').css("display","block");
			
			$.ajax({
				url:"getSongSheetMusic",
				type:"POST",
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'USSID':e,
				},
				success:function(data){
					$('#loading').css("display","none");
					for(var m in data){
						$('#musicarea').append('<tr>'
								+'<td><div class="ax-align-left">'
								+'<a href="##" class="ax-ell" id="'+data[m].mid+'" '
								+'onclick="play(this)"><span '
								+'class="ax-iconfont ax-icon-play-o"></span>'
								+''+data[m].name+'</a>'
							+'</div></td>'
						+'<td><a href="##" id="'+data[m].mid+'-artist">'+data[m].artist+'</a></td>'
						+'<td><a href="##">'+data[m].album+'</a></td>'
						+'<td><a href="##" onclick="Collect('+data[m].mid+')"><span '
						+'		class="ax-iconfont ax-icon-heart"></span></a></td>'
						+'<td style="display: none;" id="'+data[m].mid+'-cover">'+data[m].cover+'</td>'
						+'<td style="display: none;" id="'+data[m].mid+'-file">'+data[m].url+'</td>'
					+'</tr>"');
					}
					$.cookie(e+'musiclist',JSON.stringify(data),{path:'/'});
					}
				});
		}
		function displayCollect(e) {
			document.getElementById("sheetname").innerText=document.getElementById(e+"-sheetname").innerText;
			document.getElementById("sheetuser").innerText="由"+document.getElementById(e+"-username").innerText+"创建于"+document.getElementById(e+"-createdate").innerText;
			$('#musicarea').empty();
			$('#loading').css("display","block");
			
			$.ajax({
				url:"getSongSheetMusic",
				type:"POST",
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'USSID':e,
				},
				success:function(data){
					$('#loading').css("display","none");
					for(var m in data){
						$('#musicarea').append('<tr>'
								+'<td><div class="ax-align-left">'
								+'<a href="##" class="ax-ell" id="'+data[m].mid+'" '
								+'onclick="play(this)"><span '
								+'class="ax-iconfont ax-icon-play-o"></span>'
								+''+data[m].name+'</a>'
							+'</div></td>'
						+'<td><a href="##" id="'+data[m].mid+'-artist">'+data[m].artist+'</a></td>'
						+'<td><a href="##">'+data[m].album+'</a></td>'
						+'<td><a href="##" onclick="Collect('+data[m].mid+')"><span '
						+'		class="ax-iconfont ax-icon-heart"></span></a></td>'
						+'<td style="display: none;" id="'+data[m].mid+'-cover">'+data[m].cover+'</td>'
						+'<td style="display: none;" id="'+data[m].mid+'-file">'+data[m].url+'</td>'
					+'</tr>"');
					}
					$.cookie(e+'musiclist',JSON.stringify(data),{path:'/'});
					}
				});
		}
		function Collect(e) {
			$.ajax({
				url:"addMusicToSheet",
				type:"POST",
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'MID':e,
					'Type':"addLike",
				},
				success:function(data){
					var isSuccess=data.success;
					if(isSuccess){
						location.reload();
					}
					else {
						alert("收藏歌曲失败，你或许已经收藏过该歌曲？");
					}
				}
				});
		}
	</script>
</body>
</html>