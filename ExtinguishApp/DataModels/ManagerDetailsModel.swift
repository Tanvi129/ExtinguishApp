//
//  ManagerDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Manager :  Decodable {
    
    var managerID : Int
    var profilePic : String?
    var name : String
    var phoneNumber : String?
    var email: String
//    var taskList : [TaskModel]?
//    var auditorList : [Auditor]?
}
