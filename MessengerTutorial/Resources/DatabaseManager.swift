//
//  DatabaseManager.swift
//  MessengerTutorial
//
//  Created by Olya on 24.05.2022.
//

import Foundation
import FirebaseDatabase

//singleton
final class DatabaseManager{

    static let shared = DatabaseManager()

    private let database = Database.database().reference()

}

// acc managment

extension DatabaseManager{

    public func userExists(with email: String,
                           completetion: @escaping ((Bool) -> Void)){

        var safeEmail = email.replacingOccurrences(of: ".",
                                                   with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@",
                                                   with: "-")

        database.child(safeEmail).observeSingleEvent(of: .value,
                                                 with: { snapshot in
            guard snapshot.value as? String != nil else {
                completetion(false)
                return
            }

            completetion(true)
        })
    }

    /// Insert new user to database
    public func insertUser(with user: ChatAppUser){
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddess: String

    var safeEmail: String{
        var safeEmail = emailAddess.replacingOccurrences(of: ".",
                                                   with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@",
                                                   with: "-")
        return safeEmail
    }
    //let profilePictureUrl: String
}
