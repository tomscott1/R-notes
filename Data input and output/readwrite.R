# install.packages('readxl')
# install.packages('xlsx')
# ^ required to install package
library(readxl)  # import readxl library
library(xlsx)
excel_sheets('Sample-Sales-Data.xlsx') 
df <- read_excel('Sample-Sales-Data.xlsx', sheet = 'Sheet1')
print(head(df))
print(sum(df$Value))
print(summary(df))

# read entire workbook

entireWorkbook <- lapply(excel_sheets('Sample-Sales-Data.xlsx'),read_excel,
                        path='Sample-Sales-Data.xlsx')

# write to xlsx

write.xlsx(mtcars, "output_ex.xlsx")
