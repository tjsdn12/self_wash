<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal" id='submitModal' tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalHide()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="max-height:700px;">
        <p>Do you want it? </p>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalSubmitBtn" class="btn btn-primary">저장</button>
        <button type="button" id="modalAddBtn" class="btn btn-primary">추가</button>
        <button type="button" id="modalAddBtn2" class="btn btn-primary">추가2</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="modalHide()">닫기</button>
      </div>
    </div>
  </div>
</div>