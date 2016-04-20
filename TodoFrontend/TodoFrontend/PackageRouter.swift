//
//  PackageRouter.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//
import Router
import Venice
import HTTPSClient

public struct PackageRouter {
    public static func getRouter() -> Router {
        return Router() { route in
            
            let packageDatasource = PackageDatasource()
            
            
            route.post("/") { request in
                guard let content = request.content else { return Response() }
                for packageData in try content.asArray() {
                    guard let package = PackageModel.makeWith(structuredData: packageData) else { return Response() }
                    
                    let newId = packageDatasource.create(package: package)
                    
//                    co {
                        do {
                            var uri = try URI(package.url)
                            print("host: \(uri.host), port: 443, path:\(uri.path), scheme: \(uri.scheme)")
                            uri = URI(host: uri.host, port: 443, path:"/Zewo/URI", scheme: uri.scheme)
                            let client = try HTTPSClient.Client(uri: uri)
                            let response = try client.get(uri.description)
                            print(response.body)
                        }
                        catch {
                            print("Error!")
                        }
//                    }

                    
//                    print(newId)
                }
//                guard var package = PackageModel.makeWith(structuredData: content) else { return Response() }
//                
//                let newId = packageDatasource.create(package: package)
//
//                guard let newPackage = packageDatasource.get(by: newId) else {
//                    return Response()
//                }
                
//                        co {
//                                do {
//                                    var uri = try URI(newPackage.url)
//                                    uri = URI(host: uri.host, port: 443, path:uri.path, scheme: uri.scheme)
//                                    let client = try Client(connectingTo: uri)
//                                    let response = try client.get(uri.description)
//                                    print(response.body)
//                                }
//                                catch {
//                                    print("Error!")
//                                }
//                        }
                
                return Response(status: .ok)
            }

            
        }
    }
}