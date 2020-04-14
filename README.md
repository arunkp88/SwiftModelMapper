# SwiftModelMapper
Model mapper class written in Swift for mapping a given class/struct model to other

USAGE Example:

struct A: Codable {

var id : String?
var fName : String?
var lName : String?

}

struct B: Codable {

var id : String?
var fName : String?
var lName : String?

}

let a = A(id: "1", "title": "Arun", "lName": "KP")

let b: B = mapModelItem(modelItem: a)

Work with different keys as well by using the CodingKeys and Decoder functions
