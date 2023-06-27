//
//  TaskModel.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import Foundation

struct TaskModel : Identifiable, Decodable {
    
    var id : Int?
    var taskId : Int
    var name : String
    var date : String
    var location : loc
    var taskStatus : Status
    var auditorAssigned : Int
    var managerAssigned : Int
    var startTime : String
    var endTime : String
//    var expiredFrom : String
    var distributorDetails : DistributorDetails
    var companyDetails : CompanyDetails
//    var subtask : [Subtask]?
    var proof : [String]?
    
    
}

enum Status : Int , Decodable {
    case unassigned
    case inProgress
    case completed
}

struct loc : Decodable {
    var latitude : Double
    var longitude : Double
}
