with invoices as (
    select 
        organization_id,
        invoice_date::date as date,
        sum(amount) as daily_amount
    from {{ ref('stg_invoices') }}
    group by 1, 2
),
fact as (
    select
        organization_id,
        date,
        sum(daily_amount) over (partition by organization_id order by date rows between unbounded preceding and current row) as cumulative_balance
    from invoices
)
select * from fact
