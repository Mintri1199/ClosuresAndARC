 struct Guest: CustomDebugStringConvertible, Equatable {
    var name: String
    var age: Int
    
    var debugDescription: String {
        return name
    }
}

/*:
 -------------------INSTRUCTOR NOTE-------------------
 
 Below section is related to the specialRequest section in Closures. Below is written as if the last section of Closures did not exist. If that changes, will need rewording below.
 
 -------------------INSTRUCTOR NOTE-------------------
 */

/*:
 Let's go back to our extravagent event we were previously planning. We need to easily be able to add guests to our guest list, but we also want to be aware of any special requests they may have (you know how Dory only eats those rare olives from Spain).
 
 Let's write a function that adds a new guest to our list of guests, and also asks the guest if they have any special request they'd like us to execute. This closure has a parameter of one integer. This integer represents the number of guests when the new guest was added.
 */

var listOfGuests: [Guest] = []

func add(newGuest: Guest, specialRequest: (Int) -> ()) {
    
    //add the new guest to the guest list
    listOfGuests.append(newGuest)
    
    //get the count of the guest list
    let numberOfGuests = listOfGuests.count
    
    //execute the special request and pass the number of guests into the closure
    specialRequest(numberOfGuests)
}

/*:
 Great, we have our `add` function, but how do we call it with a closure as a parameter?
 */

/*:
 ## Trailing Closures
 If a closure is the last parameter of a function, and if the closure is long, we can write it as a **trailing closure** instead. **A trailing closure is a closure that is a parameter to a function that is written after the function call's closing parenthesis.** All other parameters need to be within the function's parenthesis as normal.
 
 Here's our `add` function being called using a trailing closure as a parameter:
 */
let eric = Guest(name: "Eric", age: 19)

add(newGuest: eric) { (guestNumber: Int) in
    print("There are \(guestNumber - 1) guests ahead of me")
    print("play rock music")
}

/*:
 ## Inferring Data Types
 In the parameter list of our closure, we can **infer** the type of each argument. This means we only need to define the names of each parameter and not include each type.
 
 In our `add` funnction, we can remove the type inferrence for our `guestNumber` parameter:
 */

add(newGuest: eric) { guestNumber in
    print("There are \(guestNumber - 1) guests ahead of me")
    print("play rock music")
}

/*:
 ## Shorthand Names
 We can remove the names of each parameter of the closure in favor of **shorthand names,** that will be used throughout the body of the closure in place of parameter names. $0 is the first parameter of the closure's parameter list, while $1 is the second parameter, and so on.
 
 By doing this you can remove the parameter list from the closure, and each parameter's type will still be inferred like it was in the previous example.
 
 Here's our `add` function again using shorthand names:
 */

add(newGuest: eric) {
    print("There are \($0 - 1) guests ahead of me")
}

/*:
 ## Write closure in a single line of code
 The best part is now you can write the body of the closure all on the same line of code!
 
 - note: If your closure returns a value, it too can be removed and inferred
 */

add(newGuest: eric) { print("There are \($0 - 1) guests ahead of me") }

/*:
 ## Give it a try!
 Rewrite your sorting closure to be a single line of code
 */


//copy and paste your sorting closure here and rewrite it to be a single line of code
 let sam = Guest(name: "Sam", age: 17)
 let sara = Guest(name: "Sara", age: 23)
 let charlie = Guest(name: "Charlie", age: 18)
 let guestsToSort = [sam, eric, sara, charlie]
 let ascendingAgeOfGuests = guestsToSort.sorted(by: {$0.age < $1.age})
 print(ascendingAgeOfGuests)
/*:
 Great work on becoming a master of closure optimizations! While these are not always needed, they can significantly clean up your code, and make it much easier to read and use in the future.
 
 We have one more section to go, let's finish strong with memory management!
 */

//: [Previous](@previous) | [Next](@next)





























import Foundation

