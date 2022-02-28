//
//  NetworkingManager.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 28.02.2022.
//

import Foundation

//
//class NetworkingManager {
//    
//    func getData(url: String, completion: @escaping (Data) -> Void) {
//        guard let url = URL(string: url) else {
//            print("Неверный запрос")
//            return
//        }
//        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//        request.httpMethod = "GET"
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let weatherData = data else {
//             print(String(describing: error))
//             return
//            }
//            do {
//                let weatherInformation = try JSONDecoder().decode(WeatherInformation.self, from: weatherData)
//                
//                completion(weatherInformation)
//            }  catch let DecodingError.dataCorrupted(context) {
//                print(context)
//            } catch let DecodingError.keyNotFound(key, context) {
//                print("Key '\(key)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.valueNotFound(value, context) {
//                print("Value '\(value)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.typeMismatch(type, context)  {
//                print("Type '\(type)' mismatch:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch {
//                print("error: ", error)
//            }
//        }
//        task.resume()
//    }
//    
//}
