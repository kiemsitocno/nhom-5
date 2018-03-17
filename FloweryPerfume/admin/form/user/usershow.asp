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
		height: 60px !important;
	}
	.cot2 {
		height: 100px !important;
	}
  </style>
</head>
<%
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT * FROM Customer";
	rs.Open(sSQL, cnn);
%>

<body>
	
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- MENU -->

	<div w3-include-html="../nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- DONG SAN PHAM-->
	<div class="container"> 
    	<div class="jumbotron">
    		<h2 class="text-center">Thông tin tất cả khách hàng</h2>
    		<hr>
			<div class="row">
			<div class="col-md-9">
				<table class="table table-striped table-hover table-bordered">
					<tr>
						<th class="cot2">Mã thành viên</th>
						<th class="cot2">Tên</th>
						<th class="cot2">UserName</th>
						<th class="cot2">Số Điện Thoại</th>
						<th class="cot2">Địa chỉ</th>
						<th class="cot2">Giới tính</th>
						<th class="cot2">Email</th>
						
					</tr>
					<%
						var  index=0;
						rs.MoveFirst();
						while(!rs.EOF){
						index ++;
							var sCCode=rs.Fields.Item("CCode").Value;
							var sCName=rs.Fields.Item("CName").Value;
							var sCUsername=rs.Fields.Item("CUsername").Value;
							var sCPhone=rs.Fields.Item("CPhone").Value;
							var sCAddress =rs.Fields.Item("CAddress").Value;
							var sCSex=rs.Fields.Item("CSex").Value;
							var sCEmail=rs.Fields.Item("CEmail").Value;
					%>
					<tr>
						<td class="cot"> <%=sCCode%> </td>
						<td class="cot"> <%=sCName%> </td>
						<td class="cot"> <%=sCUsername%> </td>
						<td class="cot"> <%=sCPhone%> </td>
						<td class="cot"> <%=sCAddress%> </td>
						<td class="cot"> <%=sCSex%> </td>
						<td class="cot"> <%=sCEmail%> </td>
						
							<!--
							<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#myeditUser">Chi tiết</button>
							<div id="myeditUser" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                   
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"></button>
                                            <h4 class="modal-title">Bảng Sửa Thành Viên</h4>
                                        </div>
                                        <div class="modal-body">
											<h4 class="">Những ô không cần sửa thì không cần nhập</h4>
											<form role="form">
											<div class="form-group">
												<label for="">UserName:</label>
													<input type="text" class="form-control" id="disabledInput" placeholder="tuanvu123123" disabled>
											</div>
											<div class="form-group">
												<label for="">Password:</label>
													<input type="password" class="form-control" id="" placeholder="">
											</div>
											<div class="form-group">
												<label for="">Re Password:</label>
													<input type="password" class="form-control" id="" placeholder="">
											</div>
											<div class="form-group">
												<label for="">Tên:</label>
													<input type="text" class="form-control" id="" placeholder="Le Tuan Vu">
											</div>
											<div class="form-group">
												<label for="">Email:</label>
													<input type="email" class="form-control" id="" placeholder="abcdef@gmail.com">
											</div>
											<div class="form-group">
												<label for="">Địa chỉ:</label>
													<input type="text" class="form-control" id="" placeholder="100 Binh Loi">
											</div>
											<div class="form-group">
												<label for="">Số điện thoại:</label>
													<input type="text" class="form-control" id="" placeholder="0123456789">
											</div>
											<div class="form-group">
													<label for="">Giới tính:</label>
													<label class="radio-inline">
														<input name="CS1" type="radio" value="Nam"> Nam
													</label>
													<label class="radio-inline">
														<input name="CS1" type="radio" value="Nu"> Nữ
													</label>
											</div>
											
											<div class="checkbox">
												<label>
													<input type="checkbox"> Có đồng ý sửa thông tin thành viên ?
												</label>
											</div>
											<button type="submit" class="btn btn-default">Đồng ý</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
											</form>
                                          </div>
                                          <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                          </div>
                                    </div>
                                </div>
                            </div>
                            -->
					</tr>
					<%
						rs.MoveNext();
						}
					%>
				</table>
			</div>
			
			
			<div class="col-md-3">
					<table class="table table-striped table-hover table-bordered">
						<tr class="cot2">
							<th class="">Option</th>
						</tr>
						<%
							var  index=0;
							rs.MoveFirst();
							while(!rs.EOF){
								index ++;
								var sCCode=rs.Fields.Item("CCode").Value;
						%>
						<tr>
							<!-- B.III.2 Chức năng Xóa Sản Phẩm -->
							<td class="cot">
								<form action="showdelete.asp">
									<button type="submit" name="sCCode" class="btn btn-default btn-sm" value="<%=sCCode%>">Xóa</button>
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
                                    <option>Nồng Độ</option>
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
			</div>
		</div>
		-->
	</div>
	
                
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!--FOOTER-->
    <div w3-include-html="footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
   	<!---------------------------------------------------------------------------------------------------------------------------------------->
    
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
<script>
	function backdamin() {
			window.location.assign("../../../index.asp")
		}
</script>
