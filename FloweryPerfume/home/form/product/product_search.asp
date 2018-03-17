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
<%
    var search = Request.Querystring("search");
    cnn=Server.CreateObject("ADODB.Connection");
    cnn.Open(cStr);
    rs=Server.CreateObject("ADODB.Recordset");
    var sSQL = "SELECT * FROM Products";
	rs.Open(sSQL, cnn);
%>

<body>
    <h1><%=search %></h1>
	<div class="container">
    	<div class="jumbotron">
        	<h2 class="text-center">Sản Phẩm Mới</h2>
            <hr>
        	<div class="row">
				<div class="col-md-9">
					<%
					var  index=0;
					rs.MoveFirst();
					while(!rs.EOF){
					index ++;
						var sProductCode=rs.Fields.Item("ProductCode").Value;
						var sProductName=rs.Fields.Item("ProductName").Value;
						var sProductImage=rs.Fields.Item("ProductImage").Value;
                        if(sProductImage == ""){
                            sProductImage = "No_image.png";
                        }
						var sPrice=rs.Fields.Item("Price").Value;
					%>
					<div class="col-md-4">
						<div class="thumbnail">
							<a href="/FloweryPerfume/home/form/product/show_producthome.asp?productCode=<%=sProductCode%>">
								<img src="/FloweryPerfume/images/<%=sProductImage%>" class="img-responsive center-block img-thumbnail">
							</a>
							<div class="caption">
								<h2> <%=sProductName%> </h2>
								<p>Giá: <%=sPrice%>VND</p>
							</div>
						</div>
					</div>
				<%
					rs.MoveNext();
					}
				%>
				</div>
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
						
                 	</div>	
                </div>
            </div>
            
            

        </div>
    </div>
	
<!--	<div class="container"> 
    	<div class="jumbotron">
        	<h2 class="text-center">Sản Phẩm Hot</h2>
            <hr>
        	<div class="row">
            	<div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa1.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                   	</div>
                </div>
                <div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa2.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                  	</div>
                </div>
                <div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa3.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                   	</div>
                </div>
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
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                </select>
                         	</div>
                            <div class="form-control input-lg">
                                <select>
                                    <option>Thương Hiệu</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                </select>
                         	</div>
                            <div class="form-control input-lg">
                                <select>
                                    <option>Nồng Độ</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                </select>
                         	</div>
                            <div class="form-control input-lg">
                                <select>
                                    <option>Mùi Hương</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                    <option>Khoa Chinh SQL</option>
                                </select>
                         	</div>
                        </form> 
                 	</div>	
                </div>
            </div>
            
            <div class="row">
            	<div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa1.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                   	</div>
                </div>
                <div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa2.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                  	</div>
                </div>
                <div class="col-md-3">
                	<div class="thumbnail">
                        <a href="#">
                            <img src="media/san pham/hinhnuochoa3.jpg" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <h2>Tên Sản phẩm</h2>
                            <p>Chú thích sản phẩm</p>
                            <p class="gia">Giá: </p>
                        </div>
                   	</div>
                </div>
                <div class="col-md-3">
                	
                </div>
            </div>
        </div>
-->
    </div>
</body>
</html>