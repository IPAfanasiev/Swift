import UIKit
//задание №1,2 функция определения четности числа и деления на 3 без остатка
func numCheck(num : Int) -> String {
    var outPut = "Number "
    if num%2 == 0 {//проверка на четность
        outPut = outPut + "is even"
    } else {
        outPut = outPut + "is odd"
    }
    if num%3 == 0 {//проверка деления на 3
        outPut = outPut + " and is divisible by 3 wichout remainder"
    }
    return outPut
}
//Задание №3 - функция создания массива с заданным количеством элементов
func numArray(quant : Int) -> [Int] {
    var newArray : [Int] = []
    if quant != 0{
        for i in 0...(quant-1) {
            newArray.append(i)
        }
    }
    return newArray
}
//Задание №5 - Функция добавления в массив нового числа фибоначи
func fibonach(numArray : [Int] = [0, 1], quant : Int = 1) -> [Int64] {
    var num : [Int64] = []
    var numArray = numArray
    if numArray == [nil] || numArray == [] {
       numArray = [0, 1]
    } else if (numArray.count == 1) && (numArray.last! == 0){
        numArray.append(1)
    } else if (numArray.count == 1) && (numArray.last! >= 1){
        numArray.append(numArray.last! + numArray.last!)
    }
    for i in 0...(numArray.count-1) {
        num.append(Int64(numArray[i]))
    }
    for _ in 1...quant{
        if (num[num.count - 2] > (Int64.max - num.last!)) && (num.last! > (Int64.max/2)){
            print("There is no way to calculate the Fibonacci number, the operation stopped at",num.count,"element(s)=",num.last!,"\nMaximum possible number =",Int64.max)
            break
        } else {
            num.append(num.last! + num[num.count - 2])
        }
    }
    return num
}
//Задание №6 - Медленный вариант согластно ТЗ (слишком долго считало поэтому решил попробовать не через массивы а через коллекции)
func simpleNumbersTZ(quant: Int) -> [Int]{
    var numArray : [Int] = []
    var quant = quant
    if quant < 2{
        quant = 2
    }
    for n in 1...quant{
        numArray.append(n)
    }
    var p : Int = 1
    while numArray.first(where:{ $0 > p }) != nil {
        p = numArray.first(where:{ $0 > p })!
        var step = p
        while step <= quant{
            numArray.removeAll(where:{ $0 == (p + step)})
            step+=p
        }
    }
    return numArray
}
//Задание №6 - решено через коллекции, считает в разы быстрее
func simpleNumbers(quant: Int) -> [Int]{
    var numSet = Set<Int>()
    var numSetMinus = Set<Int>()
    var quant = quant
    if quant < 2{
        quant = 2
    }
    for n in 1...quant{
        numSet.insert(n)
    }
    var p : Int = 1
    while numSet.contains(p) {
        if let e = numSet.sorted().first(where: { $0 > p }) {
            p = e
        } else {
            break
        }
        var step = p
        while step <= quant{
            numSetMinus.insert(p + step)
            step+=p
        }
        numSet.subtract(numSetMinus)
        numSetMinus.removeAll()
    }
    let outArray = Array(numSet.sorted())
    return outArray
}
//Задание 1,2
let userNum = 6 //проверяемое число
print("User number",userNum,numCheck(num: userNum))
//задание 3,4
let lengthArray = 100//длинна создаваемого массива
var new = numArray(quant: lengthArray)
print("New maasive at",lengthArray,"elements\n",new)
//Задание 4 - удалить из созданного массива четные числа и чиска которые делятся без остатка на 3
for num in new {
    if (num%2 == 0) || (num%3 == 0) {
        new.remove(at: new.firstIndex(of: num)!)
    }
}
print("Massive off even number and number is divisible by 3\n",new)
//Задание 5
print("Massive is Fibonacci number\n",fibonach(numArray: new, quant: 100))//Задание 5 - если указываем numArray - добавляет в этот массив число фибоначи, если указываем quant - добавляет в массив указанное число элементов фибоначи
//Задание 6
let lengthN : Int = 600 //Заданное число n - масимальное число для поиска натурального числа
print("Massive of simple numbers\n",simpleNumbersTZ(quant: 100))
print("Massive of simple numbers\n",simpleNumbers(quant: lengthN))
