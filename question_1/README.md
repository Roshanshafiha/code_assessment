# Question 1.1 answer 

Question 1.1: How to properly track errors in:

Bash :

ls /path/to/nonexistent/directory

exit_code=$?

if [ $exit_code -ne 0 ]; then
    echo "An error occurred."
fi


Python:

import logging

# Configure logging
logging.basicConfig(filename='error.log', level=logging.ERROR, format='%(asctime)s - %(levelname)s - %(message)s')

def divide_numbers(a, b):
    try:
        result = a / b
        return result
    except ZeroDivisionError as err:
        logging.error("ZeroDivisionError", exc_info=True)
        return None
    except Exception as e:
        logging.error("An unexpected error occurred", exc_info=True)
        return None

# Example usage
result1 = divide_numbers(10, 2)   # No error
result2 = divide_numbers(10, 0)   # Will log a ZeroDivisionError
result3 = divide_numbers('10', 2) # Will log a TypeError


# question 1.2 answer is within folder q1.2_slurm

# question 1.3 answer :

Code comment is a good procedure for programing in any language not just bash. It helps to understand the program , especially the program readability when the code has to be taken over by someone else within a team.
Code comment in bash starts with a # sign and single line bash comment and inline bash comment. The best practice for bash comments include :
1.	Including a file header
-	Explain what the program does in a glance
-	Indicate the author 
-	Explain how to run the script – code usage 
2.	Comments on functions
-	Provide the brief description of the operation
-	Input argument for the function
-	The expected output of the function
3.	Add comments on code that require future improvement or modification.
