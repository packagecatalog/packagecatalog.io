//
//  PackageModel.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//
import Zewo

struct PackageModel: Mappable, StructuredDataRepresentable {
    var id: Int?
    var title: String?
    var url: String
    var author: String?
    var pending: Bool = true
    var license: String?
    var major: Int?
    var minor: Int?
    var overviewDescription: String?
    
    init(mapper: Mapper) throws {
        self.id = mapper.map(optionalFrom: "id")
        self.title = mapper.map(optionalFrom: "title")
        self.url = try mapper.map(from: "url")
        self.author = mapper.map(optionalFrom: "author")
        self.license = mapper.map(optionalFrom: "license")
        self.major = mapper.map(optionalFrom: "major")
        self.minor = mapper.map(optionalFrom: "minor")
        self.overviewDescription = mapper.map(optionalFrom: "overview")
    }
    
    var structuredData: StructuredData {
        get {
            return [
                       "id": StructuredData.from(id ?? 0),
                       "title": StructuredData.from(title ?? ""),
                       "url": StructuredData.from(url),
                       "pending": StructuredData.from(pending),
                       "author": StructuredData.from(author ?? ""),
                       "license": StructuredData.from(license ?? ""),
                       "major": StructuredData.from(major ?? 0),
                       "minor": StructuredData.from(minor ?? 0),
                       "overview": StructuredData.from(overviewDescription ?? ""),
            ]
        }
    }
}