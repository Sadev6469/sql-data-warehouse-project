CREATE TABLE silver.erp_cust_az12 (
    cid NVARCHAR(50),
    gen NVARCHAR(50),
    bdate DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
)

INSERT INTO silver.erp_cust_az12(
    cid,
    bdate,
    gen
)
SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
    ELSe cid
END cid,
CASE WHEN bdate > GETDATE() THEN NULL
    ELSE bdate
END As bdate,
CASE WHEN UPPER(TRIM(REPLACE(REPLACE(gen, CHAR(13), ''), CHAR(10), ''))) IN ('F','FEMALE') THEN 'Female'
     WHEN UPPER(TRIM(REPLACE(REPLACE(gen, CHAR(13), ''), CHAR(10), ''))) IN ('M', 'MALE')  THEN 'Male'
     ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12;

SELECT * FROM silver.erp_cust_az12;


