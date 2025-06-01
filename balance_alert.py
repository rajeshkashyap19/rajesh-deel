import psycopg2  # Or use your database connector
from datetime import date

def check_balance_alert():
    conn = psycopg2.connect(...)  # Fill in your DB details
    cursor = conn.cursor()
    query = """
        with changes as (
            select
                organization_id,
                date,
                cumulative_balance,
                lag(cumulative_balance) over (partition by organization_id order by date) as prev_balance
            from fct_daily_balances
            where date = current_date - interval '1 day'
        )
        select organization_id, date, cumulative_balance, prev_balance
        from changes
        where prev_balance > 0 and abs(cumulative_balance - prev_balance) / prev_balance > 0.5
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(f"Alert: Org {row[0]} balance changed by >50% on {row[1]}")
    conn.close()

if __name__ == "__main__":
    check_balance_alert()
