//MARK: - Model

struct Flavor {
    let name: String
    var rating: Double
}

enum Size: Double, CaseIterable {
    case small = 2.99
    case medium = 3.59
    case large = 4.29
}

struct Cone {
    let flavor: Flavor
    let topping: String
    let size: Size
    
    func eat() {
        print("This \(flavor.name.lowercased()) ice cream is amazing. I can't get enough!")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String]
    
    var totalSales: Double
    
    init(flavors: [Flavor], sizes: [Size], toppings: [String]) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
        
        totalSales = 0.0
    }
    
    func listTopFlavors() {
        // I could also do this with a for loop, but since I am more than comfortable with loops, I will use filter and map, which I haven't used as much
        let topFlavorNames = flavors.filter({$0.rating > 4.0}).map({ $0.name.lowercased() })
        
        switch topFlavorNames.count {
        case 0:
            print("Sorry, we actually don't have any top flavors right now.")
        case 1:
            print("Our top rated flavor at the moment is \(topFlavorNames[0])")
        default:
            let topFlavorList = topFlavorNames.dropLast(1).joined(separator: ", ") +
                (topFlavorNames.count > 2 ? "," : "") +
                " and " +
                (topFlavorNames.last ?? "")
            print("Our top rated flavors at the moment are \(topFlavorList).")
        }
        
    }
    
    func orderCone(flavor: Flavor, topping: String?, size: Size) -> Cone? {
        let cone = Cone(flavor: flavor, topping: topping ?? "None", size: size)
        totalSales += cone.size.rawValue
        
        
        var priceString = "Your \(size) \(flavor.name.lowercased()) ice cream cone "
        if let topping = topping {
            priceString += "with \(topping) "
        }
        priceString += "is going to be \(cone.size.rawValue)."
        print(priceString)
        
        return cone
    }
}


//MARK: - Test Implementation

let vanilla = Flavor(name: "Vanilla", rating: 3.2)
let chocolate = Flavor(name: "Chocolate", rating: 3.9)
let cookiesCream = Flavor(name: "Cookies N'Cream", rating: 3.8)
let bacon = Flavor(name: "Bacon", rating: 2.1)
let cottonCandy = Flavor(name: "Cotton Candy", rating: 1.3)

let sizes = Size.allCases

let toppings = ["peanuts", "sprinkles", "chocolate shell", "hot fudge", "caramel"]

let heraldsDairyDelight = IceCreamShop(flavors: [vanilla, chocolate, cookiesCream, bacon, cottonCandy],
                                       sizes: sizes,
                                       toppings: toppings)

heraldsDairyDelight.listTopFlavors()

let myCone: Cone?
myCone = heraldsDairyDelight.orderCone(flavor: vanilla, topping: "hot fudge", size: .small)
myCone?.eat()
print(heraldsDairyDelight.totalSales)




