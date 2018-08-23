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

class Garbage: Object{
    @objc dynamic var name = ""
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
//        try! realm.write {
//            let garbage = Garbage()
//            garbage.name = "Just garbage"
//            realm.add(garbage)
//        }
//
//            let dog2 = Dog()
//            dog2.name = "Jacobs"
//            dog2.age = 2
//            realm.add(dog2)
//
//            let dog3 = Dog()
//            dog3.name = "Sheila"
//            dog3.age = 6
//            realm.add(dog3)
//        }
        
        let garbage = realm.objects(Garbage.self).first!
        try! realm.write {
            realm.delete(garbage)
        }
        for g in realm.objects(Garbage.self){
            print("--\(g.name)")
        }
    }
    
}











