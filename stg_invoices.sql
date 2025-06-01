with invoices as (
    select *
    from {{ source('raw', 'invoices') }}
),

cleaned as (
SELECT 
/*convert the column formats to appropriate ones as there are inconsistencies noted in values*/
    CAST(invoice_id AS BIGINT) AS invoice_id,
    CAST(parent_invoice_id AS BIGINT) AS parent_invoice_id,
    CAST(transaction_id AS BIGINT) AS transaction_id,
    CAST(organization_id AS BIGINT) AS organization_id,
    type,
    status,
    currency,
    payment_currency,
    payment_method,
    amount,
    payment_amount,
    fx_rate,
    fx_rate_payment
FROM invoices
)

SELECT * FROM cleaned
