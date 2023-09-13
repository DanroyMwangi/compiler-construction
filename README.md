# compiler-construction

****UBUNTU****

**Install Flex**

To install flex on ubuntu run the following command: sudo apt install flex

Getting the lexical analyzer

Create a file with extension name_of_l_file.l that will store all the rules.

Use flex to convert the .l file to by running the command flex -o name_of_lexer.yy.c name_of_l_file.l

Output the lexical analyzer using the command gcc -o name_of_lexical_analyzer lexer.yy.c -lfl

Run the output from 3 above to test out the lexical analyzer that has been generated as a bash script.

Type a sentence and watch the magic happen 😉

To exit press crtl + z

Ubuntu Output
