INSERT INTO silver.erp_px_cat_g1v2 (
    id,
    cat,
    subcat,
    maintenance
)
SELECT
id,
cat,
subcat,
CASE WHEN UPPER(TRIM(REPLACE(REPLACE(maintenance, CHAR(13), ''), CHAR(10), ''))) = 'Yes'       THEN 'Yes'
     WHEN UPPER(TRIM(REPLACE(REPLACE(maintenance, CHAR(13), ''), CHAR(10), ''))) = 'No'         THEN 'No'
     ELSE 'n/a'
END AS maintenance
FROM bronze.erp_px_cat_g1v2;

SELECT * FROM silver.erp_px_cat_g1v2;

