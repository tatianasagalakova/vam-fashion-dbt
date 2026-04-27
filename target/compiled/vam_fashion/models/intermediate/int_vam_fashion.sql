-- models/intermediate/int_vam_fashion.sql
WITH staging AS (
    SELECT * FROM "vam_fashion"."main"."stg_vam_fashion"
)

SELECT
    *,
    CASE 
        WHEN date_raw LIKE '%17__%' THEN '18th century'
        WHEN date_raw LIKE '%18__%' THEN '19th century'
        WHEN date_raw LIKE '%19__%' THEN '20th century'
        WHEN date_raw LIKE '%20__%' THEN '21st century'
        ELSE 'Unknown'
    END AS century,
    CASE
            WHEN place ILIKE '%france%' OR place ILIKE '%paris%' OR place ILIKE '%lyon%' OR place ILIKE '%biarritz%' OR place ILIKE '%dieppe%' OR place ILIKE '%marne%' THEN 'France'
            WHEN place ILIKE '%britain%' OR place ILIKE '%england%' OR place ILIKE '%london%' OR place ILIKE '%uk%' OR place ILIKE '%greenwich%' OR place ILIKE '%norwich%' OR place ILIKE '%paisley%' OR place ILIKE '%scotland%' OR place ILIKE '%edinburgh%' OR place ILIKE '%st leonards%' THEN 'Great Britain'
            WHEN place ILIKE '%italy%' OR place ILIKE '%rome%' OR place ILIKE '%venice%' OR place ILIKE '%vicenza%' THEN 'Italy'
            WHEN place ILIKE '%united states%' OR place ILIKE '%new york%' THEN 'USA'
            WHEN place ILIKE '%india%' OR place ILIKE '%gujarat%' OR place ILIKE '%varanasi%' OR place ILIKE '%dhaka%' OR place ILIKE '%deccan%' THEN 'India'
            WHEN place ILIKE '%japan%' THEN 'Japan'
            WHEN place ILIKE '%china%' OR place ILIKE '%guangdong%' OR place ILIKE '%hetian%' THEN 'China'
            WHEN place ILIKE '%iran%' THEN 'Iran'
            WHEN place ILIKE '%spain%' THEN 'Spain'
            WHEN place ILIKE '%mexico%' THEN 'Mexico'
            WHEN place ILIKE '%jamaica%' THEN 'Jamaica'
            WHEN place ILIKE '%nigeria%' THEN 'Nigeria'
            WHEN place ILIKE '%egypt%' THEN 'Egypt'
            WHEN place ILIKE '%portugal%' THEN 'Portugal'
            WHEN place ILIKE '%amsterdam%' THEN 'Netherlands'
            WHEN place ILIKE '%vienna%' THEN 'Austria'
            WHEN place ILIKE '%krak%' THEN 'Poland'
            WHEN place ILIKE '%czech%' THEN 'Czech Republic'
            WHEN place ILIKE '%europe%' THEN 'Europe (general)'
            WHEN place ILIKE '%eastern woodlands%' THEN 'Native America'
            WHEN place ILIKE '%nuremberg%' THEN 'Germany'
            WHEN place ILIKE '%havana%' THEN 'Cuba'
            ELSE COALESCE(place, 'Unknown')
    END AS country_grouped
FROM staging