struct Flavor {
    var name: String
    var rating: Double
}

enum Size: Double {
    case small = 3.99
    case medium = 5.99
    case large = 8.99
}

enum Toppings {
    case gummybears
    case sprinkles
    case nuts
}

struct Cone {
    var flavor: String
    let size: Size
    let toppings: Toppings
    
    func eat() {
        print("Mmm!  I love \(flavor) flavor!")
    }
}

class IceCreamShop {
    
    let cone: Cone
    let sizes: Size
    var toppings: Toppings
    var totalSales: Double
    var flavorArray: [Flavor]
    
    init(cone: Cone, sizes: Size, toppings: Toppings, totalSales: Double, flavorArray: [Flavor]) {
        self.cone = cone
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = totalSales
        self.flavorArray = flavorArray
    }
}

var coneString: String = ""

var flavorVan = Flavor(name: "Vanilla", rating: 3.0)
var flavorChoc = Flavor(name: "Chocolate", rating: 4.0)
var flavorStraw = Flavor(name: "Strawberry", rating: 5.0)

var myFlavorsArray: [Flavor] = []

myFlavorsArray.append(flavorVan)
myFlavorsArray.append(flavorChoc)
myFlavorsArray.append(flavorStraw)

var cone1: Cone = Cone(flavor: flavorStraw.name, size: .medium, toppings: .gummybears)

var myIceCreamShop: IceCreamShop = IceCreamShop(cone: cone1, sizes: .medium, toppings: .nuts, totalSales: 0.0, flavorArray: myFlavorsArray)

func listTopFlavors(iceCreamShop: IceCreamShop) {
    
    print("Our top flavors are: ")

    for flavor in iceCreamShop.flavorArray {
        let flavorString = flavor.name
        let flavorRating = flavor.rating
        if(flavor.rating >= 4.0) {
            print(flavorString)
        }
    }
}

listTopFlavors(iceCreamShop: myIceCreamShop)

cone1.eat()

func orderCone(cone: Cone?) -> String {
    
    if let unwrappedCone = cone {
        coneString += "Flavor: \(unwrappedCone.flavor) "
    }
    
    if let unwrappedConeTopping = cone {
        coneString += " Topping: \(unwrappedConeTopping.toppings) "
    }
    if let unWrappedConeSize = cone {
        coneString += " Size: \(unWrappedConeSize.size.rawValue) "
        myIceCreamShop.totalSales += unWrappedConeSize.size.rawValue
    }
    return coneString
}

func printTotalSales(iceCreamShopTotalSales: IceCreamShop) {
    print("Total Sales for our Ice Cream Shop: \(myIceCreamShop.totalSales)")
}

print(orderCone(cone: cone1) + " ")

printTotalSales(iceCreamShopTotalSales: myIceCreamShop)

print(orderCone(cone: cone1) + " ")

printTotalSales(iceCreamShopTotalSales: myIceCreamShop)
