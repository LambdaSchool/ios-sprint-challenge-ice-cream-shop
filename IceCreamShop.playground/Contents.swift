//Aaron Cleveland

import UIKit

struct Flavor {
    let name: String
    var rating: Double
}

let chocolateChip = Flavor(name: "Chocolate Chip", rating: 4.3)
let vanilla = Flavor(name: "Vanilla", rating: 4.9)
let mintChocolate = Flavor(name: "Mint Chocolate", rating: 4.1)
let doubleChocolate = Flavor(name: "Double Chocolate", rating: 3.3)
let strawberry = Flavor(name: "Strawberry", rating: 2.0)

struct Cone {
    enum Size: Double {
        case small = 3.99
        case medium = 4.99
        case large = 5.99
    }
    
    var flavor: String
    var size: Size
    var topping: String?
    
    func eat() {
        print("Mmm! I love \(flavor)")
    }
}

let sizes: [Cone.Size] = [.small, .medium, .large]
let toppings: [String] = ["Chocolate Drizzle", "Caramel Drizzle", "Sprinkles", "Hot Fudge", "Oreos", "Peanut butter cups", "Whipped Cream"]

let newCone = Cone(flavor: mintChocolate.name, size: .small, topping: toppings[0])
newCone.eat()


class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Cone.Size]
    var toppings: [String]
    var totalSales: Double?
    
    init(flavors: [Flavor], sizes: [Cone.Size], toppings: [String]) {
        self.sizes = sizes
        self.flavors = flavors
        self.toppings = toppings
    }
    
    func listTopFlavors() {
        var favFlavors = String()
        
        for flavor in flavors {
            if flavor.rating >= 4.0 {
                favFlavors.append("\n \(flavor.name)")
            }
        }
        print("Our favorite flavors are: \(favFlavors)")
    }
    
    func orderCone(flavor: Flavor, topping: String?, size: Cone.Size) -> Cone {
        let newCone = Cone(flavor: flavor.name, size: size)
        var order = "Your order: \(newCone.flavor) "
        if let topping = topping {
            order += "with \(topping) in a \(newCone.size)! \nYour total: \(newCone.size.rawValue + 0.75)"
        } else {
            order += "in a \(newCone.size)! \nYour total: \(newCone.size.rawValue)"
        }
        print(order)
        return newCone
    }
}
let lambdaIceCreamShop = IceCreamShop(flavors: [chocolateChip, vanilla, mintChocolate, doubleChocolate, strawberry], sizes: sizes, toppings: toppings)
lambdaIceCreamShop.listTopFlavors()

lambdaIceCreamShop.orderCone(flavor: chocolateChip, topping: nil, size: .small)
lambdaIceCreamShop.orderCone(flavor: vanilla, topping: "Caramel Drizzle", size: .medium)
lambdaIceCreamShop.orderCone(flavor: strawberry, topping: nil, size: .large)
