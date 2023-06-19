//
//  TaskModel.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import Foundation

struct TaskModel {
    var taskID : String
    var name : String
    var date : Date
    var location : String
    var taskStatus : Status
    var auditorAssigned : Auditor?
    var startTime : String
    var endTime : String
//    var expiredFrom : String
    var distributorDetails : DistributorDetails
    var companyDetails : CompanyDetails
    var subtask : [Subtask]?
    var proof : [String]?
    
    
}

enum Status {
    case completed
    case inProgress
    case unassigned
}
