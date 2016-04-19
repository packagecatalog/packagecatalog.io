import Zewo
import HTTPSClient





func getIdParameter(from request: Request) -> Int {
    guard let idString = request.pathParameters["id"] else { return 0 }
    return Int(idString) ?? 0
}

let contentNegotiationMiddleware = ContentNegotiationMiddleware(mediaTypes: [JSONMediaType()])

let router = Router(middleware: contentNegotiationMiddleware, CorsMiddleware()) { route in
    route.compose(path: "/api/packages", router: PackageListRouter.getRouter())
    route.compose(path: "/api/package/:id", router: PackageRouter.getRouter())
}



co {
    do {
        try HTTPServer.Server(on: 8081, reusingPort: true, responder: router).start()
    }
    catch {}
}

let con = try TCPConnection(to: "127.0.0.1", on: 8081)
try con.open()
do {
    try con.send(Data("asdf"))
}
catch {
    print("Failed!")
}

//co {
//    do {
//        try HTTPServer.Server(on: 8080, reusingPort: true, responder: FileResponder(path: "/Users/scottbyrns/Documents/Workspace/PackageCatalog/public/")).start()
//    }
//    catch {}
//}