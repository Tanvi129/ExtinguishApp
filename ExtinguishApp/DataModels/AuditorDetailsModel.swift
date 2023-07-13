//
//  AuditorDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Auditor : Identifiable, Decodable {
    var id: Int?
    var profile_pic : ProfilePic?
    var auditorId : Int
    var name : String
    var age : Int
    var gender : String
    var address : String
    var phoneNumber : String
    var email: String
    var managerId : Int
    var location : loc
    var password : String
//    var assignedTasks : [TaskModel]?
    
}

struct ProfilePic : Decodable {
    var type : String
    var data : [Int]
}
