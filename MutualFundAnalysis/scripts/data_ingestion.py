import pandas as pd

# File paths
fund_master_path = r"C:\Users\malat\OneDrive\Desktop\MutualFundAnalysis\data\raw\01_fund_master.csv"
nav_history_path = r"C:\Users\malat\OneDrive\Desktop\MutualFundAnalysis\data\raw\02_nav_history.csv"

# Load datasets
fund_master = pd.read_csv(fund_master_path)
nav_history = pd.read_csv(nav_history_path)

# Basic Information
print("Fund Master Shape:", fund_master.shape)
print("NAV History Shape:", nav_history.shape)

print("\nFund Master Columns:")
print(fund_master.columns)

print("\nNAV History Columns:")
print(nav_history.columns)

# Missing Values
print("\nMissing Values - Fund Master")
print(fund_master.isnull().sum())

print("\nMissing Values - NAV History")
print(nav_history.isnull().sum())

# Duplicate Records
print("\nFund Master Duplicates:", fund_master.duplicated().sum())
print("NAV History Duplicates:", nav_history.duplicated().sum())

# AMFI Validation
master_codes = set(fund_master["amfi_code"])
nav_codes = set(nav_history["amfi_code"])

missing_codes = master_codes - nav_codes

print("\nMissing AMFI Codes:", len(missing_codes))

if len(missing_codes) == 0:
    print("All AMFI codes are present in NAV history.")
else:
    print(missing_codes)
