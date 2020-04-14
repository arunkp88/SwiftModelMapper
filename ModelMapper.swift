//
//  ModelMapper.swift
//
//  Copyright © 2020 Arun Kappattiparambil Parameswaran. All rights reserved.
//

import Foundation

/// Converts model to another model with same properties
/// - Parameter modelItem: input Model object
func mapModelItem<T: Codable, U: Codable>(modelItem: T) -> U? {
    if let dataEncoded = encode(objectModel: modelItem) {
        if let convertedModelItem: U = decode(jsonData: dataEncoded) {
            return convertedModelItem
        }
    }
    return nil
}



/// Convert an array of models to another set of models
/// - Parameter modelItems: model items array
func mapModelItems<T: Codable, U: Codable>(modelItems: [T]) -> [U] {
    
    var convertedModelItems: [U] = []
    modelItems.forEach { (modelItem) in
        if let convertedModelItem: U = mapModelItem(modelItem: modelItem) {
            convertedModelItems.append(convertedModelItem)
        }
    }
    
    return convertedModelItems
}

/// Parses JSON data to native swift object.
/// - Parameter jsonData: Data to be converted to swift object.
/// - returns: JSON parsed swift object. Returns nil if unable to parse the item.
fileprivate func decode<T: Codable>(jsonData : Data) -> T?{
    do {
        return try JSONDecoder().decode(T.self, from: jsonData)
    } catch {
        print(error.localizedDescription)
    }
     return nil
 }

/// Map swift object to JSON data.
/// - Parameter objectModel: The model object from which encodes.
/// - returns: Data encoded from swift object. Returns nil if unable to encode the item.
fileprivate func encode<T: Codable>(objectModel: T) -> Data? {
     do {
         return try JSONEncoder().encode(objectModel)
     }
     catch {
        print(error.localizedDescription)
     }
     return nil
 }

