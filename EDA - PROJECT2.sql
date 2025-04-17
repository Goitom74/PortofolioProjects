-- EXPLORATORY DATA ANALYSIS (EDA)

select *
FROM layoffs_staging2;

select min(`date`), max(`date`)
from layoffs_staging2;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select substring(`date`,6,2) as `month`, sum(total_laid_off)
from layoffs_staging2
group by `month`;

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 ASC;

with rolling_total AS
(select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 ASC
)
select `month`, total_off, sum(total_off) over(order by `month`) as rolling_total
from rolling_total; 

