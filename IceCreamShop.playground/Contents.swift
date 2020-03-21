struct Flavor {
    var name: String
    var rating: Int
    
}

enum Size: String {
    case small
    case medium
    case large
}

let small = 3.99
let medium = 4.49
let large = 4.99

struct Cone {
    let flavor: String
    let topping: String
    let size: Size
}

let myCone = Cone(flavor: "chocolate", topping: "chcolateSyrup", size: .medium)


func eat() {
   print("I love my \(myCone)")
}

class IceCreamShop {
    
}
