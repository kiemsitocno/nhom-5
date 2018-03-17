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
  <style>
		.cot {
			height: 200px !important;
		}
		.cot2 {
			height: 100px !important;
		}
		.error {
			color: red;
		}
	</style>
</head>



<body>
	<!-- FORM SỬA SẢN PHẨM -->
	<!-- A. Popup hiện thông tin sản phẩm cần sửa -->
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Bảng sửa Sản Phẩm</h4>
				</div>
				<div class="modal-body">
					<h4 class="">Những ô có dấu * không được bỏ trống</h4>
					<form id="updateProductForm" role="form" action="edit_product.asp">
						<!-- A.I Thông tin sản phẩm được xuất ra từ SQL, dựa vào mã sản phẩm được truyền từ mục productshow.asp(mục B.III.1.) -->
						<!-- Phần này thực hiên 2 công việc: 1 là lấy mã sản phẩm từ mục productshow.asp(mục B.III.1) -->
						<!-- 								 2 là truyền dữ liệu từ trang này qua file edit_product.asp -->
						<%
							var sPCode = Request("sProductCode");
							var sPName = "";
							var sMCode = "";
							var sPVol = "";
							var sPPrice = "";
							var sPContent = "";
							if(sPCode !=""){
								cnn=Server.CreateObject("ADODB.Connection");
								cnn.Open(cStr);
								rs=Server.CreateObject("ADODB.Recordset");
								sSQL = "SELECT P.* FROM Products P WHERE ProductCode = '" + sPCode + "'";
								rs.Open(sSQL, cnn);
									var sPCode=rs.Fields.Item("ProductCode").Value;
									var sPName=rs.Fields.Item("ProductName").Value; 
									var sMCode=rs.Fields.Item("ManuCode").Value;
									var sPVol=rs.Fields.Item("Volumetric").Value;
									var sPPrice=rs.Fields.Item("Price").Value; 
									var sPContent=rs.Fields.Item("Content").Value;
									var sMName = "";
									/* DÙNG IF ĐỂ CHUYỂN ĐỔI TỪ MÃ HÃNG QUA TÊN HÃNG */
									if(sMCode !=""){
										cnn=Server.CreateObject("ADODB.Connection");
										cnn.Open(cStr);
										rs=Server.CreateObject("ADODB.Recordset");
										sSQL = "SELECT ManuName FROM Manufactuter WHERE ManuCode = '" + sMCode + "'";
										rs.Open(sSQL, cnn);
											var sMName=rs.Fields.Item("ManuName").Value;
									}
							}
						%>
						<div class="form-group">
							<label for="">Mã sản phẩm(*):</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sPCode%>" disabled>
							<input type="hidden"  name="sPCodeu" value="<%=sPCode%>">
						</div>
						<div class="form-group">
							<label for="">Tên sản phẩm(*):</label>
							<input name="sPNameu" type="text" class="form-control" id="productName" value="<%=sPName%>">
							<p class="error" id="productNameMessage"></p>
						</div>
						<div class="form-group">
							<label for="">Tên hãng(*):</label>
							<select name="sNCodeU" class="form-control">
								<option value="<%=sMCode%>"><%=sMName%></option>
								<!-- phụ lục: Phần liệt kê tên hãng --> 
								<%
									cnn=Server.CreateObject("ADODB.Connection");
									cnn.Open(cStr);
									rs=Server.CreateObject("ADODB.Recordset");
									sSQL = "SELECT * FROM Manufactuter";
									rs.Open(sSQL, cnn);
								%>
								<%
									var  index=0;
									rs.MoveFirst();
									while(!rs.EOF){
										index ++;
										var sMCodeo=rs.Fields.Item("ManuCode").Value;
										var sMNameo=rs.Fields.Item("ManuName").Value;
								%>
								<option value="<%=sMCodeo%>"><%=sMNameo%></option>
								<%
									rs.MoveNext();
									}		
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="">Giới tính:</label>
							<label class="radio-inline">
								<input name="sPSexu" type="radio" value="Nam" checked> Nam
							</label>
							<label class="radio-inline">
								<input name="sPSexu" type="radio" value="Nu"> Nữ
							</label>
							<label class="radio-inline">
								<input name="sPSexu" type="radio" value="Khac"> Khác
							</label>
						</div>
						<div class="form-group">
							<label for="">Dung tích(*):</label>
							<input name="sPVolu"  type="text" class="form-control" id="volumetric" value="<%=sPVol%>">
							<p class="error" id="volumetricMessage"></p>
						</div>
						<div class="form-group">
							<label for="">Giá(*):</label>
							<input name="sPPriceu"  type="text" class="form-control" id="price" value="<%=sPPrice%>">
							<p class="error" id="priceMessage"></p>
						</div>
						<div class="form-group">
							<label for="">Giới thiệu:</label>
							<textarea name="sPContentu" class="form-control" rows="3" value="<%=sPContent%>"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputFile">Hình ảnh sản phẩm:</label>
							<input name="sPImgu" type="file" id="">
						</div>
						<div class="checkbox">

							<label>
								<input class="update-confirm" type="checkbox"> Có đồng ý sửa sản phẩm này không ?
							</label>
						</div>
						<button type="submit" class="btnUpdate btn btn-default">Đồng ý</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="backdamin()">Hủy</button>
				</div>
			</div>
		</div>
	</div>
	<!-- phụ lục: script hiện popup -->
	<script>
		function backdamin() {
			window.location.assign("productshow.asp")
		}
	    function validateForm() {
		    var volumetric,price,productName;

		    var isProductNameValidate, isVolumeTricValidate, isPriceValidate = false; 
		    var isFormValidate = false;

		    // Get the value of the input field with id="numb"
		    productName = document.getElementById("productName").value.trim();
		    volumetric = document.getElementById("volumetric").value;
		    price = document.getElementById("price").value;

		    //usee for txtPN
		    if (productName=="") {
		    	document.getElementById("productNameMessage").innerHTML = "Tên sản phẩm không được bỏ trống";
		    	document.getElementById("productName").value = "";
		    	isProductNameValidate = false;
		    }else{
		    	document.getElementById("productNameMessage").innerHTML = "Hợp lệ";
		    	isProductNameValidate = true;
		    }
		    // use for volumetric
		    if (isNaN(volumetric) || volumetric < 1 || volumetric > 1000000000) {
		    	document.getElementById("volumetricMessage").innerHTML = "Dung tích cần nhập số lớn hơn 1 và nhỏ hơn 1 triệu";
		    	isVolumeTricValidate = false;
		    } else {
		    	document.getElementById("volumetricMessage").innerHTML = "Hợp lệ";
		    	isVolumeTricValidate = true;
		    }

		    // use for price
		     if (isNaN(price) || price < 1) {
		    	document.getElementById("priceMessage").innerHTML = "Giá không được bỏ trống và cần nhập số lớn hơn 1 ";
		    	isPriceValidate = false;
		    } else {
		    	document.getElementById("priceMessage").innerHTML = "Hợp lệ";
		    	isPriceValidate = true;
		    }

		    if(isProductNameValidate == true && isVolumeTricValidate == true && isPriceValidate ==true){
		    	isFormValidate = true;
		    }else{
		    	isFormValidate = false;
		    }
		    return isFormValidate;
		}

		$(document).ready(function(){
			$("#mydelProduct").modal("show");
			$('.btnUpdate').prop('disabled', true);
			$(".update-confirm").change(function() {
			    if(this.checked) {
			        $('.btnUpdate').prop('disabled', false);
			    }else{
			    	$('.btnUpdate').prop('disabled', true);
			    }
			});

			$('.btnUpdate').click(function(event){
				var form = $("#updateProductForm");
				event.preventDefault();
				if(validateForm()){
					form.submit();
				}
			});
		});
	
	</script>
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
