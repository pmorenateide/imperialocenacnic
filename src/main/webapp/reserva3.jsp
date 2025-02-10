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
            border-radius: 0;
            font-size: 2rem;
        }

        .form-container {
            background-color: #002E5D;
            padding: 20px;
            margin: 0 auto;
            max-width: 600px;
            width: 100%;
            position: relative;
            margin-top: -125px;
            z-index: 1;
        }

        .form-section {
            flex: 1;
            margin: 0;
            background-color: #002E5D;
            color: white;
            padding: 20px;
            border-radius: 0;
        }

            background-color: #002E5D;
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
        }

        .form-section select,
        .form-section input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .separator {
            border: 0;
            height: 5px;
            background-color: #0056b3;
            width: 100%;
            margin: 0;
            display: block;
        }

        .submit-btn {
            width: 15%;
            padding: 20px 10px;
            background-color: #0056b3;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 0;
            cursor: pointer;
            text-align: center;
            margin: 20px auto;
            display: block;
        }

        .submit-btn:hover {
            background-color: #002E5D;
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

    <div class="form-container">
        <div class="form-section">
            <h2>Información personal</h2>
            <hr class="separator">
            <label for="nombre">Información de pago</label>
            <input type="text" id="nombre" name="nombre">

            <label for="dni">Titular*</label>
            <input type="text" id="dni" name="dni">

            <label for="fecha-expiracion">MM/Y*</label>
            <input type="text" id="fecha-expiracion" name="fecha-expiracion" maxlength="5" placeholder="MM/Y">

            <label for="numero-tarjeta">NÚMERO DE TARJETA*</label>
            <input type="tel" id="numero-tarjeta" name="numero-tarjeta" maxlength="16" placeholder="1234567812345678">

            <label for="cvv">CVV*</label>
            <input type="tel" id="cvv" name="cvv" maxlength="3" placeholder="123">
        </div>
    </div>

    <div style="max-width: 1200px; margin: 20px auto; text-align: center;">
<a href="reserva2.jsp" class="submit-btn">Confirmación de Reserva</a>
    </div>

    <script>
        document.getElementById('fecha-expiracion').addEventListener('input', function () {
            let value = this.value.replace(/[^0-9/]/g, '');
            if (value.length > 2 && value.indexOf('/') === -1) {
                value = value.slice(0, 2) + '/' + value.slice(2);
            }
            this.value = value.slice(0, 5);
        });

        document.getElementById('numero-tarjeta').addEventListener('input', function () {
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 16);
        });

        document.getElementById('cvv').addEventListener('input', function () {
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);
        });
    </script>
</body>
</html>
