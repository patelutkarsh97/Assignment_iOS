import UIKit

var str = "Hello, its Utkarsh's playground"


//: # **Session : Reserve Day for Protocol Oriented Programming**


//: ## 1. Write a protocol that defines the logic for load more (this func can be empty for now and just print loading more) in its extension, but this protocol is conditionally conformed by controller if controller conform to scrollViewDelegate.

/*: ###

 protocol loading {
 func loadMore()
 }
 
 extension loading where Self : UIScrollViewDelegate  //here Self is used to conform the controller using the UIScrollViewDelegate
 {
 func loadMore()
 {
 print("loading more")
 }
 }

*/



//: ## 2. Explain the use of self,Self in protocols, Also how they differ for Static function.

/*: ### "Self" refers to the type that conform to the protocol, e.g. Bool or Int or String
    ### "self" refers to the value inside that type, e.g. true or 123 or "Utkarsh"
 
 ## For Example: To square a number
 
 extension BinaryInteger {
 func squared() -> Self {
 return self * self
 }
 }
 
 */


//: ## 3. Write a generic function that takes two operand and combine them.  Example = add(1 + 1), add(1.0 + 1.0), add(Ankit + nigam)


protocol Combining {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Int: Combining {}
extension Double: Combining {}
extension Float: Combining {}
extension String: Combining {}

func combine<T: Combining>(_ a:  T, _ b:  T) -> T {
 let combined = a + b
    return combined
 }

var a = "Utkarsh"
var b = " Patel"
print(combine(a, b))

var num1 = 107
var num2 = 3
print(combine(num1, num2))

var numOfDub = 1.0
var numOfDub2 = 2.0
print(combine(numOfDub, numOfDub2))

 


//: ## 4. Write an extension on collection type to find the combined value of collection.

/*:  */
protocol Concatinable {
    func concat()
}

extension Array : Concatinable {
    func concat() {
        if self is [String] {
            var variableOfStringtype: String = ""
            for flag in self {
                variableOfStringtype = combine(variableOfStringtype, (flag as! String ))
            }
            if (variableOfStringtype == "") {
                print("Array is empty")
            }
            else {
            print(variableOfStringtype)
            }
        }
        else if self is [Int] {
            var variableOfInttype: Int = 0
            for flag in self {
                variableOfInttype = combine(variableOfInttype, (flag as! Int))
            }
            if (variableOfInttype == nil) {
                print("Array is empty")
            }
            else {
                print(variableOfInttype)
            }
        }
    }
}

//extension Array: Combining {}
//typealias combination = Numeric & Combining



//extension Collection where Element: Numeric {
// var combine: Element { return reduce(0, +) }
// }
//let arrayInt = [1, 2]
//let total = arrayInt.combine
//print(total)
////
let arrayInt = [1,2]
arrayInt.concat()
let arrayStr = ["Utkarsh", "Patel", "is", "doing", "assignment", "of", "protocol"]
arrayStr.concat()
let emptyArrayOfString = [String]()
emptyArrayOfString.concat()
let emptyArrayOfInt = [Int]()
emptyArrayOfInt.concat()

//let combo = arrayStr.combine
//extension Array : Combining , Combining
//{
//    func addingtoArray () -> Any
//    {
//     if (self is [String])
//     {
//        var temp : String = ""
//        for new in self
//     {
//        temp = temp + new as! String
//    }
//        }
//}
//}
//


/*
if (arrayStr != nil) {
let joined = arrayStr.joined(separator: " ")
print(joined)
}
else {
print("Array is empty")
}
*/











//<------------------------------------------------------------------------------------------------------------------------------------------->


extension Date {
    func localizedDescription(dateStyle: DateFormatter.Style = .medium,
                              timeStyle: DateFormatter.Style = .medium,
                              in timeZone : TimeZone = .current,
                              locale   : Locale = .current) -> String {
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
       
        return Formatter.date.string(from: self)
        
    }
    var localizedDescription: String { return localizedDescription() }
}
//extension TimeZone {
//    static let gmt = TimeZone(secondsFromGMT: 0)!
//}
extension Formatter {
    static let date = DateFormatter()
}

//Date().localizedDescription                                                // "Sep 26, 2018 at 12:03:41 PM"
//Date().localizedDescription(in: .gmt)                                      // "Sep 26, 2018 at 3:03:41 PM" UTC TIME
Date().localizedDescription(dateStyle: .short, timeStyle: .short)          //  "9/26/18, 12:03 PM"
//Date().localizedDescription(dateStyle: .full, timeStyle: .full)            //  "Wednesday, September 26, 2018 at 12:03:41 PM Brasilia Standard Time"
//Date().localizedDescription(dateStyle: .full, timeStyle: .full, in: .gmt)


extension Date {
//    var fullDate:  String { return localizedDescription(dateStyle: .full, timeStyle: .none)  }
    var shortDate: String { return localizedDescription(dateStyle: .short, timeStyle: .none)  }
//    var fullTime:  String { return localizedDescription(dateStyle: .none, timeStyle: .full)  }
//    var shortTime: String { return localizedDescription(dateStyle: .none, timeStyle: .short)   }
//    var fullDateTime:  String { return localizedDescription(dateStyle: .full, timeStyle: .full)  }
//    var shortDateTime: String { return localizedDescription(dateStyle: .short, timeStyle: .short)  }
//}
}
//print(Date().fullDate)  // "Friday, May 26, 2017\n"
print(Date().shortDate)  // "5/26/17\n"

//print(Date().fullTime)  // "10:16:24 AM Brasilia Standard Time\n"
//print(Date().shortTime)  // "10:16 AM\n"
//
//print(Date().fullDateTime)  // "Friday, May 26, 2017 at 10:16:24 AM Brasilia Standard Time\n"
//print(Date().shortDateTime)
extension Date {
    
    func getDateInMMDDYY() -> String {
        let dateFormatter = DateFormatter()
      //  dateFormatter.dateFormat = "MM/dd/yyy"
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

var date = Date()
//print(date)
print(date.getDateInMMDDYY())

