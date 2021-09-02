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
			<form class="form-horizontal" id="actionForm" action="/customer/ordermenu/list"
				method="get">
				<div class="card-body">
					<h4 class="card-title">OrderMenuDetailPage</h4>
					<div class="form-group row">
						<label for="orderMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="orderMenuId"
								id="orderMenuId"
								value="<c:out value='${OrderMenuDTO.orderMenuId }'></c:out>"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group row">
						<label for="orderMenuName"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="orderMenuName"
								id="orderMenuName"
								value="<c:out value='${OrderMenuDTO.orderMenuName }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="price"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 단가</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="price"
								id="price"
								value="<c:out value='${OrderMenuDTO.price }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="amount"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 수량</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="amount"
								id="amount"
								value="<c:out value='${OrderMenuDTO.amount }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="washMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="washMenuId"
								id="washMenuId"
								value="<c:out value='${OrderMenuDTO.washMenuId }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="memId"
							class="col-sm-3 text-end control-label col-form-label">회원번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memId"
								id="memId"
								value="<c:out value='${OrderMenuDTO.memId }'></c:out>"
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
		form.action = "/customer/ordermenu/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#orderMenuId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='orderMenuId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>

