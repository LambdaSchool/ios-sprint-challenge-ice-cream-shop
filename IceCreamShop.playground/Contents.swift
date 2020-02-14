import Foundation

struct Flavor {
    let name: String
    var rating: Double
    
    var fullName: String {
        "\(name) - \(rating)"
    }
}

enum Size {
    case small(String, Double)
    case medium(String, Double)
    case large(String, Double)
    
    var name: String {
        switch self {
        case .small(let n, _),
             .medium(let n, _),
             .large(let n, _):
            return n
        }
    }
    
    var price: Double {
        switch self {
        case .small(_, let p),
             .medium(_, let p),
             .large(_, let p):
            return p
        }
    }
    
    var fullName: String {
        "\(name) - $\(price)"
    }
}

struct Cone {
    let flavor: Flavor
    let topping: String
    let size: Size
    
    var fullName: String {
        "\(flavor.name) ice cream cone \(!topping.isEmpty ? "with " + topping : "")"
    }
    
    func eat() {
        print("This \(fullName), was delicious!")
    }
}

class IceCreamShop {
    let name: String
    let flavors: [Flavor]
    let toppings: [String]
    let sizes: [Size]
    
    var totalSales: Double = 0.0
    
    init(name: String, flavors: [Flavor], toppings: [String], sizes: [Size]) {
        self.name = name
        self.flavors = flavors
        self.toppings = toppings
        self.sizes = sizes
    }
    
    func orderCone(flavor: Flavor, topping: String = "", size: Size) -> Cone? {
        let cone = Cone(flavor: flavor, topping: topping, size: size)
        totalSales += size.price
        print("Your \(size.name) \(cone.fullName) is $\(size.price)")
        return cone
    }
    
    func printTotalSales() {
        print("The total sales for \(name) is: $\(totalSales)")
    }
}

class Clerk {
    let name: String
    let shop: IceCreamShop
    
    var greeting: String {
        """
        **** \(name.capitalized) ****
        How may I help you today? You can enter:
        'f' to list all flavors
        'F' to list the top flavors (greater than 4.0 rating)
        't' to list all toppings
        's' to list all sizes
        'o' to order
        """
    }
    
    var flavors: String {
        var result = ""
        for (index, flavor) in shop.flavors.enumerated() {
            result += "\(index + 1)) \(flavor.fullName)\n"
        }
        return Clerk.numberedPrompt("These are our flavors", result)
    }
    
    var topFlavors: String {
        var results = Array<(index: Int, flavor: Flavor)>()
        for (index, flavor) in shop.flavors.enumerated() {
            if flavor.rating > 4.0 {
                results.append((index: index, flavor: flavor))
            }
        }
        
        if results.isEmpty {
            return "There are no top flavors at this time."
        }
        
        var stringResult = ""
        for val in results {
            stringResult += "\(val.index + 1)) \(val.flavor.fullName)"
        }
        
        return Clerk.numberedPrompt("These are our top flavors", stringResult)
    }
    
    var toppings: String {
        var result = ""
        for (index, topping) in shop.toppings.enumerated() {
            result += "\(index + 1)) \(topping)"
        }
        
        return Clerk.numberedPrompt("These are our toppings", result)
    }
    
    var sizes: String {
        var result = ""
        for (index, size) in shop.sizes.enumerated() {
            result += "\(index + 1)) \(size.fullName)"
        }
        
        return Clerk.numberedPrompt("These are our sizes", result)
    }
    
    static let inputErrorMsg = "I'm sorry I didn't quite get that. Can you repeat that?"
    
    static func numberedPrompt(_ pre: String, _ post: String) -> String {
        return """
               \(pre), use the number next to it when you order:
               \(post)
               """
    }
    
    init(name: String, shop: IceCreamShop) {
        self.name = name
        self.shop = shop
    }
    
    func open() {
        print("\(shop.name) is now open for business!")
        var closed = false
        while !closed {
            print(greeting)
            
            let input = readLine(strippingNewline: true)
            guard let choice = input else {
                print(Clerk.inputErrorMsg)
                continue
            }
            
            switch choice {
            case "f":
                print(flavors)
            case "F":
                print(topFlavors)
            case "t":
                print(toppings)
            case "s":
                print(sizes)
            case "o":
                break
            default:
                print(Clerk.inputErrorMsg)
                continue
            }
        }
    }
}
