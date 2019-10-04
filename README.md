This is a C compiler with code-generation for x86/SSE2 with optimization. It lacks some C language features, like enums and preprocessor.
<p>
I'm terribly sorry, however all the history, all the documentation and the comments are in Russsian language. You might find Google Translate useful OR try to take advantage of an automatic translation in the Chrome browser!
<p>
It uses Flex as a lexical analyzer generator + Bison as a parser generator. All grammar files are here: https://github.com/artyompal/C-compiler/tree/master/frontend_cc/scripts.
<p>
I've written a test in C language (https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/visual/rasterizer/rasterizer.c) which was a software 3D rasterizer, and on this test my compiler reached the same performance as Microsoft Visual С++. Then I made that test more challenging.
<p>
You could try to run the test from here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/visual/rasterizer. There are executables provided for both MSVC and CC. Windows is required. Alternatively, you could recompile both tests.
<p>
What optimizer can do:
<ul>
<li>inline functions;</li>
<li>allocate variables in registers (globally and locally);</li>
<li>optimize arithmetic expressions;</li>
<li>detect dead code, etc</li>
</ul>
<p>
The most interesting part of sources (code generator + optimizer) is here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/src/src. All the boring staff (parsing + type checking) is here: https://github.com/artyompal/C-compiler/tree/master/frontend_cc/src/src. Those two parts are independent, so it shouldn't be problem to attach a new front-end to compile any other language into x86.
<p>
One nice feature is, it can generate AST (abstract syntax tree) and save it into XML file like this: https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/regressive/for.xml. Check out ASTs for regressive tests here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/regressive.
<p>
The most advanced experimental code lives in this branch: https://github.com/artyompal/C-compiler/tree/var_caching_dev. However, this is unfinished work and it's likely to be broken.
<p>
The whole project wouldn't be possible without Dragon book, which I highly recommend as a comprehensive reference about compiler design: https://www.amazon.co.uk/Compilers-Principles-Techniques-Alfred-Aho/dp/0201100886. There is also a second edition of this book.
<hr>
<br>
<br>
Artyom Palvelev / 2017
