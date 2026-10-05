-- Consulta 1 --

SELECT 
MONTH (fecha_venta) AS mes,
SUM ( cantidad * precio_unitario) AS total_facturado,
COUNT (id_venta) AS cantidad_pedidos,
AVG (cantidad * precio_unitario) AS ticket_promedio

FROM ventas

GROUP BY MONTH(fecha_venta);

-- Consulta 2 --

SELECT 
TOP 5 (id_producto),
SUM (cantidad) AS unidades_vendidas,
SUM (cantidad * precio_unitario) AS total_facturado

FROM ventas

GROUP BY (id_producto)
ORDER BY (total_facturado) DESC

-- Consulta 3 --

SELECT
id_cliente,
COUNT (id_venta) AS cantidad_pedidos,
SUM (cantidad * precio_unitario) AS total_gastado

FROM ventas

GROUP BY id_cliente
HAVING COUNT(*) > 1

-- Consulta 4 --

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) >= 150000 THEN 'Por encima'
        ELSE 'Por debajo'
    END AS rendimiento_mensual
FROM ventas
GROUP BY MONTH(fecha_venta);

-- BLOQUE DE CIERRE: Hallazgos de negocio -- 
/*
HALLAZGOS DEL ANÁLISIS:

1. Concentración de ventas: Los 5 productos con mayor facturación representan el motor principal del negocio, por lo que es prioritario asegurar su stock constante.
2. Fidelización de clientes: Se identificó un grupo de clientes recurrentes con más de una compra; se recomienda lanzar campañas de fidelización sobre este segmento para aumentar su consumo.
3. Control de rendimiento mensual: La clasificación de meses por encima y por debajo de la meta permite identificar la estacionalidad del negocio y planificar promociones en los meses de menor venta.
*/