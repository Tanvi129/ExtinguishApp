//
//  StaticData.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 22/05/23.
//

import Foundation
//
//  DataModel.swift
//  Extinguish-New
//
//  Created by Thrishalini on 07/03/23.
//



import Foundation
import UIKit

class DataModel {
    private var auditorList: [Auditor]
    private var taskList:[Task]
    init(){
        auditorList = [
            Auditor(
                profilePic:"tanviProfilePic",
                empID: "12345",
                name: "Tanvi Gupta",
                phoneNumber: "9557146955",
                email: "tanvigupta129@gmail.com",
                location: "None"
            ),
            Auditor(profilePic: "vanshProfilePic",
                    empID: "12345",
                    name: "Vansh Agarwal",
                    phoneNumber: "9557146955",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   ),
            Auditor(profilePic: "profilepic1",
                    empID: "12345",
                    name: "Pratham Pandey",
                    phoneNumber: "9557146955",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   ),
            Auditor(profilePic: "thrishaProfilePic",
                    empID: "12345",
                    name: "Thrishalini",
                    phoneNumber: "9557146955",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   ),
            Auditor(profilePic: "sitanshuProfilePic",
                    empID: "12345",
                    name: "Sitanshu",
                    phoneNumber: "9557146955",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   ),
            Auditor(profilePic: "junaidProfilePic",
                    empID: "12345",
                    name: "Junaid",
                    phoneNumber: "88254128",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   ),
            Auditor(profilePic: "joshuaProfilePic",
                    empID: "12345",
                    name: "Joshua",
                    phoneNumber: "88254128",
                    email: "tanvigupta129@gmail.com",
                    location: "None"
                   )
        
            
        ]
        
        taskList = [
            Task(taskID: "XxzzYy", name: "Panda Task",date: Date(), location: "Mumbai", taskStatus: Status.inProgress,
                 auditorAssigned:
                    Auditor(
                        profilePic:"profilepic1",
                        empID: "RA2011026010175",
                        name: "Tanvi Gupta",
                        phoneNumber: "9557146955",
                        email: "tanvigupta129@gmail.com",
                        location: "None"
                 ),
                 startTime: "8:00 AM", endTime: "8:30 PM",
                 distributorDetails:
                    DistributorDetails(
                        distributorName: "Vansh Agarwal",
                        distributorContact: "9412436699",
                        distributorAddress: "Mumbai"),
                 companyDetails:
                    CompanyDetails(
                        companyName: "Cipla",
                        salesOfficerName: "Mr M P Gupta", salesOfficerContact: "9412436699")
            ),
            Task(taskID: "ZzxxyV", name: "Panda Task", date: Date(), location: "Mumbai", taskStatus: Status.unassigned, startTime: "8:00 AM", endTime: "8:30 PM", distributorDetails: DistributorDetails(distributorName: "Vansh Agarwal", distributorContact: "9412436699", distributorAddress: "Mumbai"), companyDetails: CompanyDetails(companyName: "Cipla", salesOfficerName: "Mr M P Gupta", salesOfficerContact: "9412436699")),
            Task(taskID: "WwCcztT", name: "Panda Task", date: Date(), location: "Mumbai", taskStatus: Status.completed, auditorAssigned: Auditor(
                profilePic:"profilepic1",
                empID: "RA2011026010176",
                name: "Tanvi Gupta",
                phoneNumber: "9557146955",
                email: "tanvigupta129@gmail.com",
                location: "None"
            ), startTime: "8:00 AM", endTime: "8:30 PM", distributorDetails: DistributorDetails(distributorName: "Vansh Agarwal", distributorContact: "9412436699", distributorAddress: "Mumbai"), companyDetails: CompanyDetails(companyName: "Cipla", salesOfficerName: "Mr M P Gupta", salesOfficerContact: "9412436699")),
            Task(taskID: "VvXXty", name: "Panda Task", date: Date(), location: "Mumbai", taskStatus: Status.completed, auditorAssigned: Auditor(
                profilePic:"profilepic1",
                empID: "RA2011026010177",
                name: "Tanvi Gupta",
                phoneNumber: "9557146955",
                email: "tanvigupta129@gmail.com",
                location: "None"
            ), startTime: "8:00 AM", endTime: "8:30 PM", distributorDetails: DistributorDetails(distributorName: "Vansh Agarwal", distributorContact: "9412436699", distributorAddress: "Mumbai"), companyDetails: CompanyDetails(companyName: "Cipla", salesOfficerName: "Mr M P Gupta", salesOfficerContact: "9412436699")
            )
            
        ]
    }
    func getAuditorList() -> [Auditor] {
        return auditorList
    }
    
    func getAuditorList(by index: Int) -> Auditor {
        return auditorList[index]
    }
    
    func getTaskList() -> [Task] {
        return taskList
    }
    
    func getTaskList(by index: Int) -> Task {
        return taskList[index]
    }
    
}
