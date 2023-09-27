//
//  Issue.swift
//  RxMoyaExample
//
//  Created by Obde Willy on 27/02/23.
//

import Mapper

struct Issue: Mappable {
    
    let identifier: Int
    let number: Int
    let title: String
    let body: String
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try number = map.from("number")
        try title = map.from("title")
        try body = map.from("body")
    }
}
