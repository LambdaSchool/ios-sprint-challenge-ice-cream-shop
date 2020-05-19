
import UIKit

struct Flavor {
    var name: String
    var rating: Double
}


enum Size: Double {
    case small = 3.99
    case medium = 4.99
    case large = 5.99
}
 
struct Cone {
    var flavors: Flavor
    var size: Size
    var topping: String?
    
    
    func eat(){
        print("Mmm! I love \(flavors.name) ice cream!")
    }
    
}

class IceCreamShop {
    var allFlavors: [Flavor]
    var sizes: Size
    var toppings: [String]
    var totalSales: Double
    
    init(allFlavors: [Flavor], sizes: Size, toppings: [String], totalSales: Double) {
        self.allFlavors = allFlavors
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = totalSales
}
    
    func listTopFlavors() {
        var message: String = "Our top flavors are: "
        
        for flavor in allFlavors {
            if flavor.rating >= 4 {
                print(message += flavor.name)
            }
        }
    print(message)
    }
    
    func orderCone(eFlavor: Flavor, eSize: Size, eToppings: String?) -> Cone? {
        let costSize = eSize
        let newCone = Cone(flavors: eFlavor, size: eSize, topping: eToppings)
        totalSales += newCone.size.rawValue
        if let unwrappedToppings = eToppings {
            print("Your order is \(eFlavor.name)ice cream with \(unwrappedToppings), your total will be $\(eSize.rawValue).")
            
        }       else {
            print("Your \(eFlavor.name)ice cream total is \(eSize.rawValue).")
}
        return newCone
    
}
    
}
var Vanilla = Flavor(name: "Vanilla ", rating: 7)
var Chocolate = Flavor(name: "Chocolate ", rating: 2)
var Mint = Flavor(name: "Mint ", rating: 9)
var toppings: [String] = ["Sprinkles", "Cookie Crumbs"]
var listOfFlavors =  [Vanilla, Chocolate, Mint]
let newIceCreamShop = IceCreamShop(allFlavors: listOfFlavors, sizes: .large, toppings: toppings, totalSales: 0.0)
newIceCreamShop.orderCone(eFlavor: Vanilla, eSize: .medium, eToppings: "sprinkles")?.eat()
newIceCreamShop.orderCone(eFlavor: Chocolate, eSize: .small, eToppings: nil)
newIceCreamShop.orderCone(eFlavor: Mint, eSize: .large, eToppings: nil)
newIceCreamShop.totalSales
newIceCreamShop.listTopFlavors()



