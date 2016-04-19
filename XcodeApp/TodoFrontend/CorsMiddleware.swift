//
//  CorsMiddleware.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//

import Zewo


struct CorsMiddleware: Middleware {
    func respond(to request: Request, chainingTo chain: Responder) throws -> Response {
        var response = try chain.respond(to: request)
        response.headers.headers["access-control-allow-origin"] = Header("*")
        return response
    }
}
