<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokemon</title>
    <style>
    	.center{
    		background-color: OliveDrab;
    		margin-left: auto;
    		margin-right: auto;
    		text-align:center;
    		font-weight: 900;
    		font-size: 1.3em;
    	}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
        
    	function apiPokemon() {
            axios.get(`https://pokeapi.co/api/v2/pokemon/ditto`)
            .then(function (response) {
              	let map = getData(response.data);
              	drawPokemon(map);  
              	
            })
            .catch(function (error) { 
            	console.log('Error');
            })
        }
     
    	function getData(data){
    		let map = new Map();
    	
    		map.set('Sprites',data.sprites);
    		map.set('Sprites_Other_Home',data.sprites.other.home);
    		map.set('Sprites_Other_Dream_World',data.sprites.other.dream_world);
    		return map;
    	}
    	
    	function drawPokemon(map){
			map.forEach( (value, key, map) => {
				let dibujarPokemon = document.getElementById(`${key}`);  
	    		let tablaPokemon = htmlCreator(value);
	    		dibujarPokemon.innerHTML = tablaPokemon;
				});	
    	}
    	
        function htmlCreator(data){
	 	    let listadoFiltrado = dataTranslator(data);
	        let Table = `
	        	<table class="table">
		        	<thead>
			        	<tr>`
			        	for(let pokemon of listadoFiltrado){
			        		Table+=`<td scope="col" class="center">${pokemon.nombre}</td>`
			        	}
			    		Table+=`</tr>                    	
		        	</thead>
	                <tbody class="center">
	                   ${Imagen(listadoFiltrado)}
	                </tbody>
	             </table>
	              `;
			 return Table;
        }

	     function dataTranslator(data){
           let elementList = [];
           for(let i in data) {
               let pokemon = {
               nombre: '',  
               imagen: ''    
               };
               if(`${data[i]}`.endsWith('png')||`${data[i]}`.endsWith('svg')){
                   pokemon.nombre=`${i}`;
                   pokemon.imagen=`${data[i]}`;
                   elementList.push(pokemon);
               }
           }
           return elementList;
       }  
	     
        function Imagen(listadoFiltrado){
            let imagenRow='';
                imagenRow+=`
                    <tr>`
                        for(let pokemon of listadoFiltrado){
                            imagenRow+=`<td><img src="${pokemon.imagen}"></td>`
                        }
                    imagenRow+=`</tr>
                    `;
            return imagenRow;
        }

        
    </script>

</head> 

<body onload="apiPokemon()">
    <main >
        <div  class="conteiner">
            <div class="row">
				<div class="col-12 mt-5">
					<h1>Pokeapi</h1>
	               	<h4>Sprites:</h4>
	               	<div id ="Sprites" class= "center"> </div>
	               	<h4>Sprites Other Home:</h4>
	               	<div id ="Sprites_Other_Home" class= "center"> </div>
	               	<h4>Sprites Other Dream:</h4>
	               	<div id ="Sprites_Other_Dream_World" class= "center"> </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>