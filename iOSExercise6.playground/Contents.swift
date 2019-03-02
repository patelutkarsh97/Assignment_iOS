import UIKit

var str = "Hello, it's Utkarsh's playground"

// 1. What is Error Protocol. Create a custom error conforming to error protocol.

enum ErrorReport : Error
{
    case invalid
}

    func studRecord(firstName: String?, surName: String?) throws -> String {
        guard firstName != nil
        else
       {
        throw ErrorReport.invalid
        }
        return "Full Name of developer is \(firstName!) \(String(describing: surName))"
    }


do
{
    try print(studRecord(firstName: "Utkarsh", surName: "Patel"))
}
catch
{
    print("First name is required: \(ErrorReport.invalid) attempt")
}


// 2. Write a failable initialiser for a class which throws an error  “Object not able to initialise” description a initialisationFailed case, Catch the error and print its error description.

enum CustomError : Error
{
    case invalid
}

class Greater {
    let num1: Int
    let num2: Int
    
    init?(num1: Int, num2: Int)
    {
        self.num1 = num1
        self.num2 = num2
    }
    
        func comparison()
        {
                do {
                
                    if (num1 > num2) {
                        print("\(num1) is greater than \(num2)")
                    }
                     else if (num2 > num1) {
                        print("\(num2) is greater than \(num1)")
                    }
                    else {
                        throw CustomError.invalid
                        }
                    }
                catch {
                   try print("Object not able to initialise - Comparison is not possible")
                    }
        
            }
            
        }

// Enter the integer value
let comp = Greater(num1: 0, num2: 0)
comp?.num1
comp?.num2
comp?.comparison()





// 3. Explain the difference try, try?, try! , make sure to write a program to explain the difference.


enum StudentError: Error {
    case invalid(String)
    case tooShort
}

class Student {
    var name: String?
    init(name: String?) throws {
        guard let name = name else{
            throw StudentError.invalid("Invalid")
        }
        self.name = name }
    
    func myName(str: String) throws -> String {
        
        guard str.count > 5
            else{
                throw StudentError.tooShort
        }
        
        return "My name is \(str)"
    }
}



do{
        let s1 = try Student(name: "Utkarsh")
        try s1.myName(str: "Utk")
    // * `try` is used with a do-catch statement and allows for a more detailed approach to error handling.
    
        let s2 = try? Student(name: "Utkarsh")
        try s2!.myName(str: "Utk")
    // * `try?`  **returns an optional type. If it throws an error, the result will be**  `nil`.
    // The question mark of the try? keyword gives us a subtle hint. If we use the try? keyword and an error is thrown, the error is handled by turning it into an optional value. This means that there is no need to wrap the throwing method call in a do-catch statement.
    
    
        let s3 = try! Student(name: "Utkarsh")
        try s3.myName(str: "Utk")
    // More dangerous is the use of try!. In Swift, an exclamation mark always serves as a warning sign. By appending an exclamation mark to the try keyword, error propagation is disabled.
    // * `try!` **returns a normal type. If the method/init throws an error, it will crash.**
    }
    
catch let error
{
    print(error)
}



// 4. Write a program which loads the data from a datasource of 10 employees looks like below, Program would help to give salary bonus to employees. Which is based on some conditions but if employee is not able to satisfy the condition program should throw the error with specific error condition and its description should be printed.



enum bonusDeduction : Error
{
    case EmployeeIsAbsent(String)
    case Competency(String)
    case NotCompleted1Year(String)
    case FakeEmployee(String)
    case Irregular(String)
}

struct Emp {
    let empID: Int
    let empName: String
    let empEmail: String
    let joiningDate: Int
    let isPresent: Bool
    let competency: String
    let attendancePercent: Double
}

var arrayOfEmp = [Emp]()
arrayOfEmp.append(Emp(empID: 001, empName: "Ankit", empEmail: "ankit@tothenew.com", joiningDate: 2016 , isPresent: true, competency: "iOS", attendancePercent: 92.05 ))
arrayOfEmp.append(Emp(empID: 002, empName: "Mithlesh", empEmail: "mithlesh@tothenew.com", joiningDate: 2017 , isPresent: true, competency: "FEEN", attendancePercent: 65.05 ))
arrayOfEmp.append(Emp(empID: 003, empName: "Sachin", empEmail: "sachin@tothenew.com", joiningDate: 2019 , isPresent: true, competency: "iOS", attendancePercent: 72.05 ))
arrayOfEmp.append(Emp(empID: 004, empName: "Merry", empEmail: "merry@tothenew.com", joiningDate: 2017 , isPresent: true, competency: "iOS", attendancePercent: 81.05 ))
arrayOfEmp.append(Emp(empID: 005, empName: "Sandeep", empEmail: "sandeep@tothenew.com", joiningDate: 2015 , isPresent: true, competency: "Android", attendancePercent: 79.05 ))
arrayOfEmp.append(Emp(empID: 006, empName: "Deepak", empEmail: "deepak@tothenew.com", joiningDate: 2016 , isPresent: true, competency: "iOS", attendancePercent: 55.05 ))
arrayOfEmp.append(Emp(empID: 007, empName: "Ajay", empEmail: "ajay@tothenew.com", joiningDate: 2017 , isPresent: true, competency: "JVM", attendancePercent: 64.05 ))
arrayOfEmp.append(Emp(empID: 008, empName: "Shivam", empEmail: "shivam@tothenew.com", joiningDate: 2018 , isPresent: true, competency: "iOS", attendancePercent: 88.05 ))
arrayOfEmp.append(Emp(empID: 009, empName: "Utkarsh", empEmail: "utkarsh@tothenew.com", joiningDate: 2019 , isPresent: true, competency: "iOS", attendancePercent: 82.05 ))
arrayOfEmp.append(Emp(empID: 010, empName: "Muskaan", empEmail: "muskaan@tothenew.com", joiningDate: 2017 , isPresent: false, competency: "iOS", attendancePercent: 68.05 ))

//print(arrayOfEmp)

class bonusProgram {
    
    func allowedForBonus (Email :String) throws
    {
        let currentYear = 2019
        var eligiblity = 0
        for emp in arrayOfEmp
        {
            if(Email == emp.empEmail)
            {
                if !emp.isPresent
                {
                    eligiblity = 0
                    throw bonusDeduction.EmployeeIsAbsent(" is absent today")
                }
                else
                {
                    eligiblity = 1
                }
                
                
                if (emp.competency == "iOS" || emp.competency == "Android" || emp.competency == "BigData" || emp.competency == "AI")
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw bonusDeduction.Competency("competency does not fall under bonus program.")
                }
                
                
                if( (currentYear - emp.joiningDate) > 0)
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw bonusDeduction.NotCompleted1Year(" still to complete a year with us")
                }
                
                
                if (emp.attendancePercent > 80)
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw bonusDeduction.Irregular("do not have attandance more then eighty percent")
                }
                if(eligiblity == 1)
                {
                    print(emp.empName ," is eligible for bonus.")
                }
                
            }
            
        } 
    }
}


var searchByEmail = bonusProgram()
do{
    try searchByEmail.allowedForBonus(Email: "muskaan@tothenew.com")
}
catch
{
    print(error)
}


do{
    try searchByEmail.allowedForBonus(Email: "mithlesh@tothenew.com")
}
catch
{
    print(error)
}


do{
    try searchByEmail.allowedForBonus(Email: "ankit@tothenew.com")
}
catch
{
    print(error)
}


do{
    try searchByEmail.allowedForBonus(Email: "sachin@tothenew.com")
}
catch
{
    print(error)
}


do{
    try searchByEmail.allowedForBonus(Email: "merry@tothenew.com")
}
catch
{
    print(error)
}











