<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>Matrix Admin Lite Free Versions Template by WrapPixel</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link href="/resources/dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
<![endif]-->
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
	src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script
	src="/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/resources/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="/resources/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="/resources/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="/resources/dist/js/custom.min.js"></script>
<script>
	$.fn.serializeObject = function() {
		var obj = null;
		try {
			if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
				var arr = this.serializeArray();
				if (arr) {
					obj = {};
					jQuery.each(arr, function() {
						obj[this.name] = this.value;
					});
				}
			}
		} catch (e) {
			alert(e.message);
		} finally {
		}
		return obj;
	};
</script>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin5">

					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<a class="navbar-brand" href="index.html"> <!-- Logo icon --> <b
						class="logo-icon ps-2"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
							<!-- Dark Logo icon --> <img
							src="/resources/assets/images/logo-icon.png" alt="homepage"
							class="light-logo" />

					</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
							<!-- dark Logo text --> <img
							src="/resources/assets/images/logo-text.png" alt="homepage"
							class="light-logo" />

					</span> <!-- Logo icon --> <!-- <b class="logo-icon"> --> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
						<!-- Dark Logo icon --> <!-- <img src="/resources/assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

						<!-- </b> --> <!--End Logo icon -->
					</a>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-start me-auto">
						<li class="nav-item d-none d-lg-block"><a
							class="nav-link sidebartoggler waves-effect waves-light"
							href="javascript:void(0)" data-sidebartype="mini-sidebar"><i
								class="mdi mdi-menu font-24"></i></a></li>
						<!-- ============================================================== -->
						<!-- create new -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<span class="d-none d-md-block">Create New <i
									class="fa fa-angle-down"></i></span> <span class="d-block d-md-none"><i
									class="fa fa-plus"></i></span>
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)"><i class="ti-search"></i></a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control"
									placeholder="Search &amp; enter"> <a class="srh-btn"><i
									class="ti-close"></i></a>
							</form></li>
					</ul>
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-end">
						<!-- ============================================================== -->
						<!-- Comment -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="mdi mdi-bell font-24"></i>
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
						<!-- ============================================================== -->
						<!-- End Comment -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- Messages -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle waves-effect waves-dark" href="#"
							id="2" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
								class="font-24 mdi mdi-comment-processing"></i>
						</a>
							<ul
								class="dropdown-menu dropdown-menu-end mailbox animated bounceInDown"
								aria-labelledby="2">
								<ul class="list-style-none">
									<li>
										<div class="">
											<!-- Message -->
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-success btn-circle"><i
														class="ti-calendar"></i></span>
													<div class="ms-2">
														<h5 class="mb-0">Event today</h5>
														<span class="mail-desc">Just a reminder that event</span>
													</div>
												</div>
											</a>
											<!-- Message -->
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-info btn-circle"><i
														class="ti-settings"></i></span>
													<div class="ms-2">
														<h5 class="mb-0">Settings</h5>
														<span class="mail-desc">You can customize this
															template</span>
													</div>
												</div>
											</a>
											<!-- Message -->
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-primary btn-circle"><i
														class="ti-user"></i></span>
													<div class="ms-2">
														<h5 class="mb-0">Pavan kumar</h5>
														<span class="mail-desc">Just see the my admin!</span>
													</div>
												</div>
											</a>
											<!-- Message -->
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-danger btn-circle"><i
														class="fa fa-link"></i></span>
													<div class="ms-2">
														<h5 class="mb-0">Luanch Admin</h5>
														<span class="mail-desc">Just see the my new admin!</span>
													</div>
												</div>
											</a>
										</div>
									</li>
								</ul>
							</ul></li>
						<!-- ============================================================== -->
						<!-- End Messages -->
						<!-- ============================================================== -->

						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
							href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="/resources/assets/images/users/1.jpg" alt="user"
								class="rounded-circle" width="31">
						</a>
							<ul class="dropdown-menu dropdown-menu-end user-dd animated"
								aria-labelledby="navbarDropdown">
								<c:if test="${sessionScope.loginInfo == null}">
									<a class="dropdown-item" href="/common/login/login"><i
										class="fa fa-power-off me-1 ms-1"></i> Login(<c:out
											value="${loginInfo.mgrName}" />)</a>
								</c:if>
								<div class="dropdown-divider"></div>
								<c:if test="${sessionScope.loginInfo != null}">
									<a class="dropdown-item" onclick="logout()"><i
										class="fa fa-power-off me-1 ms-1"></i> Logout(<c:out
											value="${loginInfo.mgrName}" />)</a>
								</c:if>
								<div class="dropdown-divider"></div>
							</ul></li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
					</ul>
				</div>
			</nav>
		</header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="pt-4">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="http://localhost:8080/info/storeinfo/list"
							aria-expanded="false"><span class="hide-menu">StoreInfo</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="http://localhost:8080/customer/inquiry/list"
							aria-expanded="false"><span class="hide-menu">QnA</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="http://localhost:8080/customer/washmenu/list"
							aria-expanded="false"><span class="hide-menu">WashMenu</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link has-arrow waves-effect waves-dark"
							href="javascript:void(0)" aria-expanded="false"><span
								class="hide-menu">Equipment </span></a>

							<ul aria-expanded="false" class="collapse  first-level">
								<li class="sidebar-item"><a
									href="http://localhost:8080/equipment/manage/list"
									class="sidebar-link"><span class="hide-menu"> Manage
									</span></a></li>
								<li class="sidebar-item"><a
									href="http://localhost:8080/equipment/model/list"
									class="sidebar-link"><span class="hide-menu"> Model
									</span></a></li>
							</ul></li>

								<!-- authorLevel ADMIN -->
								<c:if test="${loginInfo.authorLevel == 'ADMIN'}">
								<li class="sidebar-item"><a
							class="sidebar-link has-arrow waves-effect waves-dark"
							href="javascript:void(0)" aria-expanded="false"><span
								class="hide-menu">Manage </span></a>
								<ul aria-expanded="false" class="collapse  first-level">
								<li class="sidebar-item"><a
										href="http://localhost:8080/user/manager/list"
										class="sidebar-link"><span class="hide-menu">
												Manager </span></a></li>
									<li class="sidebar-item"><a
										href="http://localhost:8080/user/user/list"
										class="sidebar-link"><span class="hide-menu"> User
										</span></a></li>
						</ul></li>
					</c:if>

						<li class="sidebar-item"><a
							class="sidebar-link has-arrow waves-effect waves-dark"
							href="javascript:void(0)" aria-expanded="false"><span
								class="hide-menu">Order </span></a>
							<ul aria-expanded="false" class="collapse  first-level">
								<li class="sidebar-item"><a
									href="http://localhost:8080/customer/ordermanage/list"
									class="sidebar-link"><span class="hide-menu"> Manage
									</span></a></li>
								<li class="sidebar-item"><a
									href="http://localhost:8080/customer/ordermenu/list"
									class="sidebar-link"><span class="hide-menu"> Menu </span></a></li>
							</ul></li>

					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">

			<script type="text/javascript">
				function logout() {
					const data = $('#actionForm').serializeObject();
					$.ajax({
						url : '/common/login/logout',
						type : 'POST',
						//응답 받고 
						headers : { // Http header
							// 요청 보낼때 내가 보낼 data의 타입
							"Content-Type" : "application/json",
						}

					});
				}
			</script>