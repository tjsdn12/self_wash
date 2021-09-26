<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="dropdown">
					<button type="button"
						class="btn btn-success dropdown-toggle text-white"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Sheet</button>
					<div class="dropdown-menu" style="margin: 0px;">
						<a class="dropdown-item" href="10">10</a> <a class="dropdown-item"
							href="20">20</a> <a class="dropdown-item" href="50">50</a> <a
							class="dropdown-item" href="100">100</a>
					</div>
					<h3 class="card-title mb-0" style="margin-left: 50px">UserList</h3>
				</div>
			</div>
			<div class="list-responsive">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th><label class="customcheckbox mb-3"> <input
									type="checkbox" id="mainCheckbox" /> <span class="checkmark"></span>
							</label></th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">카카오인증키</th>
							<th scope="col">비밀번호</th>
							<th scope="col">회원상태</th>
							<th scope="col">가입날자</th>
							<th scope="col">충전금액</th>
							<th scope="col">포인트</th>
							<th scope="col">이용날자</th>
							<th scope="col"><input type="button" value="등록"
								class="btn-info" onclick="location.href='/user/user/form'">
							</th>
						</tr>
					</thead>

					<tbody class="customtable">
						<c:forEach items="${getAllUserList }" var="item2">
							<tr>
								<td><label class="customcheckbox"> <input
										type="checkbox" class="listCheckbox" value="${item2.memId }" />
										<span class="checkmark"></span>
								</label></td>
								<td><a href="#" onclick="goSelect(this)">${item2.memId }</a></td>
								<td>${item2.memName }</td>
								<td>${item2.phone }</td>
								<td>${item2.kakaoAuthorizationKey }</td>
								<td>${item2.pw }</td>
								<td>${item2.memStatus }</td>
								<td>${item2.joinDate }</td>
								<td>${item2.amountCharge }</td>
								<td>${item2.point }</td>
								<td>${item2.dateOfUse }</td>
								<td>
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="deleteMem(<c:out value='${item2.memId }'/>)">삭제</button>
					</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-5">
		<div class="dataTables_info" id="zero_config_info">
		<input type="button" class="btn btn-danger btn-sm text-white" value="Unabled toggle" onclick="" >
		</div>
	</div>
	<div class="col-sm-12 col-md-7">
		<div class="dataTables_paginate paging_simple_numbers"
			id="zero_config_paginate">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
				<li class="paginate_button page-item previous"
					id="zero_config_previous"><a href="${pageMaker.start-1 }"
					aria-controls="zero_config"  tabindex="0"
					class="page-link">Previous</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.start }" end="${pageMaker.end }" var="i">
					<li class="paginate_button page-item ${pageMaker.pageDTO.page==i ? 'active':''}"><a href="${i }"
						aria-controls="zero_config" data-dt-idx="${i }" tabindex="0"
						class="page-link">${i }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
				<li class="paginate_button page-item next" id="zero_config_next"><a
					href="${pageMaker.end +1}" aria-controls="zero_config"  tabindex="0"
					class="page-link">Next</a></li>
				</c:if>
				
			</ul>
			<h6>Showing ${pageMaker.start } to ${pageMaker.end } of ${pageMaker.realEnd } entries</h6>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/modal.jsp"%>

<form id="actionForm" action="/user/list" method="get" >
	<input type="hidden" name="page" value="${pageMaker.pageDTO.page }" class="current_page">
	<input type="hidden" name="perSheet" value="${pageMaker.pageDTO.perSheet }" class="current_perSheet">
</form>

<script>
document.querySelectorAll(".page-link").forEach(a=>{
	   a.addEventListener("click",function (e){
	       e.preventDefault();
	       e.stopPropagation();
	       document.querySelector(".current_page").value = a.getAttribute('href');
	       document.querySelector("#actionu").submit();
	   },false)
	});
	
document.querySelectorAll(".dropdown-item").forEach(a=>{
    a.addEventListener("click",function (e){
        e.preventDefault();
        e.stopPropagation();
        console.log(a.getAttribute('href'));
        document.querySelector(".current_perSheet").value = a.getAttribute('href');
        document.querySelector(".current_page").value = 1;
        document.querySelector("#actionForm").submit();
    },false)
});

function goSelect(dom){
	console.log(dom);
	const memId =dom.innerHTML;
	
	const form =document.querySelector("#actionForm");
	
	form.action ="/user/user/detail";
	
	form.method = "get";
	
	form.innerHTML = "<input type ='hidden' name ='memId' value='"+memId+"' />";
	
	form.submit();
	
}

function deleteMem(memId) {
	const data = $('#actionForm').serializeObject();
	$.ajax({
		url : '/user/user/list',
		type : 'Delete',
		//응답 받고 
		headers : { // Http header
			// 요청 보낼때 내가 보낼 data의 타입
			"Content-Type" : "application/json",
		},
		//
		dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
		data : JSON.stringify({manageUserVO: {memId:memId}}),
		success : function onData(data) {
			alert(data.message);
			if(data.success) {
				location.replace();
				//새로고침
			}
		},
		error : function onError(error) {
			console.log("AA");
			console.error(error);
		}
	});
}

</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
