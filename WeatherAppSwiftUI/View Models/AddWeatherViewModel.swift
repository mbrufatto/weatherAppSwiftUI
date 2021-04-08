//
//  AddWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Marcio Habigzang Brufatto on 07/04/21.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    
    var city: String = ""
    
    func save(completion: @escaping(WeatherViewModel) -> Void) {
        Webservice().getWeatherByCity(city: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherViewModel(weather: weather))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
