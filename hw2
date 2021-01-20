#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

#define PI 3.14159

typedef double (*VirtualMethodPointer)(void *);

typedef VirtualMethodPointer * VTableType;

struct Shape
{
        VTableType VPointer;
        char* name;
};

typedef struct Shape Shape;

char* Shape_name(Shape* _this)
{
        return _this->name;
}

VirtualMethodPointer Shape_VTable [] =
{
         (VirtualMethodPointer)Shape_name
};

Shape * Shape_Shape(Shape * _this, char* newName)
{
        //_this->VPointer = Shape_VTable;
        _this->name = newName;
        return _this;
}

struct Circle
{
        VTableType VPointer;
        Shape super;
        double radius;
};

typedef struct Circle Circle;

double Circle_area(Circle * _this)
{
    return PI * _this->radius * _this->radius;
}

char* Circle_draw(Circle * _this)
{
        printf("    * * *    \n");
        printf("  *       *  \n");
        printf("  *       *  \n");
        printf("    * * *    \n");

}


VirtualMethodPointer Circle_VTable [] =
{
        (VirtualMethodPointer)Shape_name, // VTable[0]
        (VirtualMethodPointer)Circle_area, // VTable[1]
        (VirtualMethodPointer)Circle_draw // VTable[2]
};

Circle * Circle_Circle(Circle * _this, char* newName, double newRadius)
{
        Shape_Shape((Shape *)_this, newName);
        _this->VPointer = Circle_VTable;
        _this->radius = newRadius;
        // Constructors usually return void, but it makes the example simpler
        return _this;
}

struct Square
{
        VTableType VPointer;
        Shape super_sq;
        double sideL;
};

typedef struct Square Square;

double Square_area(Square * _this)
{
        return _this->sideL * _this->sideL;
}

char* Square_draw(Square * _this)
{
        printf("* * * * *\n");
        printf("*       *\n");
        printf("*       *\n");
        printf("*       *\n");
        printf("* * * * *\n");
}

VirtualMethodPointer Square_VTable [] =
{
        (VirtualMethodPointer)Shape_name, // VTable[0]
        (VirtualMethodPointer)Square_area, // VTable[1]
        (VirtualMethodPointer)Square_draw // VTable[2]
};

Square * Square_Square(Square * _this, char* newName, double width)
{
        Shape_Shape((Shape *)_this, newName);
        _this->VPointer = Square_VTable;
        _this->sideL = width;
        return _this;
}

struct Triangle
{
        VTableType VPointer;
        Shape super_tri;
        double base, height;
};

typedef struct Triangle Triangle;

double Triangle_area(Triangle * _this)
{
        return 0.5 * _this->base * _this->height;
}

char * Triangle_draw(Triangle * _this)
{
        printf("     *     \n");
        printf("    * *    \n");
        printf("   *   *   \n");
        printf("  *     *  \n");
        printf(" * * * * * \n");
}

VirtualMethodPointer Triangle_VTable [] =
{
        (VirtualMethodPointer)Shape_name,
        (VirtualMethodPointer)Triangle_area,
        (VirtualMethodPointer)Triangle_draw
};

Triangle * Tri_Tri(Triangle * _this, char* newName, double newBase, double newHeight)
{
        Shape_Shape((Shape *)_this, newName);
        _this->VPointer = Triangle_VTable;
        _this->base = newBase;
        _this->height = newHeight;
        return _this;
}

struct Rectangle
{
        VTableType VPointer;
        Square super_tri;
        double length;
        double sideL;
};

typedef struct Rectangle Rectangle;

double Rectangle_area(Rectangle * _this)
{
        return  _this->sideL * _this->length;
}

char * Rectangle_draw(Rectangle * _this)
{
        printf(" * * * * * * * * *\n");
        printf(" *               *\n");
        printf(" *               *\n");
        printf(" *               *\n");
        printf(" * * * * * * * * *\n");
}


VirtualMethodPointer Rectangle_VTable [] =
{
        (VirtualMethodPointer)Shape_name, // VTable[0]
        (VirtualMethodPointer)Rectangle_area, // VTable[1]
        (VirtualMethodPointer)Rectangle_draw // VTable[2]
};

Rectangle * Rec_Rec(Rectangle * _this, char* newName, double width, double length)
{
        Square_Square((Square *)_this, newName, width);
        _this->VPointer = Rectangle_VTable;
        _this->sideL = width;
        _this->length = length;
        return _this;
}

int main(int argc, char* argv[])
{
        int arg1;
        arg1 = atoi(argv[1]);

        int arg2;
        arg2 = atoi(argv[2]);

        int arg3 = arg1 - 1;
        int arg4 = arg2 - 1;

        Triangle *a = Tri_Tri((Triangle *)malloc(sizeof(Triangle)), "FirstTriangle", arg1, arg2);
        printf("FirstTriangle(%d, %d) : %f\n", arg1,arg2, a->VPointer[1](a));

        Triangle *a2 = Tri_Tri((Triangle *)malloc(sizeof(Triangle)), "SecondTriangle", arg3, arg4);
        printf("SecondTriangle(%d, %d) : %f\n", arg3,arg4, a->VPointer[1](a2));

        Circle *c = Circle_Circle((Circle *)malloc(sizeof(Circle)), "FirstCircle", arg1);
        printf("FirstCircle(%d) : %f\n", arg1, c->VPointer[1](c));

        Circle *c2 = Circle_Circle((Circle *)malloc(sizeof(Circle)), "SecondCircle", arg3);
        printf("SecondCircle(%d) : %f\n", arg3, c2->VPointer[1](c2));

        Square *s = Square_Square((Square *)malloc(sizeof(Square)), "FirstSquare", arg1);
        printf("FirstSquare(%d) : %f\n", arg1, s->VPointer[1](s));

        Square *s2 = Square_Square((Square *)malloc(sizeof(Square)), "SecondSquare", arg3);
        printf("SecondSquare(%d) : %f\n", arg3, s2->VPointer[1](s2));

        Rectangle *r = Rec_Rec((Rectangle *)malloc(sizeof(Rectangle)), "FirstRectangle", arg1, arg2);
        printf("FirstRectangle(%d, %d) : %f\n", arg1,arg2, r->VPointer[1](r));

        Rectangle *r2 = Rec_Rec((Rectangle *)malloc(sizeof(Rectangle)), "SecondRectangle", arg3, arg4);
        printf("SecondRectangle(%d, %d) : %f\n", arg3,arg4, r2->VPointer[1](r2));

        double total = a->VPointer[1](a) + a->VPointer[1](a2) + c->VPointer[1](c) + c2->VPointer[1](c2) + s->VPointer[1](s) + s2->VPointer[1](s2) + r->VPointer[1](r) + r2->VPointer[1](r2); 
        a->VPointer[2](a);
        c->VPointer[2](a);
        s->VPointer[2](a);
        r->VPointer[2](a);

        printf("Total : %f", total);

}
