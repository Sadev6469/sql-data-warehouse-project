INSERT INTO silver.erp_loc_a101(
    cid,
    cntry
)
SELECT 
REPLACE(cid, '-','') AS cid,
CASE WHEN UPPER(TRIM(REPLACE(REPLACE(cntry, CHAR(13), ''), CHAR(10), ''))) IN ('AU', 'AUSTRALIA')       THEN 'Australia'
        WHEN UPPER(TRIM(REPLACE(REPLACE(cntry, CHAR(13), ''), CHAR(10), ''))) IN ('DE', 'GERMANY')         THEN 'Germany'
        WHEN UPPER(TRIM(REPLACE(REPLACE(cntry, CHAR(13), ''), CHAR(10), ''))) IN ('US', 'USA', 'UNITED STATES') THEN 'United States'
        WHEN UPPER(TRIM(REPLACE(REPLACE(cntry, CHAR(13), ''), CHAR(10), ''))) IN ('UK', 'UNITED KINGDOM')  THEN 'United Kingdom'
        WHEN UPPER(TRIM(REPLACE(REPLACE(cntry, CHAR(13), ''), CHAR(10), ''))) = ''                         THEN 'n/a'
        ELSE 'n/a'
END AS cntry
FROM bronze.erp_loc_a101;

