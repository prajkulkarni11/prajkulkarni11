public with sharing class AreaAndPerimeterRectangle {

    public void calcArea()
    {
        integer length=10;
        integer width = 12;
        integer area;
        area = length*width;
        system.debug('area of rectangle'+area);
    }
    public void calcPerimeter()
    {
         integer length=10;
        integer width = 12;
        integer peri;
        peri = (2*length)*(2*width);
        system.debug('perimeter of rectangle'+peri);
    }
}