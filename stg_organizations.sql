with orgs as (
    select *
    from {{ source('raw', 'organizations') }}
),

cleaned as (
SELECT 
/*convert the column formats to appropriate ones as there are inconsistencies noted in values*/
    CAST(organization_id AS BIGINT) AS organization_id,
    CAST(first_payment_date as DATE) AS first_payment_date,
    CAST(last_payment_date as DATE) AS last_payment_date,
    CAST(legal_entity_country_code AS STRING) AS legal_entity_country_code,
    CAST(created_date AS DATETIME) AS created_date
FROM {{ source('your_source', 'organizations') }}
)

SELECT * FROM cleaned
