//
//  UserRequest.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserRequest: BaseRequest {
    
    class var sharedInstance: UserRequest {
        struct Singleton {
            static let instance = UserRequest()
        }
        return Singleton.instance
    }
    
    // Exemple pour faire les requêtes
    func getUser(callback: (User) -> Void) {
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])

        
        let today = NSDate()
        let start = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 1,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let end = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 2,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
        let gd1 = GoodDeed(id: 1, title: "Balayeuse", description: "Faire la balayeuse chez moi svp", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: start!, endDate: end!, creator: user1, long: -73.560761, lat: 45.495310)
        
        let gd2 = GoodDeed(id: 1, title: "Réparer mon bain", description: "Il coule", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: start!, endDate: end!, creator: user1, long: -73.561008, lat: 45.493310)
        
        let gd3 = GoodDeed(id: 1, title: "Laver mon chien", description: "Il est plein de poux", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: start!, endDate: end!, creator: user1, long: -73.558508, lat: 45.494498)
        
        let gd4 = GoodDeed(id: 1, title: "Réparation", description: "Réparation pour une toiture", address: "Montréal QC Canada", startDate: start!, endDate: end!, creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd5 = GoodDeed(id: 1, title: "Aide pour déménagement", description: "Aide pour déménagement", address: "Montréal QC Canada", startDate: start!, endDate: end!, creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd6 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Bénévolat à la Croix Rouge", address: "Montréal QC Canada", startDate: start!, endDate: end!, creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd7 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Don de sang", address: "Montréal QC Canada", startDate: start!, endDate: end!, creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd8 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd9 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd10 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd11 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd12 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd13 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd14 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let gd15 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        user1.goodDeeds.append(gd1)
        user1.goodDeeds.append(gd2)
        user1.goodDeeds.append(gd3)
        
        let pr1 = Participation(id: 1, goodDeed: gd1, status: Status.OK, user: user1)
        let pr2 = Participation(id: 1, goodDeed: gd2, status: Status.OK, user: user1)
        let pr3 = Participation(id: 1, goodDeed: gd3, status: Status.OK, user: user1)
        let pr4 = Participation(id: 1, goodDeed: gd4, status: Status.OK, user: user1)
        let pr5 = Participation(id: 1, goodDeed: gd5, status: Status.OK, user: user1)
        let pr6 = Participation(id: 1, goodDeed: gd6, status: Status.OK, user: user1)
        let pr7 = Participation(id: 1, goodDeed: gd7, status: Status.OK, user: user1)
        let pr8 = Participation(id: 1, goodDeed: gd8, status: Status.OK, user: user1)
        let pr9 = Participation(id: 1, goodDeed: gd9, status: Status.OK, user: user1)
        let pr10 = Participation(id: 1, goodDeed: gd10, status: Status.Pending, user: user1)
        let pr11 = Participation(id: 1, goodDeed: gd11, status: Status.Pending, user: user1)
        let pr12 = Participation(id: 1, goodDeed: gd12, status: Status.Pending, user: user1)
        let pr13 = Participation(id: 1, goodDeed: gd13, status: Status.Pending, user: user1)
        let pr14 = Participation(id: 1, goodDeed: gd14, status: Status.Pending, user: user1)
        let pr15 = Participation(id: 1, goodDeed: gd15, status: Status.Pending, user: user1)
        
        
        user1.participations.append(pr1)
        user1.participations.append(pr2)
        user1.participations.append(pr3)
        user1.participations.append(pr4)
        user1.participations.append(pr5)
        user1.participations.append(pr6)
        user1.participations.append(pr7)
        user1.participations.append(pr8)
        user1.participations.append(pr9)
        user1.participations.append(pr10)
        user1.participations.append(pr11)
        user1.participations.append(pr12)
        user1.participations.append(pr13)
        user1.participations.append(pr14)
        user1.participations.append(pr15)
        
        callback(user1) 
        
//        self.get("users/\(id)", parameters: nil) { (json: JSON?) in
//            if let data = json {
//                if data["user"] != nil {
//                    let user = User(json: data["user"])
//                    callback(user)
//                } else {
//                    callback(nil)
//                }
//            }
//        }
    }
    
    func getUsers(callback: ([User]) -> Void) {
        
        var users : [User] = []
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user2 = User(id: 1, username: "ririche", name: "Richer", photo: "vincent", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        
        users.append(user1)
        users.append(user2)
                callback(users)
    
    }
    
    func getOffers() -> [Participation] {
        let user1 = User(id: 1, username: "vincent", name: "Vincent", photo: "vincent", rating: 3.2, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user2 = User(id: 2, username: "samuel", name: "Samuel", photo: "samael", rating: 4.3, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user3 = User(id: 3, username: "maxime", name: "Maxime", photo: "maxime", rating: 3.4, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user4 = User(id: 4, username: "rich", name: "Rich", photo: "rich", rating: 4.1, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user5 = User(id: 5, username: "alyss", name: "Alyss", photo: "alyss", rating: 4.1, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let gd1 = GoodDeed(id: 1, title: "Balayeuse", description: "Faire la balayeuse chez moi svp", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.560761, lat: 45.495310)
        let gd2 = GoodDeed(id: 1, title: "Réparer mon bain", description: "Il coule", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.561008, lat: 45.493310)
        let gd3 = GoodDeed(id: 1, title: "Laver mon chien", description: "Il est plein de poux", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.558508, lat: 45.494498)
        let gd4 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd5 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd6 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd7 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd8 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd9 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd10 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd11 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd12 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd13 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd14 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd15 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        
        let pr1 = Participation(id: 1, goodDeed: gd1, status: Status.OK, user: user2)
        let pr2 = Participation(id: 1, goodDeed: gd2, status: Status.OK, user: user3)
        let pr3 = Participation(id: 1, goodDeed: gd3, status: Status.OK, user: user4)
        let pr4 = Participation(id: 1, goodDeed: gd4, status: Status.OK, user: user5)
        let pr5 = Participation(id: 1, goodDeed: gd5, status: Status.OK, user: user2)
        let pr6 = Participation(id: 1, goodDeed: gd6, status: Status.OK, user: user3)
        let pr7 = Participation(id: 1, goodDeed: gd7, status: Status.OK, user: user4)
        let pr8 = Participation(id: 1, goodDeed: gd8, status: Status.OK, user: user5)
        let pr9 = Participation(id: 1, goodDeed: gd9, status: Status.OK, user: user2)
        let pr10 = Participation(id: 1, goodDeed: gd10, status: Status.Pending, user: user3)
        let pr11 = Participation(id: 1, goodDeed: gd11, status: Status.Pending, user: user4)
        let pr12 = Participation(id: 1, goodDeed: gd12, status: Status.Pending, user: user5)
        let pr13 = Participation(id: 1, goodDeed: gd13, status: Status.Pending, user: user2)
        let pr14 = Participation(id: 1, goodDeed: gd14, status: Status.Pending, user: user3)
        let pr15 = Participation(id: 1, goodDeed: gd15, status: Status.Pending, user: user4)
        
        var participations : [Participation] = []
        participations.append(pr1)
        participations.append(pr2)
        participations.append(pr3)
        participations.append(pr4)
        participations.append(pr5)
        participations.append(pr6)
        participations.append(pr7)
        participations.append(pr8)
        participations.append(pr9)
        participations.append(pr10)
        participations.append(pr11)
        participations.append(pr12)
        participations.append(pr13)
        participations.append(pr14)
        participations.append(pr15)
        
        return participations
    }

}