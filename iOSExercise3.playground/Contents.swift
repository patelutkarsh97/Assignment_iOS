import UIKit

var str = "Hello, it's Utkarsh's playground"

/*:
# Assignment 3

## 1. Implement the parameterised initialisation with class or struct.

### The class can be initialised as follows:
### class Person {
### var name: String = "Utkarsh"
### var surname: String = "Patel"
### var age: Int?
### }


### The struct can be initialised as follows:
### struct Person {
### var name: String = "Utkarsh"
### var surname: String = "Patel"
### var age: Int?
### }

*/

/*:

## 2. Write all the Rules of initialiser in Inheritance.

### The rules for the initialiser in inheritance are
###  Rule 1:  A designated initializer must call a designated initializer from its immediate superclass.
###  Rule 2:  A convenience initializer must call another initializer from the same class.
###  Rule 3:  A convenience initializer must ultimately call a designated initializer.

*/

/*:
## 3. Using convenience Initializers, write-down the Initializers for MOVIE class having basic attributes like title, author, publish_date, etc.

### class MOVIE {
### var title: String
### var author: String
### var publish_date: Date

### init(title: String, author: String, publish_date: Date) {
### self.title = title
### self.author = author
### self.publish_date = publish_date
### }
### convenience init(title: String) {
### self.init(title: "MovTitle", author: "MovAuthor", publish_date: 2019)
### }
### }

*/

/*:
## 4. Declare a structure which can demonstrate the throwable Initializer

### struct User {
### let name: String

### init(name: String?) throws {

### guard let name = name else {
### ValidationError.invalid
### }

### self.name = name
### }
### }

//
### do {
### let user = try User(name: "User name")
            
###   // success
### }
### catch ValidationError.invalid {
###   // handle error
### }
*/

//: [Array](@next)

/*:

 ## 1. Create an array containing the 5 different integer values. Write at least 4 ways to do this.

### a) Type 1
### var array: Array<Int> = [1,2,3,4,5]
### //:
### b) Type 2
### var array: [Int] = [1,2,3,4,5]
### //:
### c) Type 3
### var array = Array<Int>()
### array.append(1)
### array.append(2)
### array.append(3)
### array.append(4)
### array.append(5)
### //:
### d) Type 4
### var array = [Int]()
### array.append(1)
### array.append(2)
### array.append(3)
### array.append(4)
### array.append(5)
*/

/*:

## 2. Create an immutable array containing 5 city names.

### Immutable array :-
### let city: [String] = ["Varanasi","Kanpur","Ghaziabad","Agra","Noida"]

## 3. Create an array with city 5 city names. Later add other names like Canada, Switzerland, Spain to the end of the array in at least 2 possible ways.

### var city: [String] = ["Varanasi","Kanpur","Ghaziabad","Agra","Noida"]
### city.append("Canada","Switzerland","Spain")
-- **Or we can add in array in this way also**
### city.append("Canada")
### city.append("Switzerland")
### city.append("Spain")

*/

/*:
## 4. Create an array with values 14, 18, 15, 16, 23, 52, 95. Replace the values 24 & 48 at 2nd & 4th index of array

### var num: [Int] = [14,18,15,16,23,52,95]
### num[2] = 24
### num[4] = 48
*/

//: [Set](@next)


/*:
 ## let houseAnimals: Set = ["🐶", "😸"]
 ## let farmAnimals: Set = ["🐮", "🐓", "🐑", "🐶", "😸"]
 ## let cityAnimals: Set = ["🐥", "🐀"]
 
 ## 1. Determine whether the set of house animals is a subset of farm animals.
 
 ### houseAnimals.isSubset(of: farmAnimals)
 */

/*:
 ## 2. Determine whether the set of farm animals is a superset of house animals.
 
 ### farmAnimal.isSuperset(of: houseAnimal)
 */

/*:
 ## 3. Determine if the set of farm animals is disjoint with city animals.
 
 ### farmAnimal.isDisjoint(with: cityAnimal)
 */

/*:
 ## 4. Create a set that only contains farm animals that are not also house animals.
 
 ### var newSet: Set = [farmAnimals.subtracting(houseAnimals)]
 */

/*:
 ## 5. Create a set that contains all the animals from all sets.
 
 ### var unionOfSet: Set = [farmAnimals.union(cityAnimals)]
 
 */


//: [Dictionary](@next)

/*:
 ## 1. Create an empty dictionary with keys of type String and values of type Int and assign it to a variable in as many ways as you can think of (there's at least 4 ways).
 
 ### a) Type 1
 ### var emptyDict: Dictionary<String, Int> = [:]
 ### //:
 ### b) Type 2
 ### var emptyDict: [String, Int] = [:]
 ### //:
 ### c) Type 3
 ### var emptyDict = Dictionary<String, Int>()
 ### //:
 ### d) Type 4
 ### var emptyDict = [String: Int]()
 */

/*:
 ## 2. Create a mutable dictionary named secretIdentities where the key value pairs are "Hulk" -> "Bruce Banner", "Batman" -> "Bruce Wayne", and "Superman" -> "Clark Kent".
 
 ### var secretIdentities: [String: String] = ["Hulk": "Bruce Banner", "Batman": "Bruce Wayne", "Superman": "Clark Kent"]
 */

/*:
 ## 3. Create a nesters structure of Key-value pair.
 
 ### var secretIdentities: [String: String] = ["Hulk": "Bruce Banner", "Batman": "Bruce Wayne", "Superman": "Clark Kent"]
 
 --
 
 ###  var airports: [String: Any] = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "DUB1": [1,2,3]]
 
 ### var demo : [String : Any] = ["A" : 1,
 ### "B" : 2.0,
 ### "C" : "iOS",
 ### "D" : ["A1", "A2", "A3"],
 ### "E" : airports]
 
 */

/*:
 ## 4. Print all the keys in the dictionary.
 
 ### print(secretIdentities)
 
 */



//: [Subscript](@next)

/*:
 ## 1. What is subscript ? Write down the declaration syntax.
 
 ### Subscripts are used to access information from a collection, sequence and a list in Classes, Structures and Enumerations without using a method.
 
 ### Subscripts are used to store and retrieve the values with the help of index without the use of separate method.
 
 ## Syntax of Subscript
 
 ### subscript (<parameters>) -> <return type> {
  // the getter is required
 ### get {
 // used for subscript value declarations
 ### }
 ### set(newValue) { // the setter is optional
 // definitions are written here
 ### }
 ### }


 */

/*:
 ## 2. Create a simple subscript that outputs true if a string contains a substring and false otherwise.
 
 
 ### var simpleSubscript = "This string contains substring"
 ### simpleSubscript.containsString("substring")
 ### simpleSubscript.containsString("subscript")
 */
