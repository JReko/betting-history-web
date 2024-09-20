import re

# Open your SQL dump file
with open('dump.sql', 'r') as file:
    sql_data = file.readlines()

# Define the regex pattern to match the insert statement for the `multi_bet` field
# This assumes that `multi_bet` is always the 9th value in the insert statement
updated_sql_data = []
for line in sql_data:
    if line.startswith('INSERT INTO bets'):
        # Use regex to locate the 9th value, which corresponds to `multi_bet`
        updated_line = re.sub(r'(\([^)]*?,[^)]*?,[^)]*?,[^)]*?,[^)]*?,[^)]*?,[^)]*?,[^)]*?,)([01])(,)', 
                              lambda match: match.group(1) + ('TRUE' if match.group(2) == '1' else 'FALSE') + match.group(3), 
                              line)
        updated_sql_data.append(updated_line)
    else:
        updated_sql_data.append(line)

# Save the modified SQL data to a new file
with open('updated_dump.sql', 'w') as file:
    file.writelines(updated_sql_data)

print("Finished converting multi_bet column values in INSERT statements to TRUE/FALSE.")
