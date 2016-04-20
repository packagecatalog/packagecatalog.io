//
//  PackageListRouter.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//

//import Zewo
import Router

public struct PackageListRouter {
    
    static func getNameParameter(from request: Request) -> String {
        guard let nameString = request.pathParameters["name"] else { return "" }
        return nameString
    }
    
    public static func getRouter() -> Router {
        return Router() { route in
            
            let packageDatasource = PackageDatasource()
            
            route.get("/") { request in
                var structuredPackages = [StructuredData]()
                for package in packageDatasource.getAll() {
                    structuredPackages.append(package.structuredData)
                }
                return Response(status: .ok, content: StructuredData.from(structuredPackages))
            }
            
            route.get("/author/:name") { request in
                var structuredPackages = [StructuredData]()
                
                for package in packageDatasource.getAuthor(by: PackageListRouter.getNameParameter(from: request)) {
                    structuredPackages.append(package.structuredData)
                }
                return Response(status: .ok, content: StructuredData.from(structuredPackages))
            }
            
            route.post("/") { request in
                guard let content = request.content else { return Response() }
                guard var package = PackageModel.makeWith(structuredData: content) else { return Response() }
                
                let newId = packageDatasource.create(package: package)
                
                guard let newPackage = packageDatasource.get(by: newId) else {
                    return Response()
                }
                
                //        co {
//                do {
//                    var uri = try URI(newPackage.url)
//                    uri = URI(host: uri.host, port: 443, path:uri.path, scheme: uri.scheme)
//                    let client = try Client(connectingTo: uri)
//                    let response = try client.get(uri.description)
//                    print(response.body)
//                }
//                catch {
//                    print("Error!")
//                }
                //        }
                
                return Response(status: .ok, content: newPackage)
            }
            
            route.delete("/") { request in
                packageDatasource.deleteAll()
                return Response()
            }
            
        }
    }
}