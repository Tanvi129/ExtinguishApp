//
//  TaskModel.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import Foundation

struct Task{
    var taskID : String
    var Name : String
    var managerAssigned : Manager?
    var auditorAssigned : Auditor?
    var date : Date
    var sessionStart : String
    var sessionEnd : String
    var distributorDetails : DistributorDetails
    var companyDetails : CompanyDetails
    var subtaskList : [Subtask]?
    
}
