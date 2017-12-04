# ***Difference Between C++ and Java***

## **类的成员变量（字段）和成员函数（方法）的访问限定**

### Java中成员变量/成员函数的访问限定

| 成员的访问修饰符 | 本类(self) | 包内(package) | 包内子类 | 包外子类 | 子类(sub class) | 其他(other) |
| ---------------- | ---------- | ------------- | -------- | -------- | --------------- | ----------- |
| public           | √          | √             | √        | √        | √               | √           |
| protected        | √          | √             | √        | √        | √               | X           |
| default          | √          | √             | √        | X        | X               | X           |
| private          | √          | X             | X        | X        | X               | X           |

- Java的内部类和外部类
    - 上述的Java类都是外部类。(内部类比较少用)
    - 内部类可以是静态(static)的，可以使用 public、protected 和 private 访问控制符，而外部类只能使用 public或者default。
    - 成员式内部类可以使用各种修饰符，包括 public、protected、private、static、final 和 abstract，也可以不写。
    - 若有 static 修饰符，就为类级，否则为对象级。类级可以通过外部类直接访问，对象级需要先生成外部的对象后才能访问。
    - 使用内部类的主要原因有：
        1. 内部类可以访问外部类中的数据，包括私有的数据。
        1. 内部类可以对同一个包中的其他类隐藏起来。
        1. 当想要定义一个回调函数且不想编写大量代码时，使用匿名(anonymous)内部类比较便捷。
        1. 减少类的命名冲突。

- 备注
    - [x] 父类中声明为public的方法在子类中也必须为public。
    - [x] 父类中声明为protected的方法在子类中要么声明为protected，要么声明为public。不能声明为private。
    - [x] 父类中默认修饰符声明的方法，能够在子类中声明为private。
    - [x] 父类中声明为private的方法，不能够被继承。

### C++中的访问限定以及继承

- C++中成员变量/成员函数的访问限定

| 成员的访问修饰符 | 本类(self) | 子类(sub class) | 友元(friend) | 其他(other) |
| ---------------- | ---------- | --------------- | ------------ | ----------- |
| public           | √          | √               | √            | √           |
| protected        | √          | √               | √            | x           |
| private          | X          | X               | X            | X           |

- C++中继承后访问性的变化(class A : public B)

| 父类中的成员被子类继承后的访问限定 | 父类中public成员 | 父类中protected成员 | 父类中private成员 |
| ---------------------------------- | ---------------- | ------------------- | ----------------- |
| 继承方式                           |
| public                             | public           | protected           | 不可访问          |
| protected                          | protected        | protected           | 不可访问          |
| private                            | private          | private             | 不可访问          |

- 备注
    - [x] C++中有多继承，而在java中只有单继承
    - [x] C++中继承用":"；而java的类继承用"extends"，Java的接口实现用"implements"

### C, C++, Java的访问限定差异

- C中class(struct)的默认访问是public
- C++中class的默认访问是private
- java中class的默认访问则是default
    > Java的访问修饰符需要在每一个方法或变量前声明，不然就是默认访问（若在类中没有显示地添加访问修饰符，则是默认访问）。


## **基础类型的字节长度**

- Java中的基础类型的位数不像C++那样依据不同编译器产商的不同实现而不同。Java中的位数是固定的，各基础类型的字节长度如下图所示。

| 基础类型          | boolean | byte | short | char | int | long | float | double |
| ----------------- | ------- | ---- | ----- | ---- | --- | ---- | ----- | ------ |
| 字节长度（bytes） | 1bit    | 1    | 2     | 2    | 4   | 8    | 4     | 8      |

- Java中的基础类型是没有有符号和无符号之分的，也即是说没有 unsigned 类型


## **C++和Java的各类型函数/方法**

### 各类型的函数在C++/Java中的实现

| 函数类型/类类型                                | C++                     | Java                                   |
| ---------------------------------------------- | ----------------------- | -------------------------------------- |
| 静态函数(类函数，不需要实例化就可以调用的函数) | static void func()      | static void func()                     |
| 普通函数(不可重写的函数)                       | void func()             | final void func()                      |
| 虚函数(可以在子类中重写的函数)                 | virtual void func()     | void func()                            |
| 纯虚函数(基类中只声明，在子类必须实现的函数)   | virtual void func() = 0 | abstract void func()                   |
| 抽象类                                         | 有纯虚函数的类          | abstract修饰的类(含有abstract方法的类) |
| 虚基类(接口类)                                 | 有且仅有纯虚函数的类    | interface修饰的类(所有函数都是抽象的)  |

### Java中的类类型

- 抽象类
    - 抽象方法必须为public或者protected(private成员不能继承，声明为private无意义且规定不能声明为private)，缺省情况下默认为public。
    - 抽象类不能用来创建对象。
    - 如果一个类继承于一个抽象类，则子类必须实现父类的抽象方法。如果子类没有实现父类的抽象方法，则必须将子类也定义为为abstract类。

- 接口
    - 接口中声明的成员方法默认都是 public abstract 且只能是public abstract，不能声明为 private 或protected，也不能为static。
    - 接口中声明的成员变量默认都是 public static final 的，必须显示的初始化。

- 类内部定义的接口
    - 类的内部接口默认是static且只能是static，类的内部接口可以访问类的所有成员变量，类似于C++中 lambda 函数。

        ``` Java
        public class A
        {
            public interface Interf
            {
                void fun();
            }

            public void func()
            {
                Log.e("A", "in A.func()");
                Interf interf = new Interf() {
                    @Override
                    public void fun() {
                    }
                };
                interf.fun();
            }
        }
        ```

- Java中的final
    - 一旦将一个类声明为 final，那么该类包含的方法也将被隐式地声明为final，但是变量不是。
        ``` Java
        public class A
        {
            // 类的成员变量，可以在此处直接初始化，如果没有在这里初始化，可以仅可以在构造函数中初始化。
            final int i;
            // 类的静态变量(类变量)，可以在此处初始化，如果没有在这里初始化，可以在static块中初始化。
            public static final int j;

            static
            {
                j = 0;
            }

            A()
            {
                j = 0;     //由于j在static块中已经初始化，故在此处是赋值，由于j被final修饰，所以这里的赋值在语法上是错误的。
                i = 0;     //由于i没有在类成员变量声明时初始化，故在此处是初始化而不是赋值。
                i = 0;     //由于i被final修饰且已经初始化，所以这里的赋值在语法上是错误的。
            }
        }
        ```
