//
//  LoggedUser.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation

class AuthUser: User {
    class var sharedInstance: AuthUser {
        struct Singleton {
            static let instance = AuthUser(id: 1, username: "yan", name: "Yannick", photo: "rich", rating: 4.5, description: "Je suis disponible pour accomplir n'importe quel tâche", participations: [], goodDeeds: [])
        }
        return Singleton.instance
    }
    
    var pendingOffers: [Participation] = []
}