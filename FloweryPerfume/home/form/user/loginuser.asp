<!DOCTYPE HTML>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../cnn.asp" -->

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/font-awesome.css">
  <link rel="stylesheet" href="/FloweryPerfume/admin/style/style.css">
  <script src="http://localhost/FloweryPerfume/admin/style/jquery.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/bootstrap.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/w3.js"></script>
</head>



<body>
	<!-- FORM SỬA SẢN PHẨM -->
	<!-- A. Popup hiện thông tin sản phẩm cần sửa -->
	<div class="modal-dialog">
	    <!-- Form Login-->
	    <div class="modal-content">
	          <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"></button>
	                <h4 class="modal-title">Bảng Đăng Nhập</h4>
	          </div>
	          <div class="modal-body">
	                <form role="form" action="/" name="myForm" id="myForm" onsubmit="return validateForm()">
	                      <div class="form-group">
	                            <label for="UserName">User Name</label>
	                            <input name="txtName" type="text" class="btnAdd form-control" id="UserName" placeholder="User Name">
	                      </div>
	                      <div class="form-group">
	                            <label for="Password">Password</label>
	                            <input name="txtPass" type="password" class="btnAdd form-control" id="Password" placeholder="Password">
	                      </div>
	                      <div class="checkbox">
	                            <label>
	                              <input name="conf" class="add-confirm1" type="radio" value="1" checked> Đăng nhập dưới quyền thành viên
	                            </label>
	                      </div>
	                      <div class="checkbox">
	                            <label>
	                              <input name="conf" class="add-confirm2" value="2" type="radio"> Đăng nhập dưới quyền admin
	                            </label>
	                      </div>
	                      <button type="submit" class="btn btn-default">Đồng ý</button>

	                </form>
	          </div>
	          <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy Đăng Nhập</button>
	          </div>
	    </div>
	</div>
	<!-- phụ lục: script hiện popup -->
	
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
<script>
	<!-- phụ lục: script hiện popup -->
	$(document).ready(function(){
		$("#mydelProduct").modal("show");
		$('.btnAdd').prop('disabled', true);

		$(".add-confirm").change(function() {
		    if(this.checked) {
		        $('.btnAdd').prop('disabled', false);
		    }else{
		    	$('.btnAdd').prop('disabled', true);
		    }
		});
	});
	function backdamin() {
		window.location.assign("manushow.asp")
	}
</script>
