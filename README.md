# Calculator-Parser
Parser for simple calculator using the stack evaluation model.

this project contains three parts:
1. C code.
2. Context free grammar.
3. Lexical analyzer.

In the first part I aimed to implement a stck using a simple array that can have multiple operations to be preformed on, 
such as push(),pop()...etc.

The second part was to come up with the right form of CFG for this given language:
P → S P| S
S→ print | push int | pop | add |mul | sub |div

The third part was simply to come up with a lexical analyzer that will follow the demanded program structure.

This was an assignment I was given in a Compilers and Programming Languages course in my bachelor degree program,
so I was provided with a couple of helpful tutorials:
1. https://www.youtube.com/watch?v=54bo1qaHAfk&t=75s 
2. https://www.youtube.com/watch?v=__-wUHG2rfM
