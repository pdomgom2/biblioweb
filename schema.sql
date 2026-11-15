CREATE DATABASE IF NOT EXISTS biblioweb;
USE biblioweb;

-- La fórmula para escribir cualquier columna en SQL es: nombre_columna TIPO_DE_DATO REGLAS_OPCIONALES --

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('lector', 'admin') NOT NULL DEFAULT 'lector',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    genero VARCHAR(80) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    portada_url VARCHAR(255),
    stock_total INT NOT NULL DEFAULT 1,
    stock_disponible INT NOT NULL DEFAULT 1
);

CREATE TABLE prestamos (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion_prevista DATE NOT NULL,
    fecha_devolucion_real DATE NULL, -- Null para permitir que esté vacío hasta el día que lo devuelva
    estado ENUM('activo', 'devuelto', 'atrasado') NOT NULL DEFAULT 'activo' ,

    -- Cómo conectar una tabla con otra: FOREIGN KEY (columna_local) REFERENCES otra_tabla(id)

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (libro_id) REFERENCES libros(id)

);

CREATE TABLE reservas (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'completada', 'cancelada') NOT NULL DEFAULT 'pendiente',

    -- Cómo conectar una tabla con otra: FOREIGN KEY (columna_local) REFERENCES otra_tabla(id)

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (libro_id) REFERENCES libros(id)

);

