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
			<form class="form-horizontal" id="actionForm" action="/order/manage/list"
				method="get">
				<div class="card-body">
					<h4 class="card-title">OrderManageDetailPage</h4>
					<div class="form-group row">
						<label for="orderId"
							class="col-sm-3 text-end control-label col-form-label">주문번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="orderId"
								id="orderId"
								value="<c:out value='${OrderManageDTO.orderId }'></c:out>"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group row">
						<label for="orderDate"
							class="col-sm-3 text-end control-label col-form-label">주문일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="orderDate"
								id="orderDate"
								value="<c:out value='${OrderManageDTO.orderDate }'></c:out>"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="orderer"
							class="col-sm-3 text-end control-label col-form-label">주문자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="orderer"
								id="orderer"
								value="<c:out value='${OrderManageDTO.orderer }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="recipientPhone"
							class="col-sm-3 text-end control-label col-form-label">주문자핸드폰 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="recipientPhone"
								id="recipientPhone"
								value="<c:out value='${OrderManageDTO.recipientPhone }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="totalPayment"
							class="col-sm-3 text-end control-label col-form-label">총합</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="totalPayment"
								id="totalPayment"
								value="<c:out value='${OrderManageDTO.totalPayment }'></c:out>"
								>
						</div>
					</div>

						<div class="form-group row">
					<label for="methodOfPayment"
						class="col-sm-3 text-end control-label col-form-label">결제수단</label>
					<div class="col-sm-9">
						<select name="methodOfPayment" id="methodOfPayment">
							<option value="0">카드</option>
							<option value="1">현금</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="orderStatus"
						class="col-sm-3 text-end control-label col-form-label">주문상태</label>
					<div class="col-sm-9">
						<select name="orderStatus" id="orderStatus">
							<option value="0">결제대기</option>
							<option value="1">진행중</option>
							<option value="2">환불완료</option>
						</select>
					</div>
				</div>
					<div class="form-group row">
						<label for="accumulatePoint"
							class="col-sm-3 text-end control-label col-form-label">적립포인트</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="accumulatePoint"
								name="accumulatePoint"
								value="<c:out value='${OrderManageDTO.accumulatePoint }'></c:out>"
								>
						</div>
					</div>

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goTables()">취소</button>
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
		form.action = "/order/manage/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#orderId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='orderId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>

