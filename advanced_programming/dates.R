# working with dates

Sys.Date()  # returns todays date

today <- Sys.Date()
class(today)  # "Date"

c <- "1990-01-01"
class(c)  # "character"

myDate <- as.Date(c)  # converts because string was in YYYY-MM-DD (standard date form)
class(myDate)  # "Date"

myDate <- as.Date("Nov-06-1990",format='%b-%d-%Y')

# %d - day of the month (decimal number)
# %m - Month (decimal number)
# %b - Month (abbreviated)
# %B - Month (full name)
# %y - Year (two digits)
# %Y - Year (four digits)

# timestamping
strptime("11:02:01", format="%H:%M:%S")  # create time stamp help(strptime)
