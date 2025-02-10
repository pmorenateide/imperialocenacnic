<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserva tu Crucero</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .hero {
            background: url('https://www.travelandtourworld.com/wp-content/uploads/2024/12/cruise-ships1-1.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            background-color: #0056b3;
            padding: 20px;
            font-size: 2rem;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin: 0 auto;
            max-width: 1200px;
        }

        .form-section {
            flex: 1;
            margin: 0 10px;
            background-color: #002E5D;
            color: white;
            padding: 20px;
            border-radius: 5px;
        }

        .form-section h2 {
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .form-section label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: white;
        }

        .form-section select,
        .form-section input {
            width: 85%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            font-size: 0.9rem;
        }

        .form-section select {
            background-color: white;
            color: black;
        }

        .submit-btn {
            display: block;
            width: auto;
            padding: 10px 45px;
            background-color: #0056b3;
            color: white;
            font-size: 0.8rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin: 20px auto;
        }

        .submit-btn:hover {
            background-color: #003d80;
        }

        .separator {
            border: 0;
            height: 5px;
            background-color: #0056b3;
            width: 100%;
            margin: 0;
        }

        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }

            .form-section {
                margin: 10px 0;
            }
        }
    </style>
    
</head>
<body>	
    <div class="hero">
        <h1>Reserva ahora tu crucero</h1>
    </div>

    <!-- Formulario con acción a reserva2.jsp -->
    <form action="hola" method="Get">
        <div class="form-container">
            <div class="form-section">
                <h2>Seleccion de crucero</h2>
                <hr class="separator">
                <label for="destino">Destino*</label>
                <select id="destino" name="destino" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="1400">Roma - 1400$</option>
	                <option value="1700">Atenas - 1700$</option>
	                <option value="3200">Estambul - 3200$</option>
          	    </select>

                <label for="duracion">Duracion del crucero*</label>
                <select id="duracion" name="duracion" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="1">4 dias</option>
	                <option value="1,5">6 dias</option>
	                <option value="2">7 dias</option>
	                <option value="2,5">9 dias</option>
	                <option value="3">12 dias</option>
	                <option value="3,5">15 dias</option>
           		 </select>

                <label for="tipo-camarote">Tipo de camarote*</label>
                <select id="tipo-camarote" name="tipo-camarote" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="400">Suite* - 400$</option>
	                <option value="600">Suite** - 600$</option>
	                <option value="1000">Suite*** - 1000$</option>
           		 </select>

                <label for="pasajeros">Numero de pasajeros*</label>
                <select id="pasajeros" name="pasajeros" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5">5</option>
	                <option value="6">6</option>
	                <option value="7">7</option>
	                <option value="8">8</option>
	                <option value="9">9</option>
	                <option value="10">10</option>
          		  </select>
            </div>

            <div class="form-section">
                <h2>Opciones adicionales</h2>
                <hr class="separator">
                <label for="excursiones">Excursiones</label>
                <select id="excursiones" name="excursiones" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="100">Excursion Cultural - 100$</option>
	                <option value="80">Excursion de Naturaleza - 80$</option>
	                <option value="65">Excursion Relax - 65$</option>
            	</select>
            
                <label for="servicios-extra">Servicios extra</label>
                <select id="servicios-extra" name="servicios-extra" onchange="actualizarPrecio()">
	                <option value="0" selected>SELECCIONA</option>
	                <option value="50">Spa - 50$</option>
	                <option value="50">Sauna - 50$</option>
	                <option value="40">Parques recreativos - 40$</option>
            	</select>
                <label for="Precio">Precio actual:</label>
            <div id="precio-actual">0$</div>
            </div>

            <div class="form-section">
                <h2>Informacion personal</h2>
                <hr class="separator">
                <label for="nombre">Nombre completo*</label>
                <input type="text" id="nombre" name="nombre" onchange="actualizarPrecio()">

                <label for="dni">DNI/Pasaporte*</label>
                <input type="text" id="dni" name="dni" onchange="actualizarPrecio()">

                <label for="fecha-nacimiento">Fecha de nacimiento*</label>
                <input type="date" id="fecha-nacimiento" name="fecha-nacimiento" onchange="actualizarPrecio()">

                <label for="telefono">Numero de telefono*</label>
                <input type="tel" id="telefono" name="telefono" onchange="actualizarPrecio()">
            </div>
        </div>

        <!-- Botón de envío dentro del formulario -->
        <div style="max-width: 1200px; margin: 20px auto;">
            <button class="submit-btn" type="submit">SIGUIENTE</button>
        </div>
    </form>
</body>
</html>
<script>
    function actualizarPrecio() {
        let destino = parseInt(document.getElementById("destino").value) || 0;
        let duracion = parseFloat(document.getElementById("duracion").value) || 0;
        let camarote = parseInt(document.getElementById("tipo-camarote").value) || 0;
        let excursion = parseInt(document.getElementById("excursiones").value) || 0;
        let servicioExtra = parseInt(document.getElementById("servicios-extra").value) || 0;
        let pasajeros = parseFloat(document.getElementById("pasajeros").value) ||0;
    
        let precioTotal = (destino + camarote + excursion + servicioExtra) * duracion * pasajeros;
        document.getElementById("precio-actual").textContent = precioTotal + "$";
    }
    </script>
