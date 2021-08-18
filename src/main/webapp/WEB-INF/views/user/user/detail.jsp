<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

           <!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm" action="/user/form" method="get" >
				<div class="card-body">
					<h4 class="card-title">UserDetail Page</h4>
					<div class="form-group row">
						<label for="fname" class="col-sm-3 text-end control-label col-form-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memId" id="memId" value="<c:out value='${ManageUserDTO.memId }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="fname" class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="name" id="name" value="<c:out value='${ManageUserDTO.name }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
						<label for="lname" class="col-sm-3 text-end control-label col-form-label">전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone" value="<c:out value='${ManageUserDTO.phone }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="lname" class="col-sm-3 text-end control-label col-form-label">카카오인증</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="kakaoAuthorizationKey" name="kakaoAuthorizationKey" value="<c:out value='${ManageUserDTO.kakaoAuthorizationKey }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
						<label for="lname" class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="pw" name="pw" value="<c:out value='${ManageUserDTO.pw }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
					<label for="memStatus"
						class="col-sm-3 text-end control-label col-form-label">회원 상태</label>
					<div class="col-sm-9">
						<select name="memStatus" id="memStatus">
							<option value="ADMIN">휴먼회원</option>
							<option value="MANAGER">탈퇴회원</option>
						</select>
					</div>
				</div>
					<div class="form-group row">
						<label for="joinDate" class="col-sm-3 text-end control-label col-form-label">가입날자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="joinDate" name="joinDate" value="<c:out value='${ManageUserDTO.joinDate }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="amoutCharge" class="col-sm-3 text-end control-label col-form-label">충전금액</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="amoutCharge" name="amoutCharge" value="<c:out value='${ManageUserDTO.amoutCharge }'></c:out>"
							>
						</div>
						</div>
						<div class="form-group row">
						<label for="point" class="col-sm-3 text-end control-label col-form-label">회원포인트</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="point" name="point" value="<c:out value='${ManageUserDTO.point }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
						<label for="dateOfUse" class="col-sm-3 text-end control-label col-form-label">이용일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="dateOfUse" name="dateOfUse" value="<c:out value='${ManageUserDTO.dateOfUse }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" >수정</button>
						<button type="button" id="tablesBtn" class="btn btn-primary" onclick="goTables()">list</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>



	<script type="text/javascript">
	
	function goTable(){
		let form = document.querySelector("#actionForm");
		form.action = "/user/user/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#memId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='memId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>



