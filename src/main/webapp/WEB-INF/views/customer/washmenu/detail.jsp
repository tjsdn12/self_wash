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
			<form class="form-horizontal" id="actionForm" action="/customer/washmenu/list"
				method="get">
				<div class="card-body">
					<h4 class="card-title">WashMenuDetailPage</h4>
					<div class="form-group row">
						<label for="washMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="washMenuId"
								id="washMenuId"
								value="<c:out value='${WashMenuDTO.washMenuId }'></c:out>"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group row">
						<label for="menuPrice"
							class="col-sm-3 text-end control-label col-form-label">상품가격</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="menuPrice"
								id="menuPrice"
								value="<c:out value='${WashMenuDTO.menuPrice }'></c:out>"
								>
						</div>
					</div>

					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentModelId"
								name="equipmentModelId"
								value="<c:out value='${WashMenuDTO.equipmentModelId }'></c:out>"
								>
						</div>
					</div>

					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴 명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="menuName"
								name="menuName"
								value="<c:out value='${WashMenuDTO.menuName }'></c:out>"
								>
						</div>
					</div>
				<div class="form-group row">
					<label for="detergentUseAt"
						class="col-sm-3 text-end control-label col-form-label">세제 사용 여부</label>
					<div class="col-sm-9">
						<select name="detergentUseAt" id="detergentUseAt">
							<option value="0">세제 사용 유</option>
							<option value="1">세제 사용 무</option>
						</select>
					</div>
				</div>
					

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goTable()">취소</button>
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
		form.action = "/customer/washmenu/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#washMenuId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='washMenuId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>

