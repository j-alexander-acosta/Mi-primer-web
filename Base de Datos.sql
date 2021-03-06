SELECT titulo AS encabezado, fecha_publicacion AS publicado_en, estatus AS estado
FROM posts;

SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id;

SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id;
    
SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

SELECT *
FROM usuarios
	INNER JOIN posts ON usuarios.id = posts.usuario_id;
    
SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
UNION    
SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id;
    
SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL
UNION    
SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

SELECT *
FROM posts
WHERE estatus = 'inactivo';

SELECT *
FROM posts
WHERE titulo LIKE '%escandalo%';

SELECT *
FROM posts
WHERE titulo LIKE '%escandalo';

SELECT *
FROM posts
WHERE titulo LIKE 'escandalo%';

SELECT *
FROM posts
WHERE titulo LIKE '%roja';

SELECT *
FROM posts
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31';

SELECT *
FROM posts
WHERE fecha_publicacion > '2025-01-01';



SELECT *
FROM posts
WHERE id BETWEEN 50 AND 60;

SELECT *
FROM posts 
WHERE YEAR(fecha_publicacion)BETWEEN '2023' AND '2024';

SELECT *
FROM posts 
WHERE MONTH(fecha_publicacion) = 04;

SELECT *
FROM posts
WHERE usuario_id IS NULL;

SELECT *
FROM posts
WHERE usuario_id IS NOT NULL;

SELECT *
FROM posts
WHERE usuario_id IS NULL
	AND estatus = 'activo';
    
SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo';

SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo'
    AND id < 50;

SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo'
    AND id < 50
    AND categoria_id = 2;
    
SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo'
    AND id < 50
    AND categoria_id = 2
    AND YEAR(fecha_publicacion) = 2025;
    
SELECT estatus, COUNT(*) post_quantity
FROM posts
GROUP BY estatus; 

SELECT YEAR(fecha_publicacion) AS post_year, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_year; 

SELECT MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_month; 

SELECT estatus, MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month; 

SELECT *
FROM posts
;

SELECT *
FROM posts
ORDER BY fecha_publicacion ASC;

SELECT *
FROM posts
ORDER BY fecha_publicacion DESC;

SELECT *
FROM posts
ORDER BY titulo ASC;

SELECT *
FROM posts
ORDER BY titulo DESC;

SELECT *
FROM posts
ORDER BY usuario_id ASC;

SELECT *
FROM posts
ORDER BY usuario_id DESC;

SELECT *
FROM posts
ORDER BY fecha_publicacion ASC
LIMIT 5;

SELECT *
FROM posts
ORDER BY fecha_publicacion DESC
LIMIT 5;

SELECT MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS post_quantuty
FROM posts
GROUP BY estatus, post_month
ORDER BY post_month;

SELECT MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month
HAVING post_quantity > 1
ORDER BY post_month;

SELECT new_table_projection.date, COUNT(*) AS posts_count
FROM(
	SELECT DATE(MIN(fecha_publicacion)) AS date, YEAR(fecha_publicacion)AS post_year
	FROM posts
	GROUP BY post_year
) AS new_table_projection
GROUP BY new_table_projection.date
ORDER BY new_table_projection.date;

SELECT *
FROM posts
WHERE fecha_publicacion = (
	SELECT MAX(fecha_publicacion)
    FROM posts
);

SELECT posts.titulo, COUNT(*) num_etiquetas
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id
ORDER BY num_etiquetas DESC;

SELECT posts.titulo, GROUP_CONCAT(nombre_etiqueta)
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id;

SELECT *
FROM etiquetas
	LEFT JOIN posts_etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
WHERE posts_etiquetas.etiqueta_id IS NULL;

SELECT c.nombre_categoria, COUNT(*) AS cant_posts
FROM categorias AS c
	INNER JOIN posts AS p ON c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC
LIMIT 1;

SELECT u.nickname, COUNT(*) cant_posts
FROM usuarios AS u
	INNER JOIN posts AS p ON u.id = p.usuario_id
GROUP BY u.id
ORDER BY cant_posts DESC;

SELECT u.nickname, COUNT(*) cant_posts, GROUP_CONCAT(nombre_categoria)
FROM usuarios AS u
	INNER JOIN posts AS p ON u.id = p.usuario_id
    INNER JOIN categorias c ON c.id = p.categoria_id
GROUP BY u.id
ORDER BY cant_posts DESC;

SELECT *
FROM usuarios AS u
	LEFT JOIN posts ON u.id = posts.usuario_id
WHERE posts.usuario_id IS NULL
;