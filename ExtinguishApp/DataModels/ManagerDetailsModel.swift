//
//  ManagerDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Manager : Identifiable, Decodable  {
    
    var id: Int?
    var age: Int
    var managerId : Int
    var profilePic : String?
    var gender : Int
    var name : String
    var phoneNumber : String?
    var email: String
    var address: String
    var password: String
//    var taskList : [TaskModel]?
//    var auditorList : [Auditor]?
}
