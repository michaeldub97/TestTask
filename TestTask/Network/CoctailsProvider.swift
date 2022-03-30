//
//  CoctailsProvider.swift
//  TestTask
//
//  Created by Михаил on 29.03.2022.
//

import Foundation
import Alamofire

class CoctailsProvider {
    
    let baseUrl = "https://www.thecocktaildb.com/api/json/v1"
    
    func getNonAlcoholicCoctails(success: @escaping (([Drinks]) -> Void), failure: @escaping ((Error) -> Void)) {
        let urlString = baseUrl + "/1/filter.php?a=Non_Alcoholic"
        AF.request(urlString).response { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                guard let data = data, let responce = try? decoder.decode(CoctailsResponce.self, from: data) else {
                    let error = NSError(domain:"", code:-1, userInfo:[NSLocalizedDescriptionKey: "Не удалось загрузить даные"])
                    failure(error)
                    return
                }
                success(responce.drinks)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
