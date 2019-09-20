<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采样点年趋势变化图</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="${APP_PATH}/css/bootstrap.css">
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="${APP_PATH}/css/style.css" rel='stylesheet' type='text/css' />
<link href="${APP_PATH}/css/mycss.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="${APP_PATH}/css/font.css" type="text/css" />
<link rel="stylesheet"
	href="${APP_PATH}/assets/font-awesome/css/font-awesome.min.css"
	type="text/css">
<!-- //font-awesome icons -->
<script src="${APP_PATH}/js/jquery.min.js"></script>
<script src="${APP_PATH}/js/modernizr.js"></script>
<script src="${APP_PATH}/js/jquery.cookie.js"></script>
<script src="${APP_PATH}/js/screenfull.js"></script>
<script src="${APP_PATH}/js/initData.js"></script>
<script src="${APP_PATH}/js/dataShow.js"></script>
<script src="${APP_PATH}/js/dataShowaddtrend.js"></script>
<script>
	$(function() {
		$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);
		if (!screenfull.enabled) {
			return false;
		}
		$('#toggle').click(function() {
			screenfull.toggle($('#container')[0]);
		});
	});
</script>
<script src="${APP_PATH}/assets/js/echarts.min.js"></script>
<script src="${APP_PATH}/js/bootstrap.js"></script>
<!-- tables -->
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/css/table-style.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/css/basictable.css" />
<script type="text/javascript"
	src="${APP_PATH}/js/jquery.basictable.min.js"></script>
<!-- //tables -->
</head>
<body class="dashboard-page">
	<jsp:include page="left.jsp" />
	<section class="wrapper scrollable">
	<jsp:include page="header.jsp" />
	<div class="main-grid" style="height: 1000px;">
		<div class="agile-grids">
			<div class="subtitle" style="margin-top: 10px;">
				<h2
					style="font-size: 150%; color: #00BCD4; margin: auto; text-align: center">
					<b>天津市各行政区县采样点年趋势变化图</b>
				</h2>
			</div>
			<div class="kindchoose" style="margin-left: 300px">
				<form id="kindofanal" onsubmit="return false;"
					style="margin-top: 10px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看方式： <select id="ways">
						<option value="count_all">总采样点</option>
						<option value="count_overproof">超标点数量</option>
						<option value="count_nooverproof">未超标点数量</option>
						<option value="probabilit_overproof">超标率</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元素选择： <select
						id="initelem" name="eleName" disabled="disabled"></select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区选择： <select
						id="initregionall" name="regionName" disabled="disabled"></select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="allclick2" type="submit" value="筛选数据"
						style="width: 160px; height: 30px; margin-left: -30px;">
				</form>
			</div>
		</div>
		<div class="main-body">
			<div id="main-top" class="main-top" style="width: 100%;">
				<h2 id="trhtitle"
					style="font-size: 150%; text-align: center; margin-top: 10px; margin-bottom: -20px">
				</h2>
			</div>
			<div id="main-left" class="main-left" style="width: 100%;">
				<div class="agile-grids">
					<div class="agile-tables">
						<div class="w3l-table-info">
							<table id="table">
								<thead id="trtableHead">
								</thead>
								<tbody id="trtableBody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="map_anal"
			style="width: 1000px; height: 500px; margin: auto; display: none;"></div>
	</div>
	</section>
</body>
</html>