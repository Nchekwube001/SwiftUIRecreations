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

struct User: Codable {
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
