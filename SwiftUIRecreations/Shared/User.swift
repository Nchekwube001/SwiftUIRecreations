//
//  User.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import Foundation



/// Users Response
struct UsersArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable,Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
    let role: Role
    
    
    static var Mock :User {
        User(
            id: 1222,
            firstName: "String",
            lastName: "String",
            maidenName: "String",
            age:23,
            gender: .male,
            email: "String",
            phone: "String",
            username: "String",
            password: "String",
            birthDate: "String",
            image: "String",
            bloodGroup: "String",
            height: 23,
            weight: 123,
            eyeColor: "String",
            macAddress: "String",
            university: "String",
            ein: "String",
            ssn: "String",
            userAgent: "String",
            role: .admin
        )
    }
}



enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}



enum Role: String, Codable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}
