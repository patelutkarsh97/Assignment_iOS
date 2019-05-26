//
//  empList.swift
//  EndGame
//
//  Created by Utkarsh Patel on 24/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation
typealias JSON = [String: Any]
//struct Emp: Decodable {
//    var empID: String
//    var empName: String
//    var empSalary: String
//    var empAge: String
//    var empImage: String
//}
//extension Emp {
//    init(json:JSON) {
//        self.empID = json["id"] as! String
//        self.empName = json["employee_name"] as! String
//        self.empSalary = json["employee_salary"] as! String
//        self.empAge = json["employee_age"] as! String
//        self.empImage = json["profile_image"] as! String
//    }
//}
struct Employee:Decodable {
    var id:String
    var employee_name:String
    var employee_salary:String
    var employee_age:String
    var profile_image:String
}
extension Employee{
    init(json:JSON) {
        self.id = json["id"] as! String
        self.employee_name = json["employee_name"] as! String
        self.employee_age = json["employee_age"] as! String
        self.employee_salary = json["employee_salary"] as! String
        self.profile_image = json["profile_image"] as! String
    }
}
