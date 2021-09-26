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
			action="/customer/washmenu/list" method="get">
			<input type="hidden" name="washMenuId" value='<c:out value="${washMenuVO.washMenuId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">WashMenuDetailPage</h4>
					<div class="form-group row">
						<label for="washMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<c:out value='${washMenuVO.washMenuId }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="menuPrice"
							class="col-sm-3 text-end control-label col-form-label">상품가격</label>
						<div class="col-sm-9">
							<c:out value='${washMenuVO.menuPrice }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비명</label>
						<div class="col-sm-9">
							<c:out value='${washMenuVO.equipmentName }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴 명</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.menuName }'></c:out>
						</div>
					</div>
				<div class="form-group row">
					<label for="detergentUseAt"
						class="col-sm-3 text-end control-label col-form-label">세제 사용 여부</label>
					<div class="col-sm-9">
						<c:choose>
							<c:when test="${manageManagerVO.detergentUseAt == 'using' }">세제사용유
							</c:when>
							<c:otherwise>세제사용무</c:otherwise>
						</c:choose>
					</div>
				</div>
					

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goTable()">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>


	<script type="text/javascript">
	
	function goTable(){
		const form = document.querySelector("#actionForm");
		form.action = "/customer/washmenu/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document
	.querySelector("#modifyBtn")
	.addEventListener(
			"click",
			function(e) {
				const form = document.querySelector("#actionForm");
				form.action = "/customer/washmenu/form";
				document.querySelector("#actionForm").submit();
			});
	</script>

