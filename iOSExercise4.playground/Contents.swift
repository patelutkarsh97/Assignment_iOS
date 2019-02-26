import UIKit

var str = "Hello, playground"

//: # **Session : iOS : Swift Intermediate level**

//: ## 1. Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).

func siftBeans(fromGroceryList list: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    
    for item in list {
        if item.hasSuffix("beans") {
            beans.append(item)
        }
        else {
            otherGroceries.append(item)
        }
    }
    
    return (beans, otherGroceries)
}

let result = siftBeans(fromGroceryList: ["green beans",
                                         "milk",
                                         "black beans",
                                         "pinto beans",
                                         "apples"])


result.beans == ["green beans", "black beans", "pinto beans"] // true
print(result.beans)

result.otherGroceries == ["milk", "apples"] // true”
print(result.otherGroceries)


//: ## 2.a. Make a calculator class with a function name “equals” that take a enum case as value like multiply, subtraction, addition, square root, division.

class Calculator {
    var num1: Double
    var num2: Double
    init(num1: Double, num2: Double)
    {
        self.num1 = num1
        self.num2 = num2
    }


func funcForCalValue(_ calcFunc: (Double, Double) -> Double, _ num1: Double, _ num2: Double) -> Double
{
    return calcFunc(num1, num2)

}

struct Operation
{
    func add(num1: Double, num2: Double) -> Double
    {
        return num1 + num2
    }
    
    func sub(num1: Double, num2: Double) -> Double
    {
        return num1 - num2
    }
    
    func mul(num1: Double, num2: Double) -> Double
    {
        return num1 * num2
    }
    
    func div(num1: Double, num2: Double) -> Double
    {
        return num1 / num2
    }
    
    func sqroot(num1: Double, num2: Double) -> Double
    {
        return num1.squareRoot()
    }
}
}

var objForCalFunc = Calculator(num1: 2, num2: 2)

var objOperation = Calculator.Operation()

let valueOfAdd = objForCalFunc.funcForCalValue(objOperation.add,objForCalFunc.num1, objForCalFunc.num2)

print("The calculated value after addition is \(valueOfAdd)")

let valueOfSub = objForCalFunc.funcForCalValue(objOperation.sub,objForCalFunc.num1, objForCalFunc.num2)

print("The calculated value after subtraction is \(valueOfSub)")

let valueOfMul = objForCalFunc.funcForCalValue(objOperation.mul,objForCalFunc.num1, objForCalFunc.num2)

print("The calculated value after multiplication is \(valueOfMul)")

let valueOfDiv = objForCalFunc.funcForCalValue(objOperation.div,objForCalFunc.num1, objForCalFunc.num2)

print("The calculated value after division is \(valueOfDiv)")

let valueOfSqRoot = objForCalFunc.funcForCalValue(objOperation.sqroot,objForCalFunc.num1, objForCalFunc.num2)

print("The calculated value for Square Root is \(valueOfSqRoot)")



//: ## 2.b. Make same calculator using functions as argument, define all type functions in a struct.


struct CalclatorStruct
{
    func add(num1: Double, num2: Double) -> Double
    {
        return num1 + num2
    }
    
    func sub(num1: Double, num2: Double) -> Double
    {
        return num1 - num2
    }
    
    func mul(num1: Double, num2: Double) -> Double
    {
        return num1 * num2
    }
    
    func div(num1: Double, num2: Double) -> Double
    {
        return num1 / num2
    }
    
    func sqroot(num1: Double, num2: Double) -> Double
    {
        return num1.squareRoot()
    }
    
}

func valueOutput(calculate : (Double,Double) -> Double , num1: Double , num2: Double)
{
    let output = calculate(num1 , num2)
    print(output)
}
var obj = CalclatorStruct()
valueOutput(calculate : obj.add , num1: 2 , num2: 2 )
valueOutput(calculate : obj.sub , num1: 2 , num2: 2 )
valueOutput(calculate : obj.mul , num1: 2 , num2: 2 )
valueOutput(calculate : obj.div , num1: 2, num2: 2 )
valueOutput(calculate : obj.sqroot , num1: 2 , num2: 2 )



