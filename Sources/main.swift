import Kitura
import KituraNet
import KituraSys

import LoggerAPI
import HeliumLogger
import PutStuffHere
import KituraTemplateEngine

#if os(Linux)
    import Glibc
#endif

import Foundation


let router = Router()
router.setTemplateEngine(PutStuffHere())

router.get("/") {
	request, response, next in
	defer {
		next()
	}
	do {
		let context : [String : Any] = [
			"title": "Some title",
			"graf": "<em>Really</em> great."
		]
		try response.render("test", context: context).end()
	} catch {
		Log.error("Failed to render template \(error)")
	}
}

let server = HttpServer.listen(8090, delegate: router)
Server.run()
