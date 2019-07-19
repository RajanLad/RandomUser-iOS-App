//
//  UserFile.swift
//  JsonProj
//
//  Created by epita on 05/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import Foundation
struct UserBase: Codable {
    let results: [RandomUserDet]
}
struct RandomUserDet : Codable
{
    let gender :String
    let name: Name
    let location : Location
    let email :String
    let phone:String
    let cell:String
    let picture:Picture
}
struct Name: Codable{
    let title:String
    let first: String
    let last: String
}

struct Location : Codable
{
    let street : String
    let city : String
}
struct Picture : Codable
{
    let large : String
}
