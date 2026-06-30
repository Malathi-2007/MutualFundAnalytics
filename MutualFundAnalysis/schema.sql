"""DESIGN SQLITE STAR SCHEMA"""

CREATE TABLE dim_fund (
    fund_id INTEGER PRIMARY KEY,
    amfi_code TEXT UNIQUE,
    fund_name TEXT, 
    category TEXT 
);

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    day INTEGER
);

CREATE TABLE fact_nav (
    nav_id INTEGER PRIMARY KEY,
    fund_id INTEGER,
    date_id INTEGER, 
    nav REAL,
    FOREIGN KEY (fund_id)
        REFERENCES dim_fund(fund_id),
    FOREIGN KEY (date_id)
        REFERENCES dim_date(date_id)
);

