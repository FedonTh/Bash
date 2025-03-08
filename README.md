# Bash
A small look into shell scripting using the BASH language.

## About
This is a relatively small script in BASH, implementing a menu with some funtions, and a demonstration into shell scripting.
Its a programm about the creation and maintenance a business file.
The menu gives the user six options to choose from: 
1. Choose a business file
2. Show business data
3. Change business data
4. Show data
5. Save file
6. Exit

For option [1], the user need to give a filepath to the data file, in this case we are using a csv file for our data named *"Business.csv"*
If the user hasn't chosen a file path for data, the programm will terminate when the user chooses any other option.
Also, if no filename is given at the end of the filepath, the file *"Business.csv"* is added by default at the end of the filepath.
The csv file needs to have the following rows of data: [code], [name], [street], [city], [postal code], [longitude], [latitude].

For option [2], the user fisrtly provides a code of a business. Then, the rest of that businesses data will be displayed.

For option [3], the users provides a business code and the row that needs to be changed, as well as its new value. Then the rows old and new
values are displayed.

For option [4], the programm prints on the screen all the data of all businesses. Using the 'more' command, it stops printing when the screen is full,
waiting for user input to continue printing the data and so on.

For option [5], the programm asks the user for a filepath where the clientele will be saved. If no name is given, its saved automatically at *"business.csv"*.
Currently this option is not implemented yet.

Fro option [6], the programm is terminated.

The nemu is in greek

