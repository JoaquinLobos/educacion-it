<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Covid</title>
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
		}
		.table{
			border-collapse:collapse;
			text-align:center;
		}
		.thead{
			background-color: OliveDrab;
			padding:0.75rem 2rem;
			text-transform:uppercase;
			letter-spacing:0.1rem;
			font-size:0.7rem;
			font-weight:900;
		}
		.td{
			padding:1rem 2rem;
		}
		
		.tr:nth-child(even){
			background-color:silver;
		}
		
	
	</style>
    <script>
        
    	function apiCovid() {
            axios.get(`https://api.covidtracking.com/v1/us/daily.json`)
            .then(function (response) {
            	htmlCreator(response.data);
              	
            })
            .catch(function (error) { 
            	console.log('Error');
            })
        }
     
    	
    	
    	function htmlCreator(data){
                const dibujarDatos = document.getElementById('lista');
                const datosOrdenados = ordenarPositivos(data);
                const listTable = `
                
                    <table class="table">
                        <thead class= "thead">
	                        <tr>
		                        <th scope="col">Date</th>
		                        <th scope="col">Positive</th>
		                        <th scope="col">Negative</th>
		                        <th scope="col">Total Test Results</th>		
		                        <th scope="col">HospitalizedCurrently</th>
		                        <th scope="col">Death</th>
	                        </tr>
                        </thead>
                        <tbody>
                           ${instanciarDatos(datosOrdenados)}
                        </tbody>
                    </table>`
               dibujarDatos.innerHTML = listTable;
    	}
    	
    	function ordenarPositivos(data){	
    		data.sort(function(a, b) {
    			return a.positive - b.positive;
    		});
			return data;
    	}
    	
 	 	function instanciarDatos(data){
             let dataRow='';
             
             for(let data_element of data){
            	 dataRow+=`
            		<tr class="tr">
	                	 <th scope="row" class="td">${data_element.date}</th>
	                     <td class="td">${data_element.positive}</td>
	                     <td class="td">${data_element.negative}</td>
	                     <td class="td">${data_element.hospitalizedCurrently}</td>
	                     <td class="td">${data_element.totalTestResults}</td>
	                     <td class="td">${data_element.death}</td>
	                </tr>     
                 `;
             }
             return dataRow;
        }
	
    </script>

</head> 

<body class= "body" onload="apiCovid()">
    <main >
        <div  class="conteiner">
            <div class="row">
				<div class="col-12 mt-5">
                   	<h1 class="td">Covid Tracking</h1>
											
                   	<div id ="lista"> </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>