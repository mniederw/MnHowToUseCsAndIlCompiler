using System.Linq;
internal static class HelloWorld1
{
    internal static void Main( System.String[] args )
    {
        System.Console.WriteLine("Hello World 1! Args=" + System.String.Join(" ",args.Select(item => "\""+item+"\"")) + ".");
    }
}
