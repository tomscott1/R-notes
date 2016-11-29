# logistic regression project
library(dplyr)

df <- read.csv('adult_sal.csv')
print(head(df))

# remove extra index
adult <- select(df, -X)

print(head(adult))
print(str(adult))
print(summary(adult))

# convert to character
adult$type_employer <- as.character(adult$type_employer)

# function takes a list of employee types and a vector of employee types to
# change and what to change them to
fix_emp_type <- function(empType, changeVector, target) {
  ifelse (empType %in% changeVector, target, empType)
}

adult$type_employer <- sapply(adult$type_employer, fix_emp_type, 
                              c('Without-pay','Never-worked'), 'Unemployed')
adult$type_employer <- sapply(adult$type_employer, fix_emp_type, 
                              c('Local-gov','State-gov'), 'SL-gov')
adult$type_employer <- sapply(adult$type_employer, fix_emp_type, 
                              c('Self-emp-inc','Self-emp-not-inc'), 'Self-emp')

# this method also acheives the same result:
# adult$type_employer[adult$type_employer == 'Without-pay'] <- 'Unemployed'
# adult$type_employer[adult$type_employer == 'Never-worked'] <- 'Unemployed'
print(table(adult$type_employer))

# convert to character data type and group - marital status
adult$marital <- as.character(adult$marital)
adult$marital <- sapply(adult$marital, fix_emp_type, 
                        c('Married-AF-spouse', 'Married-spouse-absent', 
                          'Married-civ-spouse'), 'Married')
adult$marital <- sapply(adult$marital, fix_emp_type, 
                        c('Separated', 'Widowed', 
                          'Divorced'), 'Not-Married')

print(table(adult$marital))


# convert to character data type and group - country
adult$country <- as.character(adult$country)
adult$country <- sapply(adult$country, fix_emp_type, 
                        c('Thailand', 'Japan', 'Taiwan', 'Vietnam', 'Cambodia',
                          'Hong', 'Laos', 'Philippines', 'China', 'India',
                          'Iran'), 'Asia')
adult$country <- sapply(adult$country, fix_emp_type, 
                        c('Cuba', 'Guatemala', 'Jamaica', 'Peru', 'Dominican-Republic',
                          'Haiti', 'Mexico', 'South', 'Ecuador', 'Nicaragua',
                          'Columbia', 'El-Salvador', 'Honduras', 'Outlying-US(Guam-USVI-etc)',
                          'Puerto-Rico', 'Trinadad&Tobago'), 'Central and South America')
adult$country <- sapply(adult$country, fix_emp_type, 
                        c('England','Holand-Netherlands', 'Italy', 'France',
                          'Hungary', 'Poland', 'Yugoslavia', 'Germany',
                          'Portugal', 'Greece', 'Ireland', 'Scotland'), 'Europe')
adult$country <- sapply(adult$country, fix_emp_type, 
                        c('Canada','United-States'), 'North America')

print(table(adult$country))