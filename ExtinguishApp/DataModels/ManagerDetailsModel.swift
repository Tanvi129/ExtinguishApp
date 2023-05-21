//
//  ManagerDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Manager {
    var profilePic : String
    var empID : String
    var name : String
    var phoneNumber : String
    var email: String
    var taskList : [Task]?
    var auditorList : [Auditor]?
}
