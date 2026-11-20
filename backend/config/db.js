const mysql = require('mysql2');
require('dotenv').config();

// Creamos el Pool de conexiones usando las credenciales ocultas en .env

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Exportamos el pool preparado para usar promesas (async/await)

module.exports = pool.promise();