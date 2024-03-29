
import UIKit

class ViewController: UIViewController {
    
    let which = 3

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        switch which {
        case 1: self.test()
        case 2: self.test2()
        case 3:
            Task {
                await self.test3()
            }
        default: break
        }
    }
    
    // warnings suppressed
    
    func test() {
        let path = Bundle.main.path(forResource: "001", ofType: "png")!
        for j in 0 ..< 50 {
            for i in 0 ..< 100 {
                let im = UIImage(contentsOfFile: path)
            }
        }
    }
    
    func test2() {
        let path = Bundle.main.path(forResource: "001", ofType: "png")!
        for j in 0 ..< 50 {
            autoreleasepool {
                for i in 0 ..< 100 {
                    let im = UIImage(contentsOfFile: path)
                }
            }
        }
    }
    
    // works fine in an async function
    func test3() async {
        let path = Bundle.main.path(forResource: "001", ofType: "png")!
        for j in 0 ..< 50 {
            autoreleasepool {
                for i in 0 ..< 100 {
                    let im = UIImage(contentsOfFile: path)
                }
            }
        }
    }

    func dummy () {
        let myMutableArray = NSMutableArray()
        let obj = myMutableArray[0]
        myMutableArray.removeObject(at:0)
        // ... safe to refer to obj ...

    }


}

