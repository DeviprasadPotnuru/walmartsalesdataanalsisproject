# Walmart Sales Analysis Project

## Overview
This repository contains a comprehensive Walmart sales data analysis project aimed at extracting key business insights from transactional data. The analysis includes data cleaning, exploratory data analysis, and SQL queries designed to address several business problems related to sales performance, customer behavior, and product profitability.

## Project Structure
- `project.ipynb`  
  A Jupyter notebook that includes Python code for loading, cleaning, and performing an initial exploration of the Walmart sales dataset using Pandas and SQL Alchemy.

- `Walmart.csv`  
  The original raw Walmart sales dataset containing transactional records including invoice, branch, city, category, product pricing, quantity, date/time, payment method, product rating, and profit margin.

- `walmart_cleaned.csv`  
  The cleaned and preprocessed version of the Walmart dataset, with numeric and date/time fields converted for analysis readiness and additional computed fields such as 'total' (product of unit price and quantity).

- `query_for_s1l.sql`  
  A set of structured SQL queries written to explore the dataset in a relational database environment, solving business problems such as transaction counts by payment method, highest-rated category per branch, busiest sales days, and profitability analysis.

- `requirements.txt`  
  The required Python libraries for running the project code:
  - Pandas
  - MySQL Connector/Python (mysqlclient/pymysql)
  - SQLAlchemy

## Getting Started

### Prerequisites
- Python 3.7 or higher
- MySQL Server (or compatible SQL database) for executing SQL queries
- Jupyter Notebook or Jupyter Lab

### Installation
1. Clone the repository: git clone <repository-url>
cd <repository-folder>

2. Create a virtual environment (recommended) and install Python dependencies:
python -m venv venv
source venv/bin/activate # On Windows use venv\Scripts\activate
pip install -r requirements.txt


3. Load the datasets (`Walmart.csv` or `walmart_cleaned.csv`) and open the Jupyter notebook (`project.ipynb`) to explore the analysis workflow.

4. To run SQL queries, set up a database and import the Walmart data into a table (e.g., `walmart_db.walmart`) according to your database setup.

### Project Highlights
- Data loading and verification using Pandas.
- Data cleaning and preprocessing for proper analysis.
- Calculation of metrics such as total sales revenue and profit margins.
- Extensive SQL queries showcasing aggregation, ranking, and window functions to extract business-relevant analytics.
- Categorization of sales by time (morning, afternoon, evening) and branch-specific performance insights.

## Usage
- Use the notebook to reproduce the data cleaning and analysis workflow.
- Modify and execute SQL queries in your preferred MySQL client to explore advanced analytics.
- Adapt the code and queries to similar retail datasets for comparative analysis or extended insights.

## Contributing
Contributions and suggestions are welcome. Please open issues or submit pull requests for improvements, enhancements, or bug fixes.

## License
This project is licensed under the MIT License - see the LICENSE file for details.




