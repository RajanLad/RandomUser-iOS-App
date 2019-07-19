//
//  RandomUser.swift
//  JsonProj
//
//  Created by epita on 05/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import Foundation

struct UserBase: Codable {
    let results: RandomUserDet
}
struct RandomUserDet : Codable
{
    let gender :String
    let name: Name
}
struct Name: Codable{
    let title:String
    let first: String
    let last: String
}
