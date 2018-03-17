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
    <link rel="stylesheet" type="text/css" href="CalendarControl.css">
    <script language="javascript" src="CalendarControl.js"></script>
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

<%
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT * FROM Products ORDER BY ProductCode DESC";
	rs.Open(sSQL, cnn);
%>

<body>
	<!-- FILE NÀY LÀ FILE CHÍNH -->
	<!-- A. Header và menu-->
	<h1><%= Session("MM_Username") %></h1>
	<div w3-include-html="../nav.asp">
	</div> 
	<script>
		w3.includeHTML();
	</script>
	<!-- B. Phần thân-->
	<div class="container"> 
	
		<div class="jumbotron">
			<!-- B.I. Chức năng thêm sản phẩm add_product.asp-->
			<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#myaddProduct">Thêm sản phẩm</button>
			<div id="myaddProduct" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h4 class="modal-title">Bảng Thêm Sản Phẩm</h4>
						</div>
						<div class="modal-body">
							<h4 class="">Những ô có dấu * không được bỏ trống</h4>
							<form id="addProductForm" role="form" action="add_product.asp">
								<div class="form-group">
									<label for="">Tên sản phẩm(*):</label>
									<input type="text" name="productName" class="form-control" id="productName" placeholder="" >
									<p class="error" id="productNameMessage"></p>
								</div>
								<div class="form-group">
									<label for="">Tên Hãng(*):</label>
									<select name="MC" class="form-control">
										<%
											cnna=Server.CreateObject("ADODB.Connection");
											cnna.Open(cStr);
											rsa=Server.CreateObject("ADODB.Recordset");
											sSQL = "SELECT * FROM Manufactuter";
											rsa.Open(sSQL, cnna);
										%>
										<%
											var  index=0;
											rsa.MoveFirst();
											while(!rsa.EOF){
												index ++;
												var sMCodea=rsa.Fields.Item("ManuCode").Value;
												var sMNamea=rsa.Fields.Item("ManuName").Value;
										%>
										<option value="<%=sMCodea%>"><%=sMNamea%></option>
										<%
											rsa.MoveNext();
											}		
										%>
									</select>
								</div>
								<div class="form-group">
									<label for="">Giới tính:</label>
									<label class="radio-inline">
										<input name="S" type="radio" value="Nam" checked> Nam
									</label>
									<label class="radio-inline">
										<input name="S" type="radio" value="Nu"> Nữ
									</label>
									<label class="radio-inline">
										<input name="S" type="radio" value="Khac"> Khác
									</label>
								</div>
								<div class="form-group">
									<label for="">Dung tích(*):</label>
									<input name="ST" type="text" class="form-control" id="volumetric" placeholder="">
									<p class="error" id="volumetricMessage"></p>
								</div>
								<div class="form-group">
									<label for="">Giá(*):</label>
									<input name="P" ="text" class="form-control" id="price" placeholder="">
									<p class="error" id="priceMessage"></p>
								</div>
								<div class="form-group">
									<label for="">Giới thiệu:</label>
									<textarea name="C" class="form-control" rows="3"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputFile">Hình ảnh sản phẩm:</label>
									<input name="PI" type="file" id="">
								</div>
								<div class="checkbox">
								<label>
									<input class="add-confirm" type="checkbox"> Có đồng ý thêm mới sản phẩm này không ?
								</label>
								</div>
								<button type="submit" class="btnAdd btn btn-default">Đồng ý</button>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
						</div>
					</div>
				</div>
			</div>
			<!-- B.II. Phần show sản phẩm -->
			<h2 class="text-center">Thông tin sản phẩm</h2>
			<hr>
			<div class="row">
				<div class="col-md-9">
					<table class="table table-striped table-hover table-bordered">
						<tr>
							<th class="cot2">Mã sản phẩm</th>
							<th class="cot2">Tên</th>
							<th class="cot2">Hãng sản xuất</th>
							<th class="cot2">Giới tính</th>
							<th class="cot2">Dung tích</th>
							<th class="cot2">Giá</th>
							<th class="cot2">Ngày nhập</th>
							<th class="cot2">Giới thiệu</th>
						</tr>
						<%
							var  index=0;
							rs.MoveFirst();
							while(!rs.EOF){
								index ++;
									var sProductCode=rs.Fields.Item("ProductCode").Value;
									var sProductName=rs.Fields.Item("ProductName").Value;
									var sManuCode=rs.Fields.Item("ManuCode").Value;
									var sProductImage=rs.Fields.Item("ProductImage").Value;
									var sPrice=rs.Fields.Item("Price").Value;
									var sVolumetric=rs.Fields.Item("Volumetric").Value;
									var sSex=rs.Fields.Item("Sex").Value;
									var sContent=rs.Fields.Item("Content").Value;
									var sDateInput=rs.Fields.Item("DateInput").Value;
						%>
						<tr>
							<td class="cot"> <%=sProductCode%> </td>
							<td class="cot"> <%=sProductName%> </td>
							<%
							var sManuCodes=rs.Fields.Item("ManuCode").Value;
							cnns=Server.CreateObject("ADODB.Connection");
							cnns.Open(cStr);
							rss=Server.CreateObject("ADODB.Recordset");
							sSQL = "SELECT ManuName FROM Manufactuter WHERE ManuCode='" + sManuCodes + "'";
							rss.Open(sSQL, cnns);
							var sManuName=rss.Fields.Item("ManuName").Value;
							%>
							<td class="cot"> <%=sManuName%> </td>
							<td class="cot"> <%=sSex%> </td>
							<td class="cot"> <%=sVolumetric%> ml</td>
							<td class="cot"> <%=sPrice%>VND </td>
							<td class="cot"> <%=sDateInput%> </td>
							<td class="cot"> <%=sContent%> </td>
						</tr>
						<%
							rs.MoveNext();
						}
						%>
					</table>
				</div>
				<!-- B.III. Các Chức năng -->
				<div class="col-md-3">
					<table class="table table-striped table-hover table-bordered">
						<tr>
							<th class="cot2">Option</th>
						</tr>
						<%
							var  index=0;
							rs.MoveFirst();
							while(!rs.EOF){
								index ++;
								var sProductCode=rs.Fields.Item("ProductCode").Value;
						%>
						<tr>
							<!-- B.III.1 Chức năng Sửa Sản Phẩm -->
							<td class="cot">
								<form action="showupdate.asp">
									<button type="submit" name="sProductCode" class="btn btn-default btn-sm" value="<%=sProductCode%>">Sửa</button>
								</form>
							</td>
							<!-- B.III.2 Chức năng Xóa Sản Phẩm -->
							<td class="cot">
								<form action="showdelete.asp">
									<button type="submit" name="sProductCode" class="btn btn-default btn-sm" value="<%=sProductCode%>">Xóa</button>
								</form>
							</td>
						</tr>
						<%
							rs.MoveNext();
							}
						%>
					</table>
				</div>
			</div>
<!--
<div class="col-md-3">
<div id="type-product">
<h3 class="text-center">Tìm kiếm</h3>
<form role="form">
<div class="input-group">
<input type="text" class="form-control" placeholder="Nhập tên hãng, sản phẩm" name="search">
<div class="input-group-btn">
<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
</div>
</div>
</form>
<h3 class="text-center">Phân Loại</h3>
<form role="form">
<div class="form-control input-lg">
<select>
<option>Giới Tính</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
</select>
</div>
<div class="form-control input-lg">
<select>
<option>Hãng</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
</select>
</div>
<div class="form-control input-lg">
<select>
<option>Dung tích</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
</select>
</div>
<div class="form-control input-lg">
<select>
<option>Mùi Hương</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
<option>Khoa Chinh</option>
</select>
</div>
</form> 
</div>	
</div>
-->
		</div>
	</div>
	<script src="/FloweryPerfume/admin/script/bootstrap-datepicker.js"></script>
	<script src="/FloweryPerfume/admin/script/jquery.validate.min.js"></script>
	<script>
		$('.datepicker').datepicker();
	</script>
</body>
</html>
<!-- Phải đóng 3 kết nối ở đây, vì file chính này tạo tới 3 kết nối với 3 biến kết nối khác nhau(cnn, cnns, cnna) -->
<!-- Kết nối thực hiện show tên hãng (form thêm sản phẩm) -->
<%
	rsa.Close();
	cnna.Close();
	cnna=null;
%>
<!-- Kết nối thực hiện show tên hãng dựa trên mã hãng (show sản phẩm ở trang chính) -->
<%
	rss.Close();
	cnns.Close();
	cnns=null;
%>
<!-- Kết nối dùng chung, dành cho các trường hợp không trùng tên biến -->
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>

<script>
		<!-- phụ lục: script hiện popup -->
		function backdamin() {
			window.location.assign("../../../index.asp")
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
			$('.btnAdd').prop('disabled', true);

			$(".add-confirm").change(function() {
			    if(this.checked) {
			        $('.btnAdd').prop('disabled', false);
			    }else{
			    	$('.btnAdd').prop('disabled', true);
			    }
			});

			$('.btnAdd').click(function(event){
				var form = $("#addProductForm");
				event.preventDefault();
				if(validateForm()){
					form.submit();
				}
			});
		});
	</script>