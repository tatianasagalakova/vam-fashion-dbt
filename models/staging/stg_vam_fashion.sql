-- models/staging/stg_vam_fashion.sql
SELECT
    accessionNumber AS accession_number,
    accessionYear AS accession_year,
    systemNumber AS system_number,
    objectType AS object_type,
    _primaryTitle AS title,
    _primaryPlace AS place,
    _primaryMaker__name AS maker_name,
    _primaryMaker__association AS maker_association,
    _primaryDate AS date_raw,
    _sampleMaterial AS material,
    _sampleTechnique AS technique,
    _sampleStyle AS style,
    _currentLocation__displayName AS current_location
FROM {{ ref('vam_fashion') }} 
WHERE accessionNumber IS NOT NULL