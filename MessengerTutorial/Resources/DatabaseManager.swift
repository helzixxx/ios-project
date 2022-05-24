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

    public func test(){
        database.child("foo").setValue(["smth": true])
    }

}
