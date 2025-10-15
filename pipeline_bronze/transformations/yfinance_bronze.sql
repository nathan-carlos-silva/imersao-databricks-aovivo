CREATE OR REFRESH STREAMING LIVE TABLE yfinance
TBLPROPERTIES ( "quality" = "bronze")
AS 
SELECT 
  *
FROM 
cloud_files(
  '/Volumes/lakehouse/raw/yfinance/commodities/latest_prices/',
  'json',
  map(
    -- Ingestão incremental
    -- Se 'false', o DLT vai processar apenas os novos arquivos que chegarem após o pipeline começar.
    'cloudFiles.includeExistingFiles', 'false',
    -- Detecta automaticamente o tipo das colunas, últil com json.
    'cloudFiles.inferColumnTypes', 'true',
    -- Permite adicionar novas colunas automáticamente (Tem também o rescue), caso o json mude no futuro.
    'cloudFiles.schemaEvolutionMode', 'addNewColumns'
  )
);