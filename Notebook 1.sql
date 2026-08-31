
-- Grid View
select * from bank_loan_data;










-- Total Loan Applications
select 
	count(id) as Total_Loan_Applications 
from 
	bank_loan_data;



-- Total Loan Applications for Month-to-Date (MTD) i.e. current month
select 
	count(id) as MTD_Total_Loan_Applications 
from 
	bank_loan_data
where
	month(issue_date) = 12 and year(issue_date) = 2021;



-- Total Loan Applications for Month-over-Month (MoM)  = (MTD - PMTD)/ PMTD

-- For this we have to calculate Total Loan Applications for Previous Month-to-Date (PMTD)
select 
	count(id) as PMTD_Total_Loan_Applications 
from 
	bank_loan_data
where
	month(issue_date) = 11 and year(issue_date) = 2021;
	










-- Total Funded Amount
select
	sum(loan_amount) as Total_Funded_Amount
from
	bank_loan_data ;



-- Total Funded Amount for Month-to-Date (MTD) i.e. current month
select 
	sum(loan_amount) as MTD_Total_Funded_Amount 
from 
	bank_loan_data
where
	month(issue_date) = 12 and year(issue_date) = 2021;



-- Total Funded Amount for Month-over-Month (MoM)  = (MTD - PMTD)/ PMTD

-- For this we have to calculate Total Funded Amount for Previous Month-to-Date (PMTD)
select 
	sum(loan_amount) as PMTD_Total_Funded_Amount  
from 
	bank_loan_data
where
	month(issue_date) = 11 and year(issue_date) = 2021;











-- Total Amount Received
select
	sum(total_payment) as Total_Amount_Received
from
	bank_loan_data ;



-- Total Amount Received for Month-to-Date (MTD) i.e. current month
select 
	sum(total_payment) as MTD_Total_Amount_Received
from 
	bank_loan_data
where
	month(issue_date) = 12 and year(issue_date) = 2021;



-- Total Amount Received for Month-over-Month (MoM)  = (MTD - PMTD)/ PMTD

-- For this we have to calculate Total Amount Received for Previous Month-to-Date (PMTD)
select 
	sum(total_payment) as PMTD_Total_Amount_Received 
from 
	bank_loan_data
where
	month(issue_date) = 11 and year(issue_date) = 2021;










	-- Average Interest Rate
select
	round(avg(int_rate),4) * 100 as Average_Interest_Rate
from
	bank_loan_data ;



-- Average Interest Rate for Month-to-Date (MTD) i.e. current month
select 
	round(avg(int_rate),4) * 100 as MTD_Average_Interest_Rate
from 
	bank_loan_data
where
	month(issue_date) = 12 and year(issue_date) = 2021;



-- Average Interest Rate for Month-over-Month (MoM)  = (MTD - PMTD)/ PMTD

-- For this we have to calculate Average Interest Rate for Previous Month-to-Date (PMTD)
select 
	round(avg(int_rate),4) * 100 as PMTD_Average_Interest_Rate
from 
	bank_loan_data
where
	month(issue_date) = 11 and year(issue_date) = 2021;










	-- Average Debt-to-Income Ratio (DTI) 
select
	round(avg(dti),4) * 100 as Average_DTI
from
	bank_loan_data ;



-- Average Debt-to-Income Ratio (DTI) for Month-to-Date (MTD) i.e. current month
select 
	round(avg(dti),4) * 100 as MTD_Average_DTI
from 
	bank_loan_data
where
	month(issue_date) = 12 and year(issue_date) = 2021;



-- Average Debt-to-Income Ratio (DTI) for Month-over-Month (MoM)  = (MTD - PMTD)/ PMTD

-- For this we have to calculate Average Debt-to-Income Ratio (DTI) for Previous Month-to-Date (PMTD)
select 
	round(avg(dti),4) * 100 as PMTD_Average_DTI
from 
	bank_loan_data
where
	month(issue_date) = 11 and year(issue_date) = 2021;











-- Good Loan Application Percentage
select
	(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100.0 ) / count(id) as Good_Loan_Percentage
from
	bank_loan_data ;



-- Good Loan Applications
select
	count(id) as Good_Loan_Applications
from
	bank_loan_data 
where
	loan_status = 'Fully Paid' or loan_status = 'Current';



-- Good Loan Funded Amount
select
	sum(loan_amount) as Good_Loan_Funded_Amount
from
	bank_loan_data 
where
	loan_status = 'Fully Paid' or loan_status = 'Current';



-- Good Loan Received Amount
select
	sum(total_payment) as Good_Loan_Received_Amount
from
	bank_loan_data 
where
	loan_status = 'Fully Paid' or loan_status = 'Current';











-- Bad Loan Application Percentage
select
	(count(case when loan_status = 'Charged Off' then id end) * 100.0 ) / count(id) as Bad_Loan_Percentage
from
	bank_loan_data ;



-- Bad Loan Applications
select
	count(id) as Bad_Loan_Applications
from
	bank_loan_data 
where
	loan_status = 'Charged Off';



-- Bad Loan Funded Amount
select
	sum(loan_amount) as Bad_Loan_Funded_Amount
from
	bank_loan_data 
where
	loan_status = 'Charged Off';



-- Bad Loan Received Amount
select
	sum(total_payment) as Bad_Loan_Received_Amount
from
	bank_loan_data 
where
	loan_status = 'Charged Off';













-- Loan Status Grid View
select
	loan_status,
	count(id) as Total_Loan_Applications,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate * 100) as Interest_Rate,
	avg(dti * 100) as DTI
from
	bank_loan_data
group by
	loan_status ;




-- Loan Status Grid View for Month-to-Date (MTD) i.e. current month
select
	loan_status,
	sum(total_payment) as MTD_Total_Amount_Received,
	sum(loan_amount) as MTD_Total_Funded_Amount
from
	bank_loan_data
where
	month(issue_date) = 12  and year(issue_date) = 2021
group by
	loan_status ;









-- Monthly Trends by Issue Date 
select
	month(issue_date) as Month_Number,
	datename(month,issue_date) as Month_Name,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	month(issue_date),
	datename(month,issue_date)
order by
	month(issue_date);



-- Regional Analysis by State 
select
	address_state,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	address_state
order by
	address_state;



-- Loan Term Analysis 
select
	term,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	term
order by
	term;



-- Employee Length Analysis 
select
	emp_length,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	emp_length
order by
	emp_length;



-- Loan Purpose Breakdown 
select
	purpose,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	purpose
order by
	purpose;



-- Home Ownership Analysis 
select
	home_ownership,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from
	bank_loan_data
group by
	home_ownership
order by
	home_ownership;