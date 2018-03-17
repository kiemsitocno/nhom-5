<!DOCTYPE HTML>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../cnn.asp" -->
<% 
  if(Session("sUser")==null){
    Response.Redirect("/floweryperfume/home/form/Loginadmin.asp");
  }
%>

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
	<!-- FORM XÓA SẢN PHẨM -->
	<!-- A. Popup hiện thông tin sản phẩm cần xóa -->
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Bảng Xóa Sản Phẩm</h4>
				</div>
				<div class="modal-body">
					<h4 class=""></h4>
					<form role="form" action="delete_product.asp">
						<!-- A.I Thông tin sản phẩm được xuất ra từ SQL, dựa vào mã sản phẩm được truyền từ mục productshow.asp(mục B.III..) -->
						<!-- Phần này thực hiên 2 công việc: 1 là lấy mã sản phẩm từ mục productshow.asp(mục B.III.2) -->
						<!-- 								 2 là truyền dữ liệu từ trang này qua file delete_product.asp -->
						<%
							var sPCode = Request("sProductCode");
							var sPName = "";
							if(sPCode !=""){
								cnn=Server.CreateObject("ADODB.Connection");
								cnn.Open(cStr);
								rs=Server.CreateObject("ADODB.Recordset");
								sSQL = "SELECT ProductCode, ProductName FROM Products WHERE ProductCode = '" + sPCode + "'";
								rs.Open(sSQL, cnn);
									var sPCode=rs.Fields.Item("ProductCode").Value;
									var sPName=rs.Fields.Item("ProductName").Value;
							}
						%>
						<div class="form-group">
							<label for="">Mã sản phẩm:</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sPCode%>" disabled>
							<input type="hidden"  name="sPCodeu" value="<%=sPCode%>">
						</div>
						<div class="form-group">
							<label for="">Tên sản phẩm:</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sPName%>" disabled>
							<input type="hidden" name="sPNameu" value="sPName">
						</div>
						
						<div class="checkbox">
							<label>
								<input class="delete-confirm" type="checkbox"> Có đồng ý xóa sản phẩm này không ?
							</label>
						</div>
						<button type="submit" class="btnDelete btn btn-default">Đồng ý</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="backdamin()">Hủy</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		<!-- phụ lục: script hiện popup -->
		$(document).ready(function(){
			$("#mydelProduct").modal("show");
			$('.btnDelete').prop('disabled', true);

			$(".delete-confirm").change(function() {
			    if(this.checked) {
			        $('.btnDelete').prop('disabled', false);
			    }else{
			    	$('.btnDelete').prop('disabled', true);
			    }
			});
		});
		function backdamin() {
			window.location.assign("productshow.asp")
		}
	</script>
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
