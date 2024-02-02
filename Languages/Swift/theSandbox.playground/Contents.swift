struct Engine {
    var engineID: String?
}

enum Locat: String {
    case first
}

let amazon = Engine(engineID: "amazondotcom")
let custom = Engine(engineID: nil)

let extra = [
    "locat": Locat.first,
    "engine": custom.engineID as Any
] as [String: Any]

if let locat = extra["locat"] as? Locat,
   let engine = extra["engine"] as? String? {
    print(locat.rawValue)
    print(engine ?? "customisz")
}

print(custom.engineID ?? "customizeeee")
