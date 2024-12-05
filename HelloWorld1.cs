using System.Linq;
internal static class HelloWorld
{
    internal static void Main( System.String[] args )
    {
        System.Console.WriteLine("Hello World! Args=" + System.String.Join(" ",args.Select(item => "\""+item+"\"")) + ".");
    }
}
