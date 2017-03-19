Russian version below - Русская версия ниже.
<hr>
<p>
This is a C compiler with code-generation for x86/SSE2 with optimizations. It misses some C language features, like enums and preprocessor.
<p>
I'm terribly sorry, however all the history and all the documentation and comments are in Russsian language (cp1251). You might find Google translate useful OR try to take advantage of an automatic translation in Chrome browser!
<p>
It uses Flex as a lexical analyzer generator + Bison as a parser generator.
<p>
I've written a test in C language (https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/visual/rasterizer/rasterizer.c) which was a software 3D rasterizer and on this test my compiler reached the same performance as Microsoft Visual С++. Then I made test more challenging.
<p>
You could try to run the test from here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/visual/rasterizer. There are executables provided for both MSVC and CC. Windows is required, obviously. Alternatively, you could recompile both tests.
<p>
The most interesting part of sources (code generator + optimizer) is here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/src/src. All the boring staff (parsing + type checking) is here: https://github.com/artyompal/C-compiler/tree/master/frontend_cc/src/src. Those two parts are independent, so it shouldn't be problem to attach a new front-end to compile any other language into x86.
<p>
One nice feature is, it can generate AST (abstract syntax tree) and save it into XML file like this: https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/regressive/for.xml. Check out ASTs for regressive tests here: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/regressive.
<p>
The most advanced experimental code lives in this branch https://github.com/artyompal/C-compiler/tree/var_caching_dev. However, this is unfinished work and it's likely to be broken.
<p>
The whole project wouldn't be possible without Dragon book, which I highly recommend as a comprehensive reference about compiler design: https://www.amazon.co.uk/Compilers-Principles-Techniques-Alfred-Aho/dp/0201100886. There is also a second edition of this book.
<hr>
<p>
Это проект оптимизирующего компилятора Си с кодогенерацией для x86/SSE2. Не все фичи языка Си поддерживаются: отсутствует препроцессор, не поддерживаются enum и т. д.
<p>
Вся история версий, все комментарии и документация написаны на русском языке, в кодировке Ansi-1251.
<p>
Лексические анализатор генерируется Flex, парсер генерируется Bison.
<p>
Я начал с того, что написал простой тест на языке Си (https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/visual/rasterizer/rasterizer.c), это был 3D-растеризатор. Стояла задача на этом тесте получить производительнось Microsoft Visual С++, и эта задача была выполнена. Потом я стал усложнять тест.
<p>
Вы можете попробовать запустить тест отсюда: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/visual/rasterizer. Прилагаются собранные экзешники для MSVC и CC. Работает только под Windows. Либо же, вы можете пересобрать оба теста.
<p>
Самая интересная часть кода (кодогенератор с оптимизатором) находится здесь: https://github.com/artyompal/C-compiler/tree/master/cc4x86/src/src. Скучная рутина (парсер, проверки типов и т. д.) находятся здесь: https://github.com/artyompal/C-compiler/tree/master/frontend_cc/src/src. Эти два компонента независимы, поэтому не должно быть проблемой добавить фронт-енд для любого другого языка, чтобы компилировать его в x86.
<p>
Одна любопытная фича заключается в том, что компилятор может сохранить синтаксическое дерево (AST) в XML-файл, например: https://github.com/artyompal/C-compiler/blob/master/cc4x86/tests/regressive/for.xml. Вы можете посмотреть на примеры XML-файлов для разных простых тестов здесь: https://github.com/artyompal/C-compiler/tree/master/cc4x86/tests/regressive.
<p>
Самая продвинутая версия кодогенератора разрабатывалась здесь: https://github.com/artyompal/C-compiler/tree/var_caching_dev. К сожалению, этот код не дописан и наверняка сломан.
<p>
Весь этот проект заимствует неприлично много идей из книги Дракона: https://www.amazon.co.uk/Compilers-Principles-Techniques-Alfred-Aho/dp/0201100886. Я всячески рекомендую эту нашумевшую публикацию к изучению, тем более, что уже вышло второе издание.
<hr>
<br>
<br>
Artyom Palvelev / Артём Пальвелев / 2017
