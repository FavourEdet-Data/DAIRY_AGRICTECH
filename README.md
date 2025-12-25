# DAIRY_AGRICTECH

## Industrial Ag-Tech: 1,000-Cow Dairy Analytics Pipeline
​An End-to-End dbt + Snowflake Analytics Engineering Project

### Project Overview
​Developed a robust Analytics Engineering pipeline to process synthetic data for a 1,000-cow dairy operation. This project mimics real-world sensor data from Danish Ag-Tech firms, focusing on Feed Conversion Ratio (FCR) and biological data validation.
​
### Technical Stack
- ​Warehouse: Snowflake (Multi-database architecture: DAIRY_AGRICTECH.RAW and DAIRY_AGRICTECH.ANALYTICS).
- ​Transformation: dbt (Core + dbt_utils).
- ​Materialization: Incremental facts for high-volume production data and views for lightweight staging.
​- Quality: Custom threshold-based testing (Warn vs. Error) for sensor noise mitigation.
​
### Data Architecture (Medallion)
- ​Bronze: Raw CSV seeds (dim_cows) and production logs.
- ​Silver: Staging views for cleaning and casting.
- ​Gold: Incremental Facts and a final fct_animal_efficiency_stats table for sub-second dashboard performance.

### Contact info
for more collaborations, contact me 
- LinkedIn: https://www.linkedin.com/in/favour-edet-a773b737b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app 

- Email: favouranalyticsai@gmail.com 
