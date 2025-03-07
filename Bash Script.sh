#!/bin/bash

#Setting default value for the file name
default="Businesses.csv"


while true; do

    #Printing the menu
    echo "Menu:"
    echo "[1] Read a Csv file"
    echo "[2] Show company details"
    echo "[3] Change a company's data"
    echo "[4] Show Csv file data"
    echo "[5] Save file (not funtional)"
    echo "[6] Exit"

    #Waiting for user input
    read -p "Enter your choice (1-6): " choice

    #Case statement depending on the users choice 
    case $choice in
        1)
            #Asking for a path to the Csv file
            echo "Enter the path to the CSV file:"
            read csv_path

            #If path doesn't end with a .csv, default to "Businesses.csv"
            if [ "${csv_path##*.}" = "csv" ]; then

                csv_path_final="$csv_path"
            
            else

                csv_path_final="$csv_path$default"

            fi

            echo "$csv_path_final"
            
            #Checks if the file exists and if it ends with '.csv'
            if [ -f "$csv_path_final" ] && [ "${csv_path_final##*.}" = "csv" ]; then
           
              echo "Csv file found at: $csv_path_final"

            else

               echo "Error: The selected file is either not found or is not a .csv file"

            fi
            ;;
        2)
            #Check if the path is empty and break out of the loop if true
            if [ -z "$csv_path_final" ]; then
          
              echo "Error: No file has been given"
            
            else
  
            #Asking user for company code to search for
            echo "Enter company code:"
            read company_code

            #Searching the csv file for a company using awk
            awk -F ',' -v search="$company_code" '$1 == search { print "Company found: " $0; found=1; exit }  END { if (found == 0) print "No company found" }' "$csv_path_final"
            fi
            ;;
        3)

            #Check if the path is empty and break out of the loop if true
             if [ -z "$csv_path_final" ]; then
          
              echo "Error: No file has been given"
            
            else

            #Asking user for company code to search for
            echo "Enter company code:"
            read company_code

            #Selecting a row with the same company code using awk
            selected_row=$(awk -F ',' -v search="$company_code" '$1 == search { print $0; exit }' "$csv_path_final")
    
            #Check if a matching row was found
            if [ -n "$selected_row" ]; then
              echo "Selected company: $selected_row"
 
              #Ask for value to change
              echo "Enter the value's number of column to change (1-7):"
              read value_picked
 
              #Ask for the new data for the value
              echo "Enter new data for value $value_picked:"
              read new_value
     
              #Update the selected row with the new value in the specified column
              updated_row=$(awk -v col="$value_picked" -v val="$new_value" -v OFS=',' '{$col=val; print}' <<< "$selected_row")
     
              #Print the updated row
              echo "New company info: $updated_row"
      
              #Print the old and new values in the changed column
              old_value=$(echo "$selected_row" | cut -d',' -f$value_picked)
              echo "Old data $value_picked: $old_value"
              echo "New data $value_picked: $new_value"
 
            else

               echo "No matching company found"

             fi

            fi
            ;;
        4)
            #Check if the path is empty and break out of the loop if true
             if [ -z "$csv_path_final" ]; then
          
              echo "Error: No file has been given"
            
            else
                        
             #Printing the csv data using 'more', so only one screen of text at a time
             awk -F ',' '{ print "Row " NR ": " $0 }' "$csv_path_final" | more

            fi
            ;;
        5)
            #Check if the path is empty and break out of the loop if true
            if [ -z "$csv_path_final" ]; then
          
              echo "Error: No file has been given"
            
            else
                        
            echo "Function not finalized"
            fi
            ;;
        6)
            #Exit
            echo "Exiting the menu"
            exit 0
            ;;
        *)
            #In any other case
            echo "Invalid choice, choose a number between 1-6"
            ;;
    esac
done