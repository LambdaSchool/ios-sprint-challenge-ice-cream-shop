import UIKit

struct Flavor {
    var name: String
    var rating: Double
}

enum Size: Double {
    case small = 1.00
    case medium = 2.88
    case large = 5.25
}

struct Cone {
    let flavor: Flavor
    let topping: String?
    let size: Size.RawValue
    
    func eat() {
        print("Yum, I love \(flavor.name)!)")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String?]
    var totalSales: Double = 0.0

    
    init(flavors: [Flavor], sizes: [Size], toppings: [String?], totalSales: Double) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = totalSales
    }
}


func listTopFlavors() {
    var top: [Flavor] = []
    
    for flavor in flavors {
        if flavor.rating >= 4.0 {
            top.append(flavor.name)
            print("Our top flavors are \(flavor.name)!")
        }
    }
}

func orderCone(flavors: Flavor, toppings: String?, size: Size) -> Cone? {
    let myCone = Cone(flavor: flavors, topping: toppings ?? "none", size: size.rawValue)
    
    totalSales += Cone.size.rawValue
    
    
    if let unwrapTopping = myCone.topping {
        print("Your \(myCone.flavor) with \(String(describing: myCone.topping)) is \(myCone.size)")
    } else {
        print("Your \(myCone.flavor) is \(myCone.size)")
    }
    
    return myCone
}


let flavor1 = Flavor(name: "Chocolate Fantasy", rating: 5.8)
let flavor2 = Flavor(name: "Raspberry Gelato", rating: 3.6)

var toppings: [String?] = ["Whipped Cream", "Chocolate Whipped Cream", "Banana", "Cherries"]
var shopSizes: [Size] = [.small, .large, .medium]

let myShop: IceCreamShop

myShop.listTopFlavors()

let cone1 = orderCone(flavors: flavor1, toppings: "", size: .large)
cone1?.eat()
print(totalSales)



