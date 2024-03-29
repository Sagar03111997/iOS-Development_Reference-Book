

import UIKit

class Dog {
    func say(_ s:String, times:Int = 1) {
        for _ in 1...times {
            print(s)
        }
    }
}

func doThing (a:Int = 0, b:Int = 3) {}

// variadic

func sayStrings(_ array:String ...) {
    for s in array { print(s) }
}

// new in beta 6, variadic can go anywhere

func sayStrings(_ array:String ..., times:Int) {
    for _ in 1...times {
        for s in array { print(s) }
    }
}

// new in Swift 5.4 you can have more than one

func sayStrings(_ array:String ..., and array2:String ...) {
    for s in array { print(s) }
    for s in array2 { print(s) }
}

func sayStrings(_ array:String ..., other:String, _ array2:String ...) {
    for s in array { print(s) }
    print(other)
    for s in array2 { print(s) }
}

// no, not even though the types vary
//func sayStringsAndInts(_ array:String ..., _ arrayOfInts:Int ...) {
//    for s in array { print(s) }
//    for i in arrayOfInts { print(i) }
//}

// ignored

func say(_ s:String, times:Int, loudly _:Bool) {Dog().say(s, times:times)}

func say2(_ s:String, times:Int, _:Bool) {Dog().say(s, times:times)}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let d = Dog()
        d.say("woof") // same as saying d.say("woof", times:1)
        d.say("woof", times:3)
        
        // doThing(b:5, a:10) // illegal at long last
        
        sayStrings("hey", "ho", "nonny nonny no")
        
        sayStrings("Manny", "Moe", "Jack", times:3)
        
        sayStrings("Manny", "Moe", "Jack", and: "Groucho", "Harpo", "Chico")
        
        // this would be a pretty dumb way to declare the function
        // because the call site is impossible to read; but it's legal!
        sayStrings("Manny", "Moe", "Jack", other: "Matt", "Groucho", "Harpo", "Chico")
        
        // print is now variadic
        
        print("Manny", 3, true) // Manny 3 true
        
        print("Manny", "Moe", separator:", ", terminator: ", ")
        print("Jack")
        
        say("hi", times:3, loudly:true)
        
        say2("hi", times:3, true)

    }


}

