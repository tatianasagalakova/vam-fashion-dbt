-- models/marts/mart_fashion_metrics.sql
SELECT
    country_grouped,
    century,
    object_type,
    material,
    COUNT(*) as total_objects,
    COUNT(DISTINCT maker_name) as unique_makers
FROM "vam_fashion"."main"."int_vam_fashion"
GROUP BY 1, 2, 3, 4
ORDER BY total_objects DESC