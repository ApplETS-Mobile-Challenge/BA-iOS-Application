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
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 4, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user2 = User(id: 1, username: "jajex", name: "Croix-Rouge", photo: "croix-rouge", rating: 3.2, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user3 = User(id: 1, username: "jajex", name: "Héma-Qc", photo: "hema-qc", rating: 3.4, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user4 = User(id: 1, username: "jajex", name: "Samuel", photo: "samael", rating: 4.3, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user5 = User(id: 1, username: "jajex", name: "Maxime", photo: "maxime", rating: 2.3, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user6 = User(id: 1, username: "jajex", name: "Lys", photo: "alyss", rating: 3.8, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user7 = User(id: 1, username: "jajex", name: "Rich", photo: "rich", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])

        let gd1 = GoodDeed(id: 1, title: "Action Bénévole", description: "Chaque année, nous avons besoin de plusieurs bénévoles pour nous aider dans nos projets.", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: -73.560761, lat: 45.495310)
        let gd2 = GoodDeed(id: 1, title: "Croix-Rouge, réfugiés Syriens", description: "Nous sommes à la recherche de bénévoles pour nous aider à la distribution de nourriture non-périssable.", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: -73.561008, lat: 45.493310)
        let gd3 = GoodDeed(id: 1, title: "Aide mathématiques de mon fils", description: "Il a beaucoup de la difficulté à l'école et a besoin de quelqu'un de compétant pour l'aider à faire des multiplications.", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: -73.558508, lat: 45.494498)
        let gd4 = GoodDeed(id: 1, title: "Fondation Martin Matte", description: "Nous cherchons des bénévoles pour nous aider à faire du porte à porte.", address: "Montréal QC Canada", startDate: NSDate.changeDaysBy(-7), endDate: NSDate.changeDaysBy(-5), creator: user5, long: -73.563991, lat: 45.510398)
        let gd5 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user6, long: 45.4963, lat: -73.5621)
        let gd6 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user7, long: 45.4963, lat: -73.5621)
        let gd7 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd8 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd9 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd10 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user5, long: 45.4963, lat: -73.5621)
        let gd11 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user6, long: 45.4963, lat: -73.5621)
        let gd12 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user7, long: 45.4963, lat: -73.5621)
        let gd13 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd14 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd15 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user5, long: 45.4963, lat: -73.5621)
        
        user1.goodDeeds.append(gd1)
        user1.goodDeeds.append(gd2)
        user1.goodDeeds.append(gd3)
        user1.goodDeeds.append(gd4)
        
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
    
    func getUser2(callback: (User) -> Void) {
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user2 = User(id: 1, username: "jajex", name: "Croix-Rouge", photo: "croix-rouge", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user3 = User(id: 1, username: "jajex", name: "Héma-Qc", photo: "hema-qc", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user4 = User(id: 1, username: "jajex", name: "Mathematique", photo: "math", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let gd1 = GoodDeed(id: 1, title: "Action Bénévole", description: "Chaque année, nous avons besoin de plusieurs bénévoles pour nous aider dans nos projets.", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: -73.560761, lat: 45.495310)
        let gd2 = GoodDeed(id: 1, title: "Croix-Rouge, réfugiés Syriens", description: "Nous sommes à la recherche de bénévoles pour nous aider à la distribution de nourriture non-périssable.", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.561008, lat: 45.493310)
        let gd3 = GoodDeed(id: 1, title: "Aide mathématiques de mon fils", description: "Il a beaucoup de la difficulté à l'école et a besoin de quelqu'un de compétant pour l'aider à faire des multiplications.", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.558508, lat: 45.494498)
        let gd4 = GoodDeed(id: 1, title: "Fondation Martin Matte", description: "Nous cherchons des bénévoles pour nous aider à faire du porte à porte.", address: "Montréal QC Canada", startDate: NSDate.changeDaysBy(-7), endDate: NSDate.changeDaysBy(-5), creator: user2, long: -73.563991, lat: 45.510398)
        let gd5 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd6 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd7 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd8 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd9 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd10 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd11 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd12 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd13 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd14 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd15 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        
        user2.goodDeeds.append(gd1)
        user2.goodDeeds.append(gd2)
        user2.goodDeeds.append(gd3)
        user2.goodDeeds.append(gd4)
        
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
        
        callback(user2)
        
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
        
        let user2 = User(id: 1, username: "ririche", name: "Richer", photo: "rich", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user3 = User(id: 1, username: "ririche", name: "Samuel", photo: "samael", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user4 = User(id: 1, username: "ririche", name: "Maxime", photo: "maxime", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user5 = User(id: 1, username: "ririche", name: "Alyssa", photo: "alyss", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user6 = User(id: 1, username: "croixrouge", name: "Croix Rouge", photo: "croix-rouge", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        let user7 = User(id: 1, username: "ririche", name: "Héma QC", photo: "hema-qc", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        users.append(user6)
        users.append(user7)
        callback(users)
    }
    
    func getGoodDeeds() -> [GoodDeed] {
        var goodDeed : [GoodDeed] = []
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user2 = User(id: 1, username: "jajex", name: "Croix-Rouge", photo: "croix-rouge", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user3 = User(id: 1, username: "jajex", name: "Héma-Qc", photo: "hema-qc", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user4 = User(id: 1, username: "jajex", name: "Mathematique", photo: "math", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let gd1 = GoodDeed(id: 1, title: "Action Bénévole", description: "Chaque année, nous avons besoin de plusieurs bénévoles pour nous aider dans nos projets.", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.560761, lat: 45.495310)
        let gd2 = GoodDeed(id: 1, title: "Croix-Rouge, réfugiés Syriens", description: "Nous sommes à la recherche de bénévoles pour nous aider à la distribution de nourriture non-périssable.", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.561008, lat: 45.493310)
        let gd3 = GoodDeed(id: 1, title: "Aide mathématiques de mon fils", description: "Il a beaucoup de la difficulté à l'école et a besoin de quelqu'un de compétant pour l'aider à faire des multiplications.", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.558508, lat: 45.494498)
        let gd4 = GoodDeed(id: 1, title: "Fondation Martin Matte", description: "Nous cherchons des bénévoles pour nous aider à faire du porte à porte.", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: -73.563991, lat: 45.510398)
        let gd5 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd6 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd7 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd8 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd9 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd10 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd11 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        let gd12 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user4, long: 45.4963, lat: -73.5621)
        let gd13 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: 45.4963, lat: -73.5621)
        let gd14 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user2, long: 45.4963, lat: -73.5621)
        let gd15 = GoodDeed(id: 1, title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, adipiscing elit. Cras vel metus in lorem sodales eleife", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user3, long: 45.4963, lat: -73.5621)
        
        goodDeed.append(gd1)
        goodDeed.append(gd2)
        goodDeed.append(gd3)
        goodDeed.append(gd4)
        goodDeed.append(gd5)
        goodDeed.append(gd6)
        goodDeed.append(gd7)
        goodDeed.append(gd8)
        goodDeed.append(gd9)
        goodDeed.append(gd10)
        goodDeed.append(gd11)
        goodDeed.append(gd12)
        goodDeed.append(gd13)
        goodDeed.append(gd14)
        goodDeed.append(gd15)
        
        return goodDeed
    }
    
    func getOffers() -> [Participation] {
        var offers : [Participation] = []
        
        let user1 = User(id: 1, username: "jajex", name: "Vincent", photo: "vincent", rating: 4, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user2 = User(id: 1, username: "jajex", name: "Croix-Rouge", photo: "croix-rouge", rating: 3.2, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user3 = User(id: 1, username: "jajex", name: "Héma-Qc", photo: "hema-qc", rating: 3.4, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user4 = User(id: 1, username: "jajex", name: "Samuel", photo: "samael", rating: 4.3, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user5 = User(id: 1, username: "jajex", name: "Maxime", photo: "maxime", rating: 2.3, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user6 = User(id: 1, username: "jajex", name: "Lys", photo: "alyss", rating: 3.8, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let user7 = User(id: 1, username: "jajex", name: "Rich", photo: "rich", rating: 5, description: "Lorem ipsum dolor sit amet, adipiscing elit.", participations: [], goodDeeds: [])
        
        let gd1 = GoodDeed(id: 1, title: "Action Bénévole", description: "Chaque année, nous avons besoin de plusieurs bénévoles pour nous aider dans nos projets.", address: "1001 Rue De la gauchetière O Montréal QC H3B 2P7 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.560761, lat: 45.495310)
        let gd2 = GoodDeed(id: 1, title: "Croix-Rouge, réfugiés Syriens", description: "Nous sommes à la recherche de bénévoles pour nous aider à la distribution de nourriture non-périssable.", address: "970 Rue Notre-Dame O Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.561008, lat: 45.493310)
        let gd3 = GoodDeed(id: 1, title: "Aide mathématiques de mon fils", description: "Il a beaucoup de la difficulté à l'école et a besoin de quelqu'un de compétant pour l'aider à faire des multiplications.", address: "1360 Rue Saint-Jacques Montréal QC H3C 4M4 Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.558508, lat: 45.494498)
        let gd4 = GoodDeed(id: 1, title: "Fondation Martin Matte", description: "Nous cherchons des bénévoles pour nous aider à faire du porte à porte.", address: "Montréal QC Canada", startDate: NSDate(), endDate: NSDate(), creator: user1, long: -73.563991, lat: 45.510398)
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
        let pr5 = Participation(id: 1, goodDeed: gd5, status: Status.OK, user: user6)
        let pr6 = Participation(id: 1, goodDeed: gd6, status: Status.OK, user: user7)
        let pr7 = Participation(id: 1, goodDeed: gd7, status: Status.OK, user: user2)
        let pr8 = Participation(id: 1, goodDeed: gd8, status: Status.OK, user: user3)
        let pr9 = Participation(id: 1, goodDeed: gd9, status: Status.OK, user: user4)
        let pr10 = Participation(id: 1, goodDeed: gd10, status: Status.Pending, user: user5)
        let pr11 = Participation(id: 1, goodDeed: gd11, status: Status.Pending, user: user6)
        let pr12 = Participation(id: 1, goodDeed: gd12, status: Status.Pending, user: user7)
        let pr13 = Participation(id: 1, goodDeed: gd13, status: Status.Pending, user: user2)
        let pr14 = Participation(id: 1, goodDeed: gd14, status: Status.Pending, user: user3)
        let pr15 = Participation(id: 1, goodDeed: gd15, status: Status.Pending, user: user4)
        
        offers.append(pr1)
        offers.append(pr2)
        offers.append(pr3)
        offers.append(pr4)
        offers.append(pr5)
        offers.append(pr6)
        offers.append(pr7)
        offers.append(pr8)
        offers.append(pr9)
        offers.append(pr10)
        offers.append(pr11)
        offers.append(pr12)
        offers.append(pr13)
        offers.append(pr14)
        offers.append(pr15)
        
        return offers
    }

}