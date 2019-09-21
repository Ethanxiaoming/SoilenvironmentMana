<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>土壤重金属数据分析</title>
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
<script src="${APP_PATH}/js/dataShowadd.js"></script>

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
<link rel="stylesheet" type="text/css" href="${APP_PATH}/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/css/basictable.css" />
<script type="text/javascript" src="${APP_PATH}/js/jquery.basictable.min.js"></script>
<!-- //tables -->
<style type="text/css">
table th
        {
            text-transform: none;
        }
</style>
</head>
<body class="dashboard-page">
	<jsp:include page="left.jsp" />
	<section class="wrapper scrollable"> 
	<jsp:include page="header.jsp" />
	<div class="main-grid">
		<div class="agile-grids">
			<div class="data-title" >
				<h2 style="font-size: 150%; color: #00BCD4">
					<b>天津市各行政区县采样点分析</b>
				</h2>
			</div>
			<div class="choose">
				<form id="numOfSamplePoints" onsubmit="return false;">
					<!-- <form  action="/SoilenvironmentMana//sectionelem/infoOfRegion"> -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年份： <select id="inityear"
						name="eleName">
					</select> <input id="allclick" type="submit" value="筛选数据"
						style="width: 160px; height: 30px; margin-left: 50px;">
				</form>
			</div>
			<div class="agile-tables">
				<div class="w3l-table-info">
					<table id="table">
						<thead id="tableHead">
							<tr>
								<th>区县</th>
								<th>东丽</th>
								<th>津南</th>
								<th>北辰</th>
								<th>西青</th>
								<th>汉沽</th>
								<th>塘沽</th>
								<th>大港</th>
								<th>宝坻</th>
								<th>宁河</th>
								<th>蓟州</th>
								<th>静海</th>
								<th>武清</th>
								<th>天津市</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<td>采样点数</td>
						</tbody>
					</table>
				</div>
			</div>
			<div class="subtitle" style="margin-top: 10px;">
				<!-- <h2 style="font-size: 150%; color: #00BCD4;margin:auto;text-align: center">
					<b>采样点分析</b>
				</h2> -->
			</div>
			<div class="kindchoose" style="margin-top: 10px;">
				<form id="kindofanal" onsubmit="return false;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看种类：
						<select id ="detailKind">
								<option value="overproof">超标情况分析</option>
								<option value="securelevel">安全等级分析</option>
								<option value="pollutionlevel">污染情况分析</option>
								<option value="accumulatlevel">累积情况分析</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看方式：
						<select id="ways">
								<option value="op_pointall">点位超标情况分析(总)</option>
								<option value="op_pointregion">点位超标情况分析(区域)</option>
								<option value="op_mean">平均超标情况分析</option>
								<option value="op_count">超标点位数量统计</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年份： 
						<select id="inityear2"	name="eleName"></select> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元素选择：
						<select id ="initelem" name="eleName"></select>
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区选择： -->
						<select id ="initregion" name="regionName" disabled="disabled" style="visibility: hidden"></select>
						<input id="allclick2" type="submit" value="筛选数据"
						style="width: 160px; height: 30px; margin-left: -30px;">
				</form>
			</div>
		</div>
		<div class="main-body" >
				<div id="main-top" class="main-top" style=" width: 100%;">
							<h2 id="htitle" style="font-size: 150%;text-align: center;margin-top:10px  ;margin-bottom: -20px">
							</h2>
				</div>
				<div id="main-left" class="main-left" style=" width: 100%;">
					<div class="agile-grids">
						<div class="agile-tables">
							<div class="w3l-table-info">
							    <table id="table">
								<thead id="tableHead2" >
								</thead>
								<tbody id="tableBody2"> 
								</tbody>
							  </table>
							</div>
						</div>
					</div>				
				</div>
				<div id="map_anal" style="width: 50%; height: 600px;display:none;float: left"></div>
		</div>
		<div id="map_anal2" style="width: 600px; height: 600px;margin:auto;display:none;"></div>
		<div id="map_anal3" style="width: 1000px; height: 500px;margin:auto;display:none;"></div>
	</div>
	</section>
</body>
</html>