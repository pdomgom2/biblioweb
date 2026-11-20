const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/db');

// 1. REGISTRO DE USUARIO
const registrarUsuario = async (req, res) => {
    const { nombre, email, password } = req.body;

    // Validación básica de entrada
    if (!nombre || !email || !password) {
        return res.status(400).json({ error: 'Todos los campos (nombre, email, password) son obligatorios.' });
    }

    try {
        // Comprobamos si el correo ya está registrado
        const [usuariosExistentes] = await db.query('SELECT id FROM usuarios WHERE email = ?', [email]);
        if (usuariosExistentes.length > 0) {
            return res.status(409).json({ error: 'Ese correo electrónico ya está registrado.' });
        }

        // Encriptamos (hasheamos) la contraseña con 10 rondas de sal
        const saltRounds = 10;
        const passwordHash = await bcrypt.hash(password, saltRounds);

        // Guardamos el usuario en MySQL (rol 'lector' por defecto)
        const [resultado] = await db.query(
            'INSERT INTO usuarios (nombre, email, password_hash, rol) VALUES (?, ?, ?, ?)',
            [nombre, email, passwordHash, 'lector']
        );

        res.status(201).json({
            mensaje: 'Usuario registrado correctamente.',
            usuario: {
                id: resultado.insertId,
                nombre,
                email,
                rol: 'lector'
            }
        });
    } catch (error) {
        res.status(500).json({ error: 'Error interno al registrar el usuario.', detalle: error.message });
    }
};

module.exports = { registrarUsuario };

/*

En los signos de interrogación ? dentro de db.query('... WHERE email = ?', [email]),
nunca concatenamos variables directamente en un string SQL (... WHERE email = '${email}') 
porque abriríamos la puerta a ataques de Inyección SQL. Los signos ? le dicen a mysql2 
que trate el dato estrictamente como texto inofensivo.

*/