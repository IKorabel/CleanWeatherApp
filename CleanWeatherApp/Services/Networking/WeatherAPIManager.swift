//
//  WeatherAPIManager.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.10.2021.
//

import Foundation

class WeatherApiManager {
    static let shared = WeatherApiManager()
    
    final private let openWeatherApiKey = "f0f4552bf57bd3a6cb02f91410256b62"
    
    func getWeatherInRegion(lat: String, long: String, completion: @escaping ((WeatherInformation) -> Void)) {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&units=metric&exclude=minutely&lang=ru&appid=\(openWeatherApiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Неверный запрос")
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let weatherData = data else {
             print(String(describing: error))
             return
            }
            do {
                let weatherInformation = try JSONDecoder().decode(WeatherInformation.self, from: weatherData)
                completion(weatherInformation)
            }  catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        task.resume()
    }
}
