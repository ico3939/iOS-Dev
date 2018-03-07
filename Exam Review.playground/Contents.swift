//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Week 1
let number: Float = 46.76789987978
print("Values: \(34) \("Ian") \(number)")
var prettyPrint = String(format: "%0.2f", number) // rounds to the given decimal


var currencyFormatter = NumberFormatter()
currencyFormatter.numberStyle = .currency


var price: NSNumber = 56.97 // does the same thing
//var priceAlt = NSNumber(value: 56.97) // does the same thing=
var formattedPrice = currencyFormatter.string(from: price)!
print("price: \(formattedPrice)")
var price1 = 56.97 // Double


// arrays and dictionaries
var colors = ["orange", "black", "Blue"] // implicitly [String] typed array
var options: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor: UIColor.orange] // Explicitly setting type to [NSAttributedStringKey: Any]


// Control Flow
for color in colors {
    print(color)
}

// do while is "repeat while"
var i = 10
repeat {
    i -= 2
    print("Countdown: \(i)")
} while i > 10

var isInvalidInput = false
while isInvalidInput {
    print("Check input")
    // checking input
    if true { // based on something
        print("It's all good now")
        isInvalidInput = true
    }
}


// functions and closures
func startTimer() {
    print("timer started")
    
}

startTimer()

func add(a: Int, b: Int) {
    var sum = a + b
    print("Sum: \(sum)")
}

add(a: 20, b: 30)

// the underscore and space elliminates the need fot he user to write the name of the variable in the function call
func addTwo(_ a: Int, _ b: Int) {
    var sum = a + b
    print("Sum: \(sum)")
}

addTwo(100, 200)


func hidePanel(fromView panel: UIView) {
    print("variable: \(panel)")
}
hidePanel(fromView: UIView())


// Defaults and dependency injection
class Simulation {
    // initializer depenecy injection
    typealias DateGenerator = () -> Date // typealias allows us to name a type of our own choosing
    let dateGenerator: DateGenerator // storing closure
    
    init(dateGenerator: @escaping DateGenerator = Date.init) { // passing a closure as a dependency injector
        print("Date: \(dateGenerator())")
        self.dateGenerator = dateGenerator
    }
    
    deinit {
        print("Cleanup")
        // remove observers
    }
}

func futureDate() -> Date {
    return Date(timeInterval: 60, since: Date())
}

var simulator = Simulation()
var simulator2 = Simulation(dateGenerator: futureDate)

var simOptional: Simulation?
simOptional = Simulation()
simOptional = nil // forces the deinit to get called

func testScope() {
    var simulation = Simulation()
}

print("test scope")
testScope()

// Automatic Reference Counting: ARC
// retain
// release



// Optionals, enumerations, and structures

// classes can inherit, structures cannot
// classes are reference type, structures are value type

class AClass : NSObject {
    // a reference to the object is created
    var a: Int
    var b: Int
    
    override init() {
        a = 0
        b = 2
    }
}

struct BStruct {
    // data is copied
    // you should use a structure to make data immutable
    var x: Int
    var y: Int
}

func passByReference(object: AClass) {
    print(object)
}

let a = AClass()
print("a: \(a)")
passByReference(object: a)

func passByValue(structure: BStruct) {
    print(structure)
}

let b = BStruct(x: 30, y: 40)
print("b: \(b)")
passByValue(structure: b)




