<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<nav class="user-menu">
	<a href="javascript:;" class="main-menu-access"> <i
		class="icon-proton-logo"></i> <i class="icon-reorder"></i>
	</a>
</nav>
<section class="title-bar">
	<div class="logo" style="width: 70%">
		<h2>
			<a href="#"><img src="${APP_PATH}/images/logo.png" alt="" />&nbsp;&nbsp;&nbsp;天津市农产品产地土壤重金属</a>
		</h2>
	</div>
	<div class="header-right" style="margin-right: 50px;">
		<div class="profile_details_left">
			<div class="profile_img" style="position: absolute;">
				<span class="prfil-img"><i class="fa fa-user"
					style="width: 33px; height: 33px;"></i></span>

			</div>
			<div
				style="float: right; margin-left: 50px; margin-top: 5px; font-size: 100%">
				<b>当前用户：${user.username}， <a
					href="/SoilenvironmentMana/user/outLogin"
					style="text-decoration: none; color: #90EE90;">注销</a></b>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="clearfix"></div>
</section>
