//
//  AuditorDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Auditor : Identifiable, Decodable {
    var id: Int?
    var profilePic : String?
    var auditorId : Int
    var name : String
    var address : String
    var phoneNumber : String
    var email: String
    var managerId : Int
    var location : String
    var age : Int
    var password : String
//    var assignedTasks : [TaskModel]?
    
}
