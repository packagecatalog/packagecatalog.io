//
//  SinglePackageRouter.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//
import Router

public struct SinglePackageRouter {
    public static func getRouter() -> Router {
        return Router() { route in
            
            let packageDatasource = PackageDatasource()
            
            route.get("/") { request in
                let index = getIdParameter(from:request)
                guard let package: PackageModel = packageDatasource.get(by: index) else { return Response() }
                
                return Response(status: .ok, content: package)
            }
            
        }
    }
}