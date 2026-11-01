
# RetailPro — Proyecto de Análisis de Datos

## Descripción del proyecto
RetailPro es un proyecto de análisis de datos orientado al estudio de ventas, clientes, productos y categorías.

El objetivo es transformar los registros de ventas en información útil para la toma de decisiones comerciales.

## Herramientas utilizadas
- SQL Server y SQL Server Management Studio (SSMS).
- Power BI y Power Query.
- DAX para la creación de medidas.
- GitHub para documentación y control de versiones.
- ChatGPT como asistente para la revisión y documentación del proyecto.

## Base de datos
Se utiliza la base Ventas_Tech_DB, compuesta por las siguientes tablas:
- clientes
- productos
- categorias
- ventas

## Análisis realizados
- Resumen ejecutivo mensual de facturación.
- Ranking de productos por ventas.
- Consultas SQL con funciones de agregación.
- Relaciones entre tablas mediante INNER JOIN.
- Preparación de datos para análisis en Power BI.

## Cómo ejecutar los scripts SQL
1. Abrir SQL Server Management Studio.
2. Conectarse a una instancia de SQL Server.
3. Verificar que la base Ventas_Tech_DB esté creada y contenga las tablas clientes, productos, categorias y ventas. Si no existe, ejecutar primero el script de creación y carga de datos.
4. Abrir el archivo SQL correspondiente.
5. Ejecutar las consultas con F5.
6. Revisar los resultados y verificar que no existan errores.

## Validación de resultados
Los resultados de las consultas SQL se validaron mediante su ejecución en SQL Server Management Studio (SSMS). Se comprobó que el resumen mensual de marzo presenta una facturación de $6.444,
correspondiente a 10 operaciones, con un ticket promedio de $644,40. Estos resultados corresponden al conjunto de datos utilizado en el proyecto y no deben interpretarse como tendencias
generales del negocio.

## Uso responsable de inteligencia artificial
Se utilizó ChatGPT como herramienta de apoyo para documentar el proyecto RetailPro, revisar consultas SQL e identificar hallazgos comerciales a partir de los resultados obtenidos.

Las recomendaciones generadas por IA fueron evaluadas críticamente. Se verificaron los resultados numéricos mediante consultas ejecutadas en SQL Server Management Studio (SSMS), diferenciando los hechos respaldados por datos de las interpretaciones que requieren información adicional.

La responsabilidad sobre la calidad del análisis, la validación de resultados y las conclusiones finales corresponde al analista.
