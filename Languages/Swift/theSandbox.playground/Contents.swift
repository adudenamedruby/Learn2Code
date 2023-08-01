import Cocoa

class ShoppingProduct {
    var name: String
    
    var bingBong: Bool {
        return name.isEmpty
    }
    
    init(name: String) {
        self.name = name
    }
}

let string: URL? = URL(string: "https://macrumors.com")
let product = string.flatMap(ShoppingProduct.init)
let boolean = product?.bingBong

print(boolean)
