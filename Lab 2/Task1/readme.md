Logic Used
is_comment(line): This function takes a line of code (line) as input. It checks whether the line starts with a #, which is the Python comment indicator.
If it doesn't, it checks if the line starts and ends with triple-quotes, indicating a multi-line comment.

identify_lines(lines): This function iterates through a list of lines (lines) and calls is_comment() for each line. 
If a line is identified as a comment, it prints that it's a comment. Otherwise, it prints that it's not a comment.


Lexical Analyis is more important than syntax analysis
In this program, we are primarily concerned with identifying comments based on their lexical structure. 
We look for specific patterns like lines starting with # for single-line comments and lines enclosed by triple-quotes (""") for multi-line comments. 
These patterns are lexical features, and recognizing them allows us to distinguish comments from other parts of the code.
