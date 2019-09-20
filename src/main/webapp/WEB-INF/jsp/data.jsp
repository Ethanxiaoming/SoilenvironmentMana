<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>重金属含量统计</title>
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

</head>
<body class="dashboard-page">
	<jsp:include page="left.jsp" />
	<section class="wrapper scrollable">
		<jsp:include page="header.jsp" />
		<div class="main-grid">
			<div class="main-top">
				<div class="data-title" style="margin-left: 5px;width: 1200px" >
						<h2 style="font-size: 150%;color: #00BCD4">
							<b>天津市农产品产地土地重金属含量统计</b>
						</h2>
						<div class="choose">
							<form id="formyear"  onsubmit="return false;">
								年份选择：
								<select id ="inityear" name="yearName"></select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元素选择：
								<select id ="initelem" name="eleName"></select>
								<input type="submit" id="btn-submit" value="筛选数据" style="width:160px;height:30px; margin-left: 50px;">	
							</form>
						</div>
				</div>
			</div>
			<div class="main-body">
				<div class="main-left" style="width: 35%">
						<div id="map" style=" height: 600px;"></div>				
				</div>
				<div class="main-right" style="width: 65%">
					<div id="map2" style="height: 600px; "></div>
				</div>
			</div>
			<div class="agile-grids">
					<div class="agile-tables">
						<div class="w3l-table-info">
						    <table id="table">
							<thead id="tableHead">
							  	<tr>
									<th>地区</th>
									<th>唯一编号</th>
									<th>年份</th>
									<th>北纬</th>
									<th>东经</th>
									<th>重金属</th>
									<th>含量</th>
							  	</tr>
							</thead>
							<tbody id="tableBody"> 
							</tbody>
					  </table>
					</div>
					</div>
			</div>
		</div>
	</section>
</body>
</html>