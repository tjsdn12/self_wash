<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">OrderMenuRegisterPage</h4>
					<div class="form-group row">
						<label for="orderMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="orderMenuId" name="orderMenuId"
								value="<c:out value='${orderMenuVO.orderMenuId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="orderMenuName"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="orderMenuName" name="orderMenuName" 
								value="<c:out value='${orderMenuVO.orderMenuName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="price"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 단가</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="price" name="price"
								value="<c:out value='${orderMenuVO.price }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="amount"
						class="col-sm-3 text-end control-label col-form-label">주문메뉴 수량</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="amount" name="amount"
							value="<c:out value='${orderMenuVO.amount }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="washMenuId"
						class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="washMenuId" name="washMenuId"
							value="<c:out value='${orderMenuVO.washMenuId }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="memId"
						class="col-sm-3 text-end control-label col-form-label">회원번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="memId" name="memId"
							value="<c:out value='${orderMenuVO.memId }'></c:out>">
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" id="cancelBtn" class="btn btn-primary"
							onclick="goList()">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
<script>
	function save() {
		const data = $('#actionForm').serializeObject();
		$.ajax({
			url : '/customer/ordermenu/register',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({orderMenuVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/customer/ordermenu/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	function goList() {
		const form = document.querySelector("#actionForm");
		form.action = "/customer/ordermenu/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}

	document
			.querySelector("#modifyBtn")
			.addEventListener(
					"click",
					function(e) {
						const form = document.querySelector("#actionForm");
						form.action = "/customer/ordermenu/register";
						document.querySelector("#actionForm").submit();
					});
	
</script>