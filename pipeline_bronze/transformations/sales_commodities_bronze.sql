CREATE OR REFRESH STREAMING LIVE TABLE sales_btc 
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT
  *,
  current_timestamp() AS ingestion_ts_utc
FROM STREAM(lakehouse.public.sales_btc);