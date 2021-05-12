<%@ page import="com.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	//Save
	if (request.getParameter("itemCode") != null){
		
		 item itemObj = new item(); 
		 String stsMsg = "";
		 
		//insert items	 
		if (request.getParameter("hidItemIDSave") == ""){	 
			 
				 stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
								 request.getParameter("itemName"), 
								 request.getParameter("itemPrice"), 
								 request.getParameter("itemDesc")); 
		 }
		
		//update
		else{
				stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
								 request.getParameter("itemCode"), 
								 request.getParameter("itemName"), 
								 request.getParameter("itemPrice"), 
								 request.getParameter("itemDesc"));			
		 }
		
	 	 session.setAttribute("statusMsg", stsMsg); 
	 	 
	 }

	//Delete items
	if (request.getParameter("hidItemIDDelete") != null) {
		
		 item itemObj = new item(); 
		 String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete")); 
		 session.setAttribute("statusMsg", stsMsg); 
	 } 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="Views/bootstrap.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/items.js"></script>

</head>
<body>
	<div class="container">
 		<div class="row">
 			<div class="col">
 				<h1>Items Management</h1>
				<form id="formItem" name="formItem" method="post" action="items.jsp">
					Item code: <input id="itemCode" name="itemCode" type="text" class="form-control form-control-sm"><br>
					Item name: <input id="itemName" name="itemName" type="text" class="form-control form-control-sm"><br>
					Item price: <input id="itemPrice" name="itemPrice" type="text" class="form-control form-control-sm"><br>
					Item description: <input id="itemDesc" name="itemDesc" type="text" class="form-control form-control-sm"><br>
					
					<div id="alertSuccess" class="alert alert-success"></div>
				 	<div id="alertError" class="alert alert-danger"></div>
				 	
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
					<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
					
				</form>
	
				
				<div class="alert alert-sucess">
				 	<%out.print(session.getAttribute("statusMsg"));%> 
				</div>
				
				<br>
				
				<%
				 item itemObj = new item(); 
				 out.print(itemObj.readItems()); 
				%>
 
 			</div>
 		</div>
	</div>
	
</body>
</html>