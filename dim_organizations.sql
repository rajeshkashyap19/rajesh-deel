with orgs as (
    select *
    from {{ source('raw', 'organizations') }}
),
enriched as (
    select 
        organization_id,
        organization_name,
        (select count(*) from {{ ref('stg_invoices') }} i where i.organization_id = o.organization_id) as invoice_count,
        (select sum(amount) from {{ ref('stg_invoices') }} i where i.organization_id = o.organization_id) as total_invoiced
    from orgs o
)
select * from enriched
