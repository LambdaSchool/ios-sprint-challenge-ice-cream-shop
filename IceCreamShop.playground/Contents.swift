//bryan cress
// ice cream shop sprint challenge

// The app will need to be able to create an ice cream shop model object, give it a menu of flavors, toppings and ice cream cone sizes and let people order from the menu.



// Add the following properties. Think about what type they should be:
   //:- `name`
   //:- `rating`
struct Flavor{
    let name: String
    var rating: Double                             // are you sure these are the right type?
}





//Make the enum have `Double` raw values. The raw value should represent the size's price. For example, small might be 3.99.
enum Size: Double {
    case small = 3.99
    case medium = 4.99
    case large = 5.99
    
}




//- Give the struct properties (constants) that hold a flavor, topping (as a `String`), and size.
//- Create a function called `eat`. It shouldn't have any arguments. It should print a string of text that includes the name of the cone's flavor. For example: "Mmm! I love <flavor here>!"
struct Cone {
    let flavor: Flavor
    let topping: String?
    let size: Size
    
    func eat() {
        print("Mmm i love \(flavor.name).")
        }                                   //need to finsish
    }




//- An ice cream shop needs a menu, so create variables that hold the various flavors, sizes, and toppings you want to have in your shop.
//- Create a variable called `totalSales`. This will be used to keep track of how much money was made.
class IceCreamShop {
    var flavors: [Flavor]
    var toppings: String
    var sizes: [Size]
    var totalSales: Double
    
    init(shopFlavors: [Flavor], shopToppings: String, shopSizes: [Size], shopTotalSales: Double) {
        
        flavors = shopFlavors
        toppings = shopToppings
        sizes = shopSizes
        totalSales = shopTotalSales
    }

    
    func listTopFlavors() {
           for topflavor in myShop.flavors {
               if topflavor.rating >= 4.0 {
                   let topFlavorsString: String = "Our top flavors are \(topflavor.name)"
                
                   print(topFlavorsString)
               }
               
           }
       }
    
}


//If a customer asks which flavors are available, we need to be ready to tell them. To accomplish this, do the following:
//- Create a function called `listTopFlavors`.
//- This function doesn't need any arguments.
//- In the function, build a string that lists out the names of each flavor in the shop's `flavors` array whose rating is over 4.0. For example, the string might say "Our top flavors are <flavors here>." **Hint:** You may want to loop through the array of flavors in order to access each one's name.
//- When the string has been created, print it.
 



//Customers will need a way to order a cone.
//- Create a function called `orderCone`.
//- This should have arguments needed to initialize a `Cone`, such as a flavor, topping (if desired), and a size.
//- This function should return an optional `Cone` object. We're going to have it be optional for later use.
//- In this function, create a constant that initializes a new `Cone` with the arguments passed into the function.
//- Add the price of the cone to the `totalSales` variable you made in the previous step.
//- Create a string that tells the price of the cone, along with its flavor and topping. **NOTE:** account for the potential lack of a topping on the `Cone` in that string by using optional binding (if-let). For example, the string could say "Your mint ice cream with chocolate chips is 3.99", or "Your vanilla ice cream is 5.99." Print the string.
//- Finally, return the cone you initialized.

func orderCone(topping: String?, flavor: Flavor, size: Size) -> Cone? {
    let newCone = Cone(flavor: flavor, topping: topping, size: size)
    myShop.totalSales += newCone.size.rawValue
    if let toppings = newCone.topping {
        print("Your \(newCone.flavor.name) ice cream with \(toppings) is \(newCone.size.rawValue)")
    }
    return newCone
}









//    func orderCone(cone: Cone) -> Cone? {
//
//         let newCone = Cone(flavor: cone.flavor, topping: cone.topping, size: cone.size)
//        totalSales = shopTotalSales + newCone.size.rawValue
//        guard let unwrappedConeTopping = cone.topping else {
//            print("Your \(cone.flavor) is \(cone.size)")
//        }
//
//         print("Your \(cone.flavor) with \(unwrappedConeTopping) is \(cone.size)")
//     }

    
        
        
        
        
        
        
        
        // Instances Of Flavors
    let vanilla = Flavor(name: "Vanilla", rating: 4.0)
    let chocolate = Flavor(name: "Chocolate", rating: 5.0)
    let strawberry = Flavor(name: "Strawberry", rating: 3.0)

    
    
    

//step8
//Use the constants you just made to initialize a new `IceCreamShop` constant.
let myShop = IceCreamShop(shopFlavors: [vanilla,chocolate,strawberry], shopToppings: "All", shopSizes: [.small, .medium, .large], shopTotalSales: 0.00)



//step 9
// Call the shop's `listTopFlavors` function and make sure it runs correctly.
 
myShop.listTopFlavors()


//step 10
//Create a new `Cone` constant. Use the shop's `orderCone` function to assign the constant a `Cone` value.

let newCone = orderCone(topping: "Sprinkles", flavor: vanilla, size: .medium)

//step11
//Using that new `Cone` constant, call its `eat` function without unwrapping the constant.
newCone?.eat()


//step 12
//12. Print the shop's `totalSales` and make sure that it has increased since you ordered a cone in step 10.

print(myShop.totalSales)



///step 7
//At the bottom of the playground, create a few `Flavor` constants, an array of sizes, and an array of toppings.

    let shopToppings = ["Sprinkles", "Chocolate Sprinkles", "Choclate Syrup", "Gummy Bears"]
