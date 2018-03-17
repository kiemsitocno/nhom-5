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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://www.w3schools.com/lib/w3.js"></script>
</head>


<body>
	<!-- FORM XÓA SẢN PHẨM -->
	<!-- A. Popup hiện thông tin sản phẩm cần xóa -->
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Bảng Xóa Thành Viên Vi Phạm</h4>
				</div>
				<div class="modal-body">
					<h4 class=""></h4>
					<form role="form" action="delete_product.asp">
						<!-- A.I Thông tin sản phẩm được xuất ra từ SQL, dựa vào mã sản phẩm được truyền từ mục productshow.asp(mục B.III..) -->
						<!-- Phần này thực hiên 2 công việc: 1 là lấy mã sản phẩm từ mục productshow.asp(mục B.III.2) -->
						<!-- 								 2 là truyền dữ liệu từ trang này qua file delete_product.asp -->
						<%
							var sCCodes = Request("sCCode");
							var sCNames = "";
							if(sCCodes !=""){
								cnn=Server.CreateObject("ADODB.Connection");
								cnn.Open(cStr);
								rs=Server.CreateObject("ADODB.Recordset");
								sSQL = "SELECT CCode, CName FROM Customer WHERE CCode = '" + sCCodes + "'";
								rs.Open(sSQL, cnn);
									var sCCodes=rs.Fields.Item("CCode").Value;
									var sCNames=rs.Fields.Item("CName").Value;
							}
						%>
						<div class="form-group">
							<label for="">Mã thành viên vi phạm:</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sCCodes%>" disabled>
							<input type="hidden"  name="sCCodeu" value="<%=sCCodes%>">
						</div>
						<div class="form-group">
							<label for="">Tên thành viên vi phạm:</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sCNames%>" disabled>
							<input type="hidden" name="" value="">
						</div>
						<div class="form-group">
							<label for="">Thành viên nếu vi phạm những nội quy sau sẽ bị xóa tài khoản vĩnh viễn lập tức không cần báo trước:</label>
							<ol>
								<li>Tất cả các thành viền đều phải sử dụng đầy đủ, nghiêm túc và chính xác các thông tin cá nhân. Sử dụng thông tin cá nhân không nghiêm túc, giả mạo.. sẽ lập tức bị xóa tài khoản mà không cần báo trước</li>
								<li>Tên thành viên, UserName không mang tính đồi trụy, quảng cáo, không phù hợp với thuần phong mỹ tục, mang tính đả kích đến chính trị, tôn giáo</li>
								<li>1 người chỉ lập 1 tài khoản, nếu bị phát hiện 2 tài khoản cùng 1 người, thì sẽ bị xóa cả 2 tài khoản</li>
							</ol>
						</div>
						<div class="checkbox">
							<label>
								<input class="add-confirm" type="checkbox"> Bạn đã đọc nội quy ở trên chưa ?
							</label>
						</div>
						<button type="submit" class="btnAdd btn btn-default">Đồng ý</button>
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
			window.location.assign("usershow.asp")
		}
	</script>
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
