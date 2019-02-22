import UIKit

var str = "Hello, it's Utkarsh's playground"

// Assignment 5 - Session : iOS : Swift Advance dated 22-Feb-2019

// 1. What is extension?

// Swift Extension is a useful feature that helps in adding more functionality to an existing Class, Structure, Enumeration or a Protocol type. This includes adding functionalities for types where you don’t have the original source code too (extensions for Int, Bool, String etc. types).

/* Following are the essential functionalities that Swift Extension offer us:
1. Add computed instance properties and computed type properties
2. Define instance methods and type methods
3. Provide new initializers
4. Define subscripts
5. Define and use new nested types
6. Make an existing type conform to a protocol

*/



// 2. Create a class and write the delegate of UITextField in extension of that class.

/*
 
import UIKit
class ModifiedTextField: UITextField {
    
    override func awakeFromNib() {
        delegate = self
    }
}
extension ModifiedTextField : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        fieldEmptyError(value: false)
        
    }
    func fieldEmptyError(value: Bool){
    }
}
*/

// 3. Write a protocol and create an extension of the protocol. In extension create a function

protocol Greeting {
    func sayHello() -> String
}

class Person
{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person: Greeting {
    
    func sayHello() -> String {
        return "Hello!, \(name)"
    }
}

var personName = Person(name: "Utkarsh")
personName.sayHello()



// 4. Write an enum and create an extension of the enum.

enum Direction: String {
    case east
    case west
    case north
    case south
}

extension Direction
{
    var value: String
    {
        return self.rawValue
    }
    
    func displayValue()
    {
        switch self
        {
        case .east:
            print("East Direction")
        case .west:
            print("West Direction")
        case .north:
            print("North Direction")
        case .south:
            print("South Direction")
        }
    }
}

print(Direction.north.value)
Direction.north.displayValue()



// 5. What is Generic?


// Generic code enables us to write flexible, reusable functions and types that can work with any type, subject to requirements that we define. We can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

// Swift’s Array and Dictionary types are both generic collections.
// We can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, we can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.



// 6. Explain generic with an example?



func SwapValues<T>(_ a: inout T, _ b: inout T) {
    let tempval = a
    a = b
    b = tempval
}
var num1 = 121
var num2 = 9999
var str1 = "Patel"
var str2 = "Utkarh"
SwapValues(&num1, &num2)
SwapValues(&str1, &str2)

print("After Swapping Num1: \(num1), Num2: \(num2)")
print("After Swapping Str1: \(str1), Str2: \(str2)")

// If you observe above example we defined a single function SwapValues with generic placeholder type name called <T> to swap any type of values like integers, strings.

// In above example the placeholder T doesn’t say anything,
// but it does says that both a and b must be of the same type T, whatever T represents. The actual type to use in place of T is determined each time the SwapValues(_ :, _ : ) function calls.




// 7: Explain the difference between map and compactMap with an example.

// map
/*
 This higher order function loops over a collection and applies the same operation to each element in the collection.
 */
/*
 compactMap
 CompactMap is same as the Map function with optional handling capability.
 CompactMap is used to filter out the nil value.
 */


// Example of map
var num = [0,9,8,7,6]
var newArray = num.map({(value: Int) -> Int in
    return value * 2
    
})
print(newArray)

// Example of compactMap
let nameArray: [String?] = ["Utkarsh",nil, "Bob",nil,nil, "Rohit", nil, "Ankit"]
let removeNil = nameArray.compactMap{$0}
print(removeNil)



// 8. Write an example of reduce function with initial value 1000.


let array: [Int] = [0,9,8,7,6]
let addNumbers = array.reduce(1000, {$0 + $1})
print(addNumbers)



// 9. Find all person whose age is more than 25 using filter function.


struct Persons
{
    
    var name : String
    
    var age : Int
    
}

let person1 = Persons(name: "Sam", age: 23)

let person2 = Persons(name: "John", age: 30)

let person3 = Persons(name: "Rob", age: 27)

let person4 = Persons(name: "Luke", age: 20)

let personArray = [person1, person2, person3, person4]


// using filter
let ageGreaterThan25 = personArray.filter({ return $0.age > 25 })
print(ageGreaterThan25)




// without using filter
//var ageGreaterThan25: [Persons] = []
//
//for age in personArray
//{
//    if age.age > 25
//    {
//        ageGreaterThan25.append(age)
//    }
//}
//
//print(ageGreaterThan25)




