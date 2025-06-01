This project implements a simple data system to alert an operational team when a customer’s financial balance changes by more than 50% from one day to the next. 
The system was built with simplicity, reliability, and efficiency in mind, using dbt for modeling and a lightweight Python script for alerts.

**Project Structure is below**
```deel_data_alerts/
├── data/
│   ├── Organizations.csv
│   └── Invoices.csv
├── models/
│   ├── staging/
│   │   ├── stg_organizations.sql
│   │   └── stg_invoices.sql
│   ├── marts/
│   │   ├── dim_organizations.sql
│   │   └── fct_daily_balances.sql
│   └── schema.yml
├── alert_balance_change.py
├── README.md
└── dbt_project.yml```
