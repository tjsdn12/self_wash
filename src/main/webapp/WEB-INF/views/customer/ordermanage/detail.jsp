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
			<form class="form-horizontal" id="actionForm"
				action="/customer/ordermanage/list" method="get">
				<input type="hidden" name="orderId" value='<c:out value="${orderManageVO.orderId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">OrderManageDetailPage</h4>
					<div class="form-group row">
						<label for="orderId"
							class="col-sm-3 text-end control-label col-form-label">주문번호</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.orderId }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="orderDate"
							class="col-sm-3 text-end control-label col-form-label">주문일자</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.orderDate }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="orderer"
							class="col-sm-3 text-end control-label col-form-label">주문자</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.orderer }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="recipientPhone"
							class="col-sm-3 text-end control-label col-form-label">주문자핸드폰
							번호</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.recipientPhone }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="totalPayment"
							class="col-sm-3 text-end control-label col-form-label">총합</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.totalPayment }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="methodOfPayment"
							class="col-sm-3 text-end control-label col-form-label">결제수단</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${orderManageVO.methodOfPayment == 'card' }">
						카드
						</c:when>
								<c:otherwise>
						현금
						</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group row">
						<label for="orderStatus"
							class="col-sm-3 text-end control-label col-form-label">주문상태</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${orderManageVO.orderStatus == 'waiting' }">결제대기
							</c:when>
								<c:when test="${orderManageVO.orderStatus == 'ongoing' }">진행중
							</c:when>
								<c:otherwise>
								환불완료
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group row">
						<label for="accumulatePoint"
							class="col-sm-3 text-end control-label col-form-label">적립포인트</label>
						<div class="col-sm-9">
							<c:out value='${orderManageVO.accumulatePoint }'></c:out>
						</div>
					</div>

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goList()">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>


<script type="text/javascript">
	function goList() {
		let form = document.querySelector("#actionForm");
		form.action = "/customer/ordermanage/list";
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
				form.action = "/customer/ordermanage/form";
				document.querySelector("#actionForm").submit();
			});
</script>

