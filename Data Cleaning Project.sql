-- Data Cleaning Project

SELECT *
FROM layoffs
;

-- TO DO LIST
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. Remove Any Column

-- 1. Remove Duplicates
CREATE TABLE layoffs_staging
LIKE layoffs
;

INSERT layoffs_staging
SELECT *
FROM layoffs
;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`
) row_num
FROM layoffs_staging
;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;

SELECT *
FROM layoffs_staging
WHERE company = 'Casper'
;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE row_num > 1
;

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

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
FROM layoffs_staging;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2
;

-- 2. Standardizing Data
SELECT company, TRIM(company)
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET company = TRIM(company)
;

SELECT DISTINCT industry
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;

SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United %'
;