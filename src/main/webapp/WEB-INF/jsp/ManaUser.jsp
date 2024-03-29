<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户管理</title>
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
	<div class="main-grid">
		<div class="agile-grids">
			<div class="data-title" style="margin-left: 5px;margin-top: 10px">
				<h2 style="font-size: 150%; color: #00BCD4">
					<b>用 户 管 理</b>
				</h2>
			</div>
			<div class="choose" style="float: right;">
				<form id="tableshow">
					<input id="inputtxt"type="text" name="user_search" placeholder="搜索..." style="width: 160px; height: 30px;">
					<!-- <input type="submit" value="筛选数据" style="width:160px;height:30px; margin-left: 50px;"> -->
					<input type="button" onclick="DataFilter()" value="筛选数据"
						style="width: 160px; height: 30px; margin-left: 50px; color: #FFFFFF; background: #337AB7; border: none"
											onmousemove="this.style.backgroundColor='#286090';" onmouseout="this.style.backgroundColor='#337AB7';">
					<input type="button" onclick="FilterAll()" value="筛选全部"
						style="width: 160px; height: 30px; margin-left: 50px; color: #FFFFFF; background: #337AB7; border: none"
											onmousemove="this.style.backgroundColor='#286090';" onmouseout="this.style.backgroundColor='#337AB7';">
				</form>
			</div>
			<div class="agile-tables">
				<div class="w3l-table-info">
					<table id="table">
						<thead id="tableHead">
							<tr>
								<th>员工号</th>
								<th>用户名</th>
								<th>用户等级</th>
								<th>职位</th>
								<th>联系电话</th>
								<th>办公电话</th>
								<th>邮箱地址</th>
								<th>住址</th>
								<th>操作</th>
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
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	
	function DataFilter() {
		var searchname=inputtxt.value;
		if(searchname!=""){
			$.ajax({
				url :  projectName+'/user/chooserequest',
				type : "POST",
				data: "name="+ searchname ,
				dataType : 'json',
				async : false,
				success : function(data) {
					if(data.object.result ==0){
						alert("查无此人");
					}else{
						show(data.object.chooseusers);
					}
				}
			})
		}
	}
	
	function FilterAll() {
		$.ajax({
			url :  projectName+'/user/requestall',
			type : "POST",
			dataType : 'json',
			async : false,
			success : function(data) {
				show(data.object.allusers);
			}
		})
	}
	
	function show(array){
		var html = '';
		if (array != null) {
			for (i in array) {
				html += '<tr>';
				html += '<td>' + array[i].userid + '</td>';
				html += '<td>' + array[i].username + '</td>';
				html += '<td>' + array[i].level + '</td>';
				html += '<td>' + array[i].job + '</td>';
				html += '<td>' + array[i].linkphone + '</td>';
				html += '<td>' + array[i].jobphone + '</td>';
				html += '<td>' + array[i].email + '</td>';
				html += '<td>' + array[i].address + '</td>';
				//html += "<td><a href='#' onclick='modifychoose("+array[i].id+")'>修改</a> | <a href='#' onclick='deletechoose("+array[i].id+")'>删除</a></td>";
				html += "<td> <a href='#' onclick='deletechoose("+array[i].id+")'>删除</a></td>";
				html += '</tr>';
			}
			$("#tableBody").html(html);
		} else {
			$("#tableBody").html('');
		}
	}
	
	function deletechoose(userid){
		var r=confirm("确定删除该用户?");
		if (r==true)
	    {
			$.ajax({
				url :  projectName+'/user/deleteuser',
				type : "POST",
				data: "id="+ userid ,
				dataType : 'json',
				async : false,
				success : function(data) {
					alert("删除成功");
					FilterAll();
				},
				error : function(data) {
					alert("删除失败");
				}
			})
	    }
	}
	
	function modifychoose(id){
		alert("123");
     }
	</script>
</body>
</html>