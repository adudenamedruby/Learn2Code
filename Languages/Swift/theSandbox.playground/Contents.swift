import Cocoa

struct Tho {
    let enabled: Bool
}

var test = ["first": Tho(enabled: true), "second": Tho(enabled: false)]

var loofah = test.filter { key, value in
    value.enabled
}

print(loofah)
