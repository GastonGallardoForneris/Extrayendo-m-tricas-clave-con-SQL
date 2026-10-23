USE Ventas_Tech_DB;
GO

-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Propósito: reunir las ventas con los datos de clientes, productos y categorías.

SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre,
    p.nombre_producto,
    cat.nombre_categoria,
        c.ciudad,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
    INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria;
    
    
    -- Hallazgo: las 10 ventas tienen cliente, producto y categoría asociados.
-- Esto permite analizar la facturación por ciudad y categoría de producto.


-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: detectar clientes que nunca compraron para que CRM los contacte.

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
    WHERE v.id_venta IS NULL;


    -- Hallazgo: se encontraron 0 clientes sin ventas.
-- CRM no tiene clientes pendientes de una primera compra en esta base.


-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Propósito: identificar artículos sin movimiento para el área de producto.

SELECT
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

-- Hallazgo: se encontraron 0 productos sin ventas.
-- El área de producto no tiene artículos sin movimiento en esta base.


-- Consulta 4: Consolidado por período (UNION ALL)
-- Propósito: comparar la facturación de dos períodos sin excluir ventas.

-- Consulta 4: Consolidado por período (UNION ALL)
-- Propósito: comparar la facturación de dos períodos sin excluir ventas.

SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Antes del 11 de marzo' AS canal
    FROM ventas
    WHERE fecha_venta < '20240311'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Desde el 11 de marzo' AS canal
    FROM ventas
    WHERE fecha_venta >= '20240311'
) AS consolidado
GROUP BY canal;

-- Hallazgo: el período anterior al 11 de marzo facturó 3620,
-- frente a 2824 del segundo período: una diferencia de 796.


