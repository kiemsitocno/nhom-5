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
  var sProductCode = Request.Querystring("productCode");
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT * FROM Products where ProductCode = " + sProductCode;
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
        	<h2 class="text-center">Thông Tin Chi Tiết Về Sản Phẩm</h2>
            	<%

						var sProductName=rs.Fields.Item("ProductName").Value;
						var sProductImage=rs.Fields.Item("ProductImage").Value;
            if(sProductImage == ""){
              sProductImage = "No_image.png";
            }
						var sPrice=rs.Fields.Item("Price").Value;
						var sVolumetric=rs.Fields.Item("Volumetric").Value;
						var sSex=rs.Fields.Item("Sex").Value;
						var sContent=rs.Fields.Item("Content").Value;
            var sManuCode=rs.Fields.Item("ManuCode").Value;
            

				%>
          <div class="row">
            <div class="col-md-6">  		     
              <img src="/FloweryPerfume/images/<%=sProductImage%>" class="img-responsive center-block img-thumbnail">
            </div>
            
            <div class="col-md-6">
              <p class="text-uppercase"> <%=sProductName%> </p>
              <hr>
              <p>Giá: <%=sPrice%> VND </p>
              <p>Dung Tích:<%=sVolumetric%>ml</p>
              <p>Giới Tính:<%=sSex%></p>
              <p>Giới Thiệu:<%=sContent%></p>
              <%
                cnna=Server.CreateObject("ADODB.Connection");
                cnna.Open(cStr);
                rsa=Server.CreateObject("ADODB.Recordset");
                sSQL = "SELECT * FROM Manufactuter";
                rsa.Open(sSQL, cnna);
              %>
              <%
                var sManuCodes=sManuCode;
                cnns=Server.CreateObject("ADODB.Connection");
                cnns.Open(cStr);
                rss=Server.CreateObject("ADODB.Recordset");
                sSQL = "SELECT ManuName FROM Manufactuter WHERE ManuCode='" + sManuCodes + "'";
                rss.Open(sSQL, cnns);
                var sManuName=rss.Fields.Item("ManuName").Value;
              %>
              <p>Tên Hãng: <%=sManuName%> </p>
            </div>
          </div>
				<%
					
				%>
            </div>
            
            
        </div>
    </div>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!--FOOTER-->
    <div w3-include-html="../footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
   	<!---------------------------------------------------------------------------------------------------------------------------------------->
    
</body>
</html>
