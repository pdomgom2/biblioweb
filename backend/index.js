const express = require('express');
require('dotenv').config();
const db = require('./config/db'); // Importamos nuestra conexión a MySQL

const app = express();

// Middleware global: permite que Express entienda los JSON que envían los usuarios
app.use(express.json());

// Ruta de prueba para comprobar que el servidor y MySQL se hablan
app.get('/', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT COUNT(*) AS total_libros FROM libros');
        res.json({
            mensaje: '¡API de Biblioweb funcionando y conectada a MySQL!',
            libros_en_catalogo: rows[0].total_libros
        });
    } catch (error) {
        res.status(500).json({ error: 'Error al conectar con la base de datos', detalle: error.message });
    }
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});