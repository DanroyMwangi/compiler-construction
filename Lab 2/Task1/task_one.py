def is_comment(line):  # Checks if a line is a regular comment
    return line.strip().startswith("#")

def task_one(filepath):
    # Read the file from the given path
    with open(filepath, "r") as file:
        lines = file.readlines()

    # Identify each line as either a comment or not and store the result as (line_number, is_comment)
    result = []
    for i, line in enumerate(lines):
        result.append((i + 1, is_comment(line)))

    return result

print(identify_comments("test.py"))
