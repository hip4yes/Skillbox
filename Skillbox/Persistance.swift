import Foundation
import RealmSwift

class Human: Object{
    @objc dynamic var name = ""
    let dogs = List<Dog>()
}

class Dog: Object{
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var owner: Human?
}


class Persistance{
    static let shared = Persistance()

    private let realm = try! Realm()

    func test(){
        let human = Human()
        human.dogs.append(Dog())
        human.dogs.remove(at: 0)
        
        let dog = Dog()
        dog.owner = human
        
    }
    
}











