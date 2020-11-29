import UIKit
//Первое задание: вычисление квадратного корня
print("Hello, this pgrogramm for solving quadratic equation ax^2+bx+c=0")
let a: Double = 2//Значение переменной А
let b: Double = 4//Значение переменной В
let c: Double = 2//Значение переменной С
var D = b*b - 4*a*c//Значение дискриминанта
print("Variables equation a =",a,"b =",b,"c =",c,"\nDiscriminant equation =",D)
if D > 0 {//
    let x1 = (-b + sqrt(D))/(2*a)//Первый корень
    let x2 = (-b - sqrt(D))/(2*a)//Второй корень
    print("The equation has roots: x1 =",x1,"and x2 =",x2)
} else if D == 0 {
    let x = (-b)/(2*a)//Корень
    print("The equation has root: x =",x)
} else {
    print("The equation has no roots")
}
//Второе задание: вычисление площади, периметра и гипотенузы - прямоугольного треугольника, по имеющимся катетам.
print("Hello, this programm searches for the area, perimeter and hypotenuse of a right triangle")
let a2: Double = 9//Катет А треугольника
let b2: Double = 16//Катет В треугольника
var c2 = sqrt(a2*a2 + b2*b2)//Вычисление гипотенузы треугольника
print("Legs: a =",a2,"b =",b2)
var areaT = 0.5 * a2 * b2//Вычисление площади треугольника
var perT = a2 + b2 + c2//Вычисление периметра треугольника
print("Area =",areaT,"\nPerimeter =",perT,"\nHypotenuse =",c2)
//Третье задание: Вычисление суммы депозита
print("Hello, this programm calculates the deposit amount")
let yearD: Int = 5//Период вклада
let yearProcent: Double = 6.9//Годовой процент вклада
var depositY: Double = 12345//Сумма вклада
var year = 1
print("Deposit amount=",depositY,"for",yearD,"years.\nInterest rate =",yearProcent,"%")
while year <= yearD {
    let percentY = depositY*yearProcent/100
    depositY+=percentY
    print("Deposit for",year,"year =",depositY,"amount per cent =",percentY)
    year+=1
}
