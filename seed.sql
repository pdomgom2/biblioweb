USE biblioweb;

/* 

Cómo insertar datos en columnas de tablas

INSERT INTO nombre_de_la_tabla (columna1, columna2, columna3)
VALUES
('valor1', 'valor2', 'valor3'),
('otro_valor1', 'otro_valor2', 'otro_valor3');

*/

INSERT INTO usuarios (nombre, email, password_hash, rol)
VALUES
('Pablo Domínguez', 'adminprincipal@biblioweb.com', 'hash_admin_123', 'admin'),
('Ángela García', 'angelagl@biblioweb.com', 'hash_lector_123', 'lector');

INSERT INTO libros (titulo, autor, genero, isbn, portada_url, stock_total, stock_disponible)
VALUES
('En el país de la nube blanca', 'Sarah Lark', 'Novela histórica', '978-84-666-4684-0', NULL, 4, 4),
('Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', '978-84-376-0494-7', NULL, 6, 5),
('Un animal salvaje', 'Joël Dicker', 'Thriller', '978-84-204-7719-0', NULL, 5, 3),
('La península de las casas vacías', 'David Uclés', 'Realismo mágico', '978-84-199-4231-9', NULL, 4, 4),
('Tokyo blues', 'Haruki Murakami', 'Ficción contemporánea', '978-84-838-3504-3', NULL, 5, 5),
('El brillo de las luciérnagas', 'Paul Pen', 'Suspense', '978-84-013-5446-5', NULL, 3, 2),
('Amanecer en la cosecha', 'Suzanne Collins', 'Ciencia ficción', '978-84-272-4150-3', NULL, 7, 7),
('El corredor del laberinto', 'James Dashner', 'Ciencia ficción', '978-84-993-2236-0', NULL, 4, 4),
('Heartstopper', 'Alice Oseman', 'Romance', '978-84-082-3228-5', NULL, 6, 6),
('Un tal Paul Darrigrand', 'Philippe Besson', 'Novela contemporánea', '978-84-195-8214-0', NULL, 2, 2),
('Metafísica de los tubos', 'Amélie Nothomb', 'Autobiografía', '978-84-339-6968-2', NULL, 3, 3),
('Cosamala', 'Alana S. Portero', 'Novela gótica', '978-84-120-8451-1', NULL, 3, 0),
('La sombra del viento', 'Carlos Ruiz Zafón', 'Novela contemporánea', '978-84-081-6343-5', NULL, 5, 4);