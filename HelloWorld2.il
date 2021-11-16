// Hello World - Native IL

.assembly extern mscorlib { .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) .ver 2:0:0:0 } // if this line is missing then it produces a warning

.assembly MyAssembly {}

.class MyApp {
  .method static void Main() {
    .entrypoint
    ldstr  "Hello World - Native IL Intermediate Language!"
    call   void [mscorlib]System.Console::WriteLine(class System.Object)
    ret
  }
}
