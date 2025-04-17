-- Data cleaning project 1 includes
-- 1. remove duplicates
-- 2. standardized the data
-- 3. manage null or blank values
-- 4. remove any columns

select*
from layoffs;

-- to preserve the raw data, work on a copy of the raw data

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;


-- REMOVE ANY DUPLICATES
select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
from layoffs_staging;

With duplicate_cte AS
(
select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
from layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

With duplicate_cte AS
(
select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
from layoffs_staging
)


DELETE
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2;

insert into layoffs_staging2
select *, 
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
from layoffs_staging;

select *
from layoffs_staging2
where row_num > 1;

insert into layoffs_staging2
select *, 
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
from layoffs_staging;


select *
FROM layoffs_staging2
where row_num > 1;

delete
FROM layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;

-- STANDARDIZING DATA

select company, TRIM(company)
from layoffs_staging2;

update layoffs_staging2
set company = TRIM(company);

select distinct industry
from layoffs_staging2
order by 1;


select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united states%';

select `date`
from layoffs_staging2;

select `date`,
str_to_date(`date`, '%m/%d/%Y') 
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');  

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2;


-- Handling NULL or BLANK values

select *
from layoffs_staging2
where total_laid_off is NULL
AND percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2;

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company = 'Airbnb';

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
AND t2.industry is not null;


update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoffs_staging2;


-- REMOVE COLUMNS AND ROWS

select *
from layoffs_staging2
where total_laid_off is NULL
AND percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is NULL
AND percentage_laid_off is null;

select *
from layoffs_staging2;



alter table layoffs_staging2
drop column row_num;