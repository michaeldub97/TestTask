//
//  CoctailsResponce.swift
//  TestTask
//
//  Created by Михаил on 29.03.2022.
//

import Foundation

struct CoctailsResponce: Decodable {
    let drinks: [Drinks]
}

struct Drinks: Decodable  {
    let strDrink : String
    let strDrinkThumb : String
    let idDrink : String
}
