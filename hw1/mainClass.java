import java.util.*;

abstract class Shape
{
    private String name;

    Shape(String newName)
    {
            name = newName;
    }

    public abstract double area();
    public abstract void draw();
}

class Circle extends Shape
{
    private double radius;

    public Circle(String name, double radius)
    {
        super(name);
        this.radius = radius;
    }

    public double area()
    {
        double area_ = Math.PI * radius * radius;
        return area_;

    }

    public void draw()
    {

        System.out.println("    * * *    ");
        System.out.println("  *       *  ");
        System.out.println("  *       *  ");
        System.out.println("    * * *    ");
    }
}

class Square extends Shape
{
    private double sideL;

    public Square (String name, double width)
    {
        super(name);
        this.sideL = width;

    }

    public double area()
    {
     double area_ = sideL * sideL;
     return area_;
    }

    public void draw()
    {

        System.out.println("* * * * *");
        System.out.println("*       *");
        System.out.println("*       *");
        System.out.println("*       *");
        System.out.println("* * * * *");
    }
}

class Triangle extends Shape
{
    private double myHeight, myBase;

    public Triangle(String name, double h, double b)
    {
        super(name);
        this.myHeight = h;
        this.myBase = b;
    }

    public double area()
    {
        double area_ = 0.5 * myBase * myHeight;
        return area_;
    }

    public void draw()
    {
        System.out.println("     *     ");
        System.out.println("    * *    ");
        System.out.println("   *   *   ");
        System.out.println("  *     *  ");
        System.out.println(" * * * * * ");
    }
}

class Rectangle extends Square
{
    private double sideL;
    private double width;

    public Rectangle (String name, double sideL, double width)
    {
        super(name,sideL);
        this.sideL = sideL;
        this.width = width;

    }

    public double area()
    {
     double area_ = sideL * width;
     return area_;
    }

    public void draw()
    {
        System.out.println(" * * * * * * * * * ");
        System.out.println(" *               * ");
        System.out.println(" *               * ");
        System.out.println(" *               * ");
        System.out.println(" * * * * * * * * * ");

    }
}

class Picture
{
        LinkedList<Shape> ShapeLL = new LinkedList<Shape>();

        public void add(Shape sh)
        {
                ShapeLL.add(sh);
        }

        public void drawAll()
        {
                int llSize = ShapeLL.size();
                for(int i = 0; i < llSize; i++)
                {
                        ShapeLL.get(i).draw();
                        System.out.println("\n");
                }
        }

        public double totalArea()
        {
                int llSize = ShapeLL.size();

                double area_ = 0;

                for(int i = 0; i < llSize; i++)
                {
                         area_ += ShapeLL.get(i).area();
                }

                return area_;
        }

}

public class mainClass
{
        static void println(double d)
        {
                System.out.println("Double d is " + d);
        }

        public static void main(String[] args)
        {
                int args1 = Integer.parseInt(args[0]);
                int args2 = Integer.parseInt(args[1]);
                int args3 = args1 - 1;
                int args4 = args2 - 1;


                Picture p = new Picture();

                p.add(new Triangle("FirstTriangle", args1, args2));
                Triangle t = new Triangle("x",args1,args2);
                System.out.println("FirstTriangle("+args1+","+args2+") : "+t.area());

                p.add(new Triangle("SecondTriangle",args3 ,args4));
                Triangle t2 = new Triangle("x2",args3,args4);
                System.out.println("SecondTriangle("+args3+","+args4+") : "+t2.area());

                p.add(new Circle("FirstCircle", args1));
                Circle c = new Circle("c", args1);
                System.out.println("FirstCircle("+args1+") : "+c.area());

                p.add(new Circle("SecondCircle", args3));
                Circle c2 = new Circle("c2", args3);
                System.out.println("SecondCircle("+args3+") : "+c2.area());

                p.add(new Square("FirstSquare", args1));
                Square s = new Square("sq", args1);
                System.out.println("FirstSquare("+args1+") : "+s.area());

                p.add(new Square("SecondSquare", args3));
                Square s2 = new Square("sq2", args3);
                System.out.println("SecondSquare("+args3+") : "+s2.area());

                p.add(new Rectangle("FirstRectangle",args1, args2));
                Rectangle rt = new Rectangle("rt", args1, args2);
                System.out.println("FirstRectangle("+args1+","+args2+") : "+rt.area());

                p.add(new Rectangle("SecondRectangle",args3, args4));
                Rectangle rt2 = new Rectangle("rt2", args3, args4);
                System.out.println("SecondRectangle("+args3+","+args4+") : "+rt2.area());

                System.out.println("\n");

                p.drawAll();

                System.out.println("Total: " + p.totalArea());

        }

}
