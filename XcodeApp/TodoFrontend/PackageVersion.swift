//
//  PackageVersion.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//

import Zewo

struct PackageVersion: Mappable, StructuredDataRepresentable {
    var major: Int?
    var minor: Int?
    
    init(mapper: Mapper) throws {
        self.major = mapper.map(optionalFrom: "major")
        self.minor = mapper.map(optionalFrom: "minor")
    }
    
    var structuredData: StructuredData {
        get {
            return [
               "major": StructuredData.from(major ?? 0),
               "minor": StructuredData.from(minor ?? 0),
            ]
        }
    }
}