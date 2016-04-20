//
//  PackageDatasource.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//
import Zewo

struct PackageDatasource {
    
    static var packages = [Int: PackageModel]()
    
    func getAll() -> [PackageModel] {
        var allPackages = [PackageModel]()
        for (_, package) in PackageDatasource.packages {
            allPackages.append(package)
        }
        return allPackages
    }
    
    func create(package: PackageModel) -> Int {
        let id = PackageDatasource.packages.count
        var _package = package
        _package.id = id
        PackageDatasource.packages[id] = _package
        return id
    }
    
    func deleteAll() {
        PackageDatasource.packages = [Int: PackageModel]()
    }
    
    func get(by id: Int) -> PackageModel? {
        return PackageDatasource.packages[id]
    }
    
    func getAuthor(by name: String) -> [PackageModel] {
        var packages = [PackageModel]()
        for (_, package) in PackageDatasource.packages {
            if package.author == name {
                packages.append(package)
            }
        }
        return packages
    }
    
}
