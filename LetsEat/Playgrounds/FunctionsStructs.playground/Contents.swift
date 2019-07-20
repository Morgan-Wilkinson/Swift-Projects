class Animal
{
    var age: Int?
}
class Cat: Animal
{
    var name: String?
}

struct Dog
{
    var name: String?
}

let yellowCat = Cat()
yellowCat.name = "Garfield"
yellowCat.age = 3
print(yellowCat.name as Any)
print(yellowCat.age as Any)

var yellowDog = Dog()
yellowDog.name = "Bruno"
print(yellowDog.name as Any)

let yellowStrayCat = yellowCat
yellowStrayCat.name = "Smokey"
print(yellowStrayCat.name as Any)
print(yellowCat.name as Any)

var yellowStrayDog = yellowDog
yellowStrayDog.name = "Max"
print(yellowStrayDog.name as Any)
print(yellowDog.name as Any)
