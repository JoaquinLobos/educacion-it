<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Json</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<style>
		.body{
			font-family: Lato, sans-serif;
			height: 100vh;
			display:grid;
			justify-content:center;
			align-items:center;
			padding:1rem 3rem 2rem 3rem;
		}
		.table{
			border-collapse:collapse;
			ext-align:center;
		}
		.thead{
			background-color: OliveDrab;
			padding:0.75rem 2rem;
			text-transform:uppercase;
			letter-spacing:0.1rem;
			font-size:0.7rem;
			font-weight:900;
		}
		.ul{
			padding:1rem 2rem;
		}
		.tr:nth-child(even){
			background-color:WhiteSmoke;
		}
	</style>
    <script>
    

    	function apiPlaceholder() {
            axios.get(`http://jsonplaceholder.typicode.com/comments`)
            .then(function (response) {
            	htmlCreator(response.data);
            	let map = contarExtensiones(response.data);
            	dibujarDatos(map);
              	
            })
            .catch(function (error) { 
            	console.log('Error consultando la pagina');
            })
            .then(function () {
                console.log('Mostrando API');
            });
        }
        	
    	function htmlCreator(data){
                const divCases = document.getElementById('allData');
                const listTable = `
                
                    <table class="table">
                        <thead class="thead">
	                        <tr>
	                        	<th scope="col">post id</th>
		                        <th scope="col">id</th>
		                        <th scope="col">name</th>
		                        <th scope="col">email</th>
		                        <th scope="col">body</th> 
	                        </tr>
                        </thead>
                        <tbody>
                           ${getData(data)}
                        </tbody>
                    </table>`
               divCases.innerHTML = listTable;
    	}
    	
 	 	function getData(data){
             let casesRow='';
             
             for(let element of data){
            	 casesRow+=`
            		<tr class="tr">
            			 <th scope="row">${element.postId}</th>
	                     <th scope="row">${element.id}</th>
	                     <td>${element.name}</td>
	                     <td>${element.email}</td>
	                     <td>${element.body}</td>
	                </tr>     
                 `;
             }
             return casesRow;
        }
 	 	
 	 	function contarExtensiones(data){
 	 		let allExtensiones= getExtensiones(data);
 	    	let cantidad = 0;
 	    	let mapExtensiones = new Map();
 	    	
 	    	for(let ext1 of allExtensiones){	    		
 	    		mapExtensiones.set(ext1,cantidad);
 	    		for(let ext2 of allExtensiones){
 	    			if (ext1===ext2){
 	    				cantidad++;
 	    			}
 	    		}
 	    		mapExtensiones.set(ext1,cantidad)
 	    		cantidad=0;
 	    	}   		
    		return mapExtensiones;
 	 	}
 	 	
 	 	function getExtensiones(data){
 			let allExtensiones =[];
 			let extension=[];
 			
 	 		for(let i of data) {
 	 			if(i.email!==null || i.email!==''){
 	 				extension = i.email.split('.');
 	 				allExtensiones.push(extension[extension.length-1]);
 	            }
 	 		}    
 	 		return allExtensiones;
 	 	}
	
 	 	function dibujarDatos(map){
 	 		let divExtensiones = document.getElementById('extensiones'); 
 	 		let divComentarios = document.getElementById('comentarios');
 	 		
 	 		let list = `<ul class="ul">`
 	 		map.forEach( (value, key, map) => {
				list+=`<li> Extension: .${key} = ${value} comentarios</li>` 
 			});	
 	 		list+=`</ul>`;
 	 		
 	 		let cantidadExtensiones = `Cantidad De Extensiones: ${map.size}`;
 	    	divExtensiones.innerHTML = cantidadExtensiones;
 	    	divComentarios.innerHTML = list;
 	 	}
 	 	
    </script>

</head>
<body onload="apiPlaceholder()" class="body">
	<main>
		<div class="conteiner">
			<div class="row">
				<div class="col-12 mt-5">
					<div class="card">
						<h1 class="ul">JSON Placeholder</h1>
						<div class="card-header" id="extensiones"></div>
						<div class="card-body">
							<div id="comentarios"></div>
						</div>
					</div>
				</div>
				<div class="col-12 mt-5">
					<div id="allData"></div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>