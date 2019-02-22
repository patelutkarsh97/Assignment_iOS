import UIKit

var str = "Hello, it's Utkarsh's Playground"

// Session : iOS : An Introduction to Swift - THE BASICS

// 1. Create a third employee structure that contains the information from both based on common id.


struct Personal {
    var employeeID: Int
    var name: String
    var country: String
    var address: String
    var hobbies: String?
}

var array1 = [Personal]()

array1.append(Personal(employeeID: 001, name: "Aman", country: "America", address: "A-1", hobbies: "Swimming"))
array1.append(Personal(employeeID: 002, name: "Washim", country: "India", address: "B-1", hobbies: "Singing"))
array1.append(Personal(employeeID: 003, name: "Anuranjan", country: "Britain", address: "C-1", hobbies: "Cricket"))
array1.append(Personal(employeeID: 004, name: "Manjeet", country: "Japan", address: "D-1", hobbies: "Reading"))
array1.append(Personal(employeeID: 005, name: "Sarthak", country: "China", address: "E-1", hobbies: "Football"))

//print(array1)


struct Professional {
    var employeeID: Int
    var name: String
    var department: String
    var branch: String
    var experience: String
}

var array2 = [Professional]()

array2.append(Professional(employeeID: 001, name: "Aman", department: "iOS", branch: "America", experience: "1 year"))
array2.append(Professional(employeeID: 002, name: "Washim", department: "Android", branch: "India", experience: "2 year"))
array2.append(Professional(employeeID: 003, name: "Anuranjan", department: "JVM", branch: "Britain", experience: "3 year"))
array2.append(Professional(employeeID: 004, name: "Manjeet", department: "Full Stack", branch: "Japan", experience: "4 year"))
array2.append(Professional(employeeID: 005, name: "Sarthak", department: "Web", branch: "China", experience: "5 year"))


//print(array2)


struct Combined {
    var employeeID: Int
    var name: String
    var department: String
    var branch: String
    var experience: String
    var country: String
    var address: String
    var hobbies: String?
    
}

var newArray = [Combined]()
for id in 0...4 {
    for id1 in 0...id {
        
    if array1[id].employeeID == array2[id1].employeeID {
        
        newArray.append(Combined(employeeID: array2[id1].employeeID, name: array2[id1].name, department: array2[id1].department, branch: array2[id1].branch, experience: array2[id1].experience, country: array1[id1].country, address: array1[id1].address, hobbies: array1[id1].hobbies))

        }
    }
}

  print(newArray)





// 2. Write a function that takes the two structure and give me list of all the employee that live in certain country

func EmployeeOfSpecificCountry (country: String) -> String{
for emp1 in array1 {
    for emp2 in array2 {
        if (emp1.employeeID==emp2.employeeID && emp1.country==country) {
            print(emp1)
        }
    }
}
    return country
}
EmployeeOfSpecificCountry(country: "India")




// 3. write a function that give me list of all the employee that live in certain department


func EmployeeOfSpecificDepartment (department: String) -> String {
    for emp1 in array1 {
        for emp2 in array2 {
            if (emp1.employeeID == emp2.employeeID && emp2.department == department) {
                print(emp1)
            }
        }
    }
    return department
}
EmployeeOfSpecificDepartment(department: "Android")


// 4. write a function that give me list of all the employee that live in same country and work in the same branch.


func EmployeeLiveIn() {
    for emp1 in array1 {
        for emp2 in array2 {
            if (emp1.country == emp2.branch) {
                print("\(emp1) , \(emp2)")
            }
        }
    }
    return
}
EmployeeLiveIn()


// 5. write a function that return me list of all the employee name that has a hobby and with their experience.


func EmployeeWithHobby() {
    for emp in newArray {
            if (emp.hobbies != nil) {
                print("\(emp)")
        }
    }
    return
}

EmployeeWithHobby()


// 6. write a function that return me list of all the employee name that starts with any “S”


func EmployeeNameWithS() {
    for emp in newArray {
        if (emp.name.hasPrefix("S")) {
            print("\(emp)")
        }
    }
    return
}

EmployeeNameWithS()
