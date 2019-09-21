<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>数据查看</title>
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
<!-- font CSS -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="${APP_PATH}/css/font.css" type="text/css" />
<link rel="stylesheet" href="${APP_PATH}/css/mycss.css" type="text/css" />
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
<script src="${APP_PATH}/assets/js/echarts.js"></script>
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
					<div class="data-title" style="margin-left: 5px;margin-top: 10px">
						<h2 style="font-size: 150%;color: #00BCD4"><b>数 据 查 看</b></h2>
					</div>
					<div class="choose">
						<form  id="tableshow"  onsubmit="return false;">
						<!-- <form  action="/SoilenvironmentMana//sectionelem/infoOfRegion"> -->
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;种类：
							<select id ="detailKind" name="detailKind" >
								<option value="region">土壤</option>
								<option value="product">农产品</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年份：
							<select id ="inityear" name="eleName">
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区：
							<select  id ="initregion" name="regionName">
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乡镇：
							<select  id ="towns" name="townsName">
								<option>全部</option>
							</select>
							<input type="submit" value="筛选数据" style="width:160px;height:30px; margin-left: 50px;">
						</form>
					</div>
					<div>
						<div >
						    <table id="table" style="text-transform: lowercase;">
							<thead id="tableHead">
							  	<tr>
									<th>地区</th>
									<th>乡镇</th>
									<th>年份</th>
									<th>唯一编号</th>
									<th>土壤镉(Cd)</th>
									<th>土壤汞(Hg)</th>
									<th>土壤砷(As)</th>
									<th>土壤铜(Cu)</th>
									<th>土壤铅(Pb)</th>
									<th>土壤铬(Cr)</th>
									<th>土壤锌(Zn)</th>
									<th>土壤镍(Ni)</th>
									<th>PH</th>
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
	<script type="text/javascript">
	$(document).ready(function(){
		$('#detailKind').change(function(){ 
			var kind = document.getElementById("detailKind").value;
			var html = '<tr>';
			if(kind=="region"){
				html+='<th>地区</th><th>乡镇</th><th>年份</th><th>唯一编号</th>';
				html+='<th>土壤镉(Cd)</th><th>土壤汞(Hg)</th><th>土壤砷(As)</th><th>土壤铜(Cu)</th>';
				html+='<th>土壤铅(Pb)</th><th>土壤铬(Cr)</th><th>土壤锌(Zn)</th><th>土壤镍(Ni)</th>';
				html+='<th>PH</th>' 
			}else{
				html+='<th>地区</th><th>乡镇</th><th>年份</th><th>样品编号</th><th>农产品</th>';
				html+='<th>农产品镉(Cd)</th><th>农产品汞(Hg)</th><th>农产品砷(As)</th><th>农产品铜(Cu)</th>'
				html+='<th>农产品铅(Pb)</th><th>农产品铬(Cr)</th><th>农产品锌(Zn)</th><th>农产品镍(Ni)</th>'
			}
			html+='</tr>'; 
			$("#tableHead").html(html);
			$("#tableBody").html('');
		})
		
		$('#inityear').change(function(){ 
			changetowns();
		})
		
		$('#initregion').change(function(){ 
			changetowns();
		})
	});
	
	function changetowns(){
		var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		var year=document.getElementById("inityear").value;
		var region=document.getElementById("initregion").value;
		$.ajax({
			url : projectName + '/init/inittowns',
			type : "POST",
			data : "year="+ year+"&region="+ region,
			dataType : 'json',
			async : false,
			success : function(data) {
				var html = '';
				html+='<option>全部</option>';
				for (i in data.object.towns) {
					html+='<option>'+data.object.towns[i]+'</option>';
				}
				$("#towns").html(html);
			}
		})
	}
	</script>
</body>
</html>