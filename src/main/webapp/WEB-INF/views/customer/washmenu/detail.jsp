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
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴 명</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.menuName }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">헹굼횟수</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.rinsingCnt }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">세탁기 용량</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.weight }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">탈수 횟수</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.dehydrationCnt }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">물 종류</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.waterType }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">소요 시간</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.time }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴 설명</label>
						<div class="col-sm-9">
								<c:out value='${washMenuVO.menuDesc }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentType"
							class="col-sm-3 text-end control-label col-form-label">장비 유형</label>
						<div class="col-sm-9">
						</div>
					</div>
					<div class="form-group row">
						<label for="categoryId"
							class="col-sm-3 text-end control-label col-form-label">카테고리</label>
						<div class="col-sm-9">
							<c:forEach items="${getCategoryList }" var="item2">
								<c:if test="${item2.categoryId==washMenuVO.categoryId}">
									${item2.largeCategoryName } > ${item2.middleCategoryName }
									<c:if test="${item2.smallCategoryName != null and item2.smallCategoryName != '' }"> 
										>
										${item2.smallCategoryName }
									</c:if>
								</c:if>
							</c:forEach>
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

