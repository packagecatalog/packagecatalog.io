import Zewo
import HTTPSClient
import Foundation




func getIdParameter(from request: Request) -> Int {
    guard let idString = request.pathParameters["id"] else { return 0 }
    return Int(idString) ?? 0
}

let contentNegotiationMiddleware = ContentNegotiationMiddleware(mediaTypes: [JSONMediaType()])

let router = Router(middleware: contentNegotiationMiddleware, CorsMiddleware()) { route in
    route.compose(path: "/api/packages", router: PackageListRouter.getRouter())
    route.compose(path: "/api/package", router: PackageRouter.getRouter())
    route.compose(path: "/api/package/:id", router: SinglePackageRouter.getRouter())
}



//co {
//    do {
//        try HTTPServer.Server(host: "0.0.0.0", port: 8080, reusePort: true, responder: FileResponder(path: "/Users/scottbyrns/Documents/Workspace/PackageCatalog/public/")).start()
////        try HTTPServer.Server(on: 8080, reusingPort: true, responder: FileResponder(path: "/Users/scottbyrns/Documents/Workspace/PackageCatalog/public/")).start()
//    }
//    catch {}
//}
//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
    // do some task
//    co {
        do {
            try HTTPServer.Server(host: "0.0.0.0", port: 8081, reusePort: true, responder: router).start()
        }
        catch {}
//    }

//}

//while(true){}
