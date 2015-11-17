using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c02方法的一些特点
{
    class Program
    {
        /*
         * 方法的参数在调用的时候需要一 一对应（类型对应，数量对应，顺序对应），
         * 在方法调用的时候一定会遵循一个原则：一对一：第一个实参默认情况下是赋值给第一个形参的
         * 但是他们都是特殊情况：
         * 类型对应时：int-float--double,子类可以替换父类，接口实现类可以替换接口
         * 数量对应：可变参数。。参数有默认值
         * 顺序对应：可以使用参数：值的方式进行调用。如果某个参数使用了  参数：值的方式，那么这个参数之后的所有参数都必须使用这种格式，但是之前就不管
         */
        static void Main(string[] args)
        {
            int count = 100;
            Test(out count);
            Console.ReadKey();
        }
        //如果参数的默认值，则有默认值的参数必须写在最后,如果同时有默认值参数和可变参数，则可变参数必须在最后。
        static void Test(out int num)
        {
            num = 100;
            Console.WriteLine(num);
        }
    }
}
