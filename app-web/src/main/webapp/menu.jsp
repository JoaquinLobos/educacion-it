<!DOCTYPE html>
<%@page import="ar.com.educacionit.domain.Menu"%>
<%@page import="java.util.Collection"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clase2 HTML</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <main>
	    <div class="container">
	    	<div class="row">
	    		<div class="col-6">
			        <section>
					<%Collection<Menu> menu = (Collection<Menu>)request.getAttribute("menus");%>
					<ul class="nav nav-tabs">
						<% for(Menu m : menu){%>       <!-- TODO: una función que sea invocada cuando if(!m.getSubmenu.isEmpty()) -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false"><%=m.getTexto()%></a>
							<ul class="dropdown-menu">
								<% for(Menu sm : m.getSubMenu()){%>		
								<li><a class="dropdown-item" href="<%=sm.getLink()%>"><%=sm.getTexto()%></a>
									<% for(Menu ssm : sm.getSubMenu()){%> 
									<ul>
										<li style="list-style-type:none;"><a class="dropdown-item"
											href="<%=request.getContextPath()+ssm.getLink()%>"><%=ssm.getTexto() %></a>
										</li>
									</ul> 
									<%}%>
								</li>
								<%}%>
							</ul>
						</li>
						<%}%>
					</ul>
			</section>
			     </div>
		     </div>
	     </div>
	    </main>
	    <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>