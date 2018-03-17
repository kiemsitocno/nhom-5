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
    if(search != "" || search !=null){
        sSQL = "SELECT P.*,M.ManuName as 'ManuName' From Products P, Manufactuter M where P.ManuCode = M.ManuCode AND(P.ProductName LIKE '%"+search+"%' OR M.ManuName LIKE '%"+search+"%')"  ;
    }
    rs.Open(sSQL, cnn);
  %>
<body>
	
   
	<div w3-include-html="../nav.asp"></div>
	<script>
		w3.includeHTML();
	</script>
	<div class="container"> 
    	<div class="jumbotron">
        	<h2 class="text-center">Sản Phẩm</h2>
            <hr>
			<h3 class="text-center"></h3>
				<form role="form">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Nhập tên hãng, sản phẩm" name="search">
							<div class="input-group-btn">
							<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						</div>
					</div>
				</form>
			<h3 class="text-center"></h3>
        	<div class="row">
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
						var sManuName=rs.Fields.Item("ManuName").Value;
						var sPrice=rs.Fields.Item("Price").Value;
				%>
            	<div class="col-sm-3">
                	<div class="thumbnail">
                        <a href="/FloweryPerfume/home/form/product/show_producthome.asp?productCode=<%= sProductCode%>" >
                            <img src="/FloweryPerfume/images/<%=sProductImage%>" class="img-responsive center-block img-thumbnail">
                        </a>
                        <div class="caption">
                            <p> <%=sProductName%> </p>
                            <p>Hãng : <%= sManuName %></p>
                            <p>Giá: <%=sPrice%>VND </p>
                        </div>
                   	</div>
                </div>
				<%
					rs.MoveNext();
					}
				%>
                
            </div>
            
            
        </div>
    </div>
    <div w3-include-html="../footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
  <script>
      function Redirect() {
         window.location.assign("../Loginuser.asp");
      };
      function Redirecta() {
         window.location.assign("../Loginadmin.asp");
      };
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
    </script> 

</body>
</html>



