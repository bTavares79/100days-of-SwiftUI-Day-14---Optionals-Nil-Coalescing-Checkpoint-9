import UIKit


// ==================================== How to handle missing data with optionals ============================
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


// ? after the type is an optional declaration
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
number = 10
// This is what you have to do to unwrap a optional type.
// This seems like extra work for no reason.
if let number = number {
    print(square(number: number))
}



// ===================================================== How to unwrap optionals with guard ====================================
func printSquare(of number: Int?) {
    // This checks of the value is nil. if so print the message
    // if it isn't nil then the number = number has still unwrapped the optional and the second print statement will work
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}


var myVar: Int? = 3
var myVar2: Int?

printSquare(of: myVar)
printSquare(of: myVar2)



// ================================================== How to unwrap optionals with nil coalescing =============================
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]

// The ?? is used for nil coalescing
// In this instance if the value is nil None is returned.
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)



// ======================================= How to handle multiple optionals useing optional Chaining =============================
let names = ["Arya", "Bran", "Robb", "Sansa"]

// This line of code chains elements together reading from left to right.
// if the names.randomElement does return a vlaue, then perform the uppercase operation on this value. if not return "No one"
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


struct Book1 {
    let title: String
    let author: String?
}

var book1: Book1? = nil

// This returns A becuse book has nil in it's value
// if any of the steps fail, just send back an A
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)




// ======================================= How to handle function failure with optionals =========================================
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
