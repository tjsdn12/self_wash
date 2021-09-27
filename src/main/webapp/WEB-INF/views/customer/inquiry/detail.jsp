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
				action="/customer/incuiry/list" method="get">
				<input type="hidden" name="inquiryId" value='<c:out value="${inquiryVO.inquiryId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">InquiryDetail Page</h4>
					<div class="form-group row">
						<label for="inquiryId" 
						class="col-sm-3 text-end control-label col-form-label">일대일 문의번호</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.inquiryId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="mgrId" class="col-sm-3 text-end control-label col-form-label">관리자 번호</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.mgrId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaTitle" class="col-sm-3 text-end control-label col-form-label">문의제목</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.qnaTitle }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaContents" class="col-sm-3 text-end control-label col-form-label">문의 내용</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.qnaContents }'></c:out>
						</div>
					</div>
					<div class="form-group row">
					<label for="classification"
						class="col-sm-3 text-end control-label col-form-label">문의 사항 분류</label>
					<div class="col-sm-9">
						<c:choose>
						<c:when test="${inquiryVO.classification == 'MANAGER' }">메니저 회원문의
						</c:when>
						<c:otherwise>사용자 회원문의</c:otherwise>
						</c:choose>
					</div>
				</div>
					<div class="form-group row">
						<label for="inquiryId" class="col-sm-3 text-end control-label col-form-label">회원아이디</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.memId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="replyContent" class="col-sm-3 text-end control-label col-form-label">답변제목</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.replyTitle }'></c:out>
						</div>
						</div>
						<div class="form-group row">
						<label for="replyTitle" class="col-sm-3 text-end control-label col-form-label">답변내용</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.replyContent }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="dateOfInquiry" class="col-sm-3 text-end control-label col-form-label">등록일시</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.dateOfInquiry }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="answerDate" class="col-sm-3 text-end control-label col-form-label">답변일시</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.answerDate }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="answerId" class="col-sm-3 text-end control-label col-form-label">관리자 아이디</label>
						<div class="col-sm-9">
							<c:out value='${inquiryVO.answerId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
					<label for="whetherItIsPrivate"
						class="col-sm-3 text-end control-label col-form-label">비공개 여부</label>
					<div class="col-sm-9">
						<c:choose>
						<c:when test="${inquiryVO.whetherItIsPrivate == 'public' }">공개</c:when>
						<c:otherwise>비공개</c:otherwise>
						</c:choose>
					</div>
				</div>
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" >수정</button>
						<button type="button" id="tablesBtn" class="btn btn-primary" onclick="goTable()">목록</button>
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
		form.action = "/customer/inquiry/list";
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
				form.action = "/customer/inquiry/form";
				document.querySelector("#actionForm").submit();
			});
	</script>



