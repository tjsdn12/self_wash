<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">OrderManageRegisterPage</h4>
					<div class="form-group row">
						<label for="orderId"
							class="col-sm-3 text-end control-label col-form-label">주문번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="orderId" name="orderId"
								value="<c:out value='${orderManageVO.orderId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="orderDate"
							class="col-sm-3 text-end control-label col-form-label">주문일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="orderDate" name="orderDate" readonly="readonly"
								value="<c:out value='${orderManageVO.orderDate }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="orderer"
							class="col-sm-3 text-end control-label col-form-label">주문자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="orderer" name="orderer"
								value="<c:out value='${orderManageVO.orderer }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="recipientPhone"
						class="col-sm-3 text-end control-label col-form-label">주문자 핸드폰번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="recipientPhone" name="recipientPhone"
							value="<c:out value='${orderManageVO.recipientPhone }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="totalPayment"
						class="col-sm-3 text-end control-label col-form-label">총합</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="totalPayment" name="totalPayment"
							value="<c:out value='${orderManageVO.totalPayment }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="methodOfPayment"
						class="col-sm-3 text-end control-label col-form-label">결제수단</label>
					<div class="col-sm-9">
						<select name="methodOfPayment" id="methodOfPayment">
							<option value="card" <c:if test="${orderManageVO.methodOfPayment == 'card'}">selected="selected"</c:if>>카드</option>
							<option value="cash" <c:if test="${orderManageVO.methodOfPayment == 'cash'}">selected="selected"</c:if>>현금</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="orderStatus"
						class="col-sm-3 text-end control-label col-form-label">주문상태</label>
					<div class="col-sm-9">
						<select name="orderStatus" id="orderStatus">
							<option value="waiting"  <c:if test="${orderManageVO.orderStatus == 'waiting'}">selected="selected"</c:if>>결제대기</option>
							<option value="ongoing" <c:if test="${orderManageVO.orderStatus == 'ongoing'}">selected="selected"</c:if>>진행중</option>
							<option value="finish" <c:if test="${orderManageVO.orderStatus == 'finish'}">selected="selected"</c:if>>환불완료</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="accumulatePoint"
						class="col-sm-3 text-end control-label col-form-label">적립포인트</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="accumulatePoint" name="accumulatePoint"
							value="<c:out value='${orderManageVO.accumulatePoint }'></c:out>">
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
			url : '/customer/ordermanage/register',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({orderManageVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/customer/ordermanage/list';
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
		form.action = "/customer/ordermanage/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}
</script>