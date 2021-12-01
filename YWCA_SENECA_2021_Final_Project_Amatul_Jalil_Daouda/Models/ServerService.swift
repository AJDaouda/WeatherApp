//
//  ServerService.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//
import UIKit
//import Foundation
class Service{
    //Creating a shared satatic variable
    static var shared = Service()
    private init() {}
    
    enum getError: Error{
        case wrongUrl
    }
    
//    let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func getJsonData(myURL: String, query  : [String: String]?, completion: @escaping (Result<Data,Error>)-> Void) {
    var urlComponent = URLComponents(string: myURL)!
    print("URL before going to fetch JSON:\(urlComponent)")
    if let query = query { urlComponent.queryItems = query.map({URLQueryItem(name: $0.key, value: $0.value)})
    urlComponent.queryItems = query.map({ URLQueryItem(name: $0.key, value: $0.value) })
        guard let url = urlComponent.url
        else{
            return completion(.failure(getError.wrongUrl))
        }
  
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
           return  completion(.failure(error))
        }
else if let data = data{
           completion(.success(data))
      }
    }
        task.resume()
}
   
}
        
    func getWeatherData(myURL: String, query:[String:String]?, completion : @escaping(Result<Data,Error>)->Void){ //you changed Data to weathrResult
        var urlComponent = URLComponents(string: myURL)!
        if let query = query {
            urlComponent.queryItems = query.map({URLQueryItem(name:$0.key,value: $0.value)})

        guard let url = urlComponent.url //lower case string - different from fetchData parameter
            else{
                //If the URL is not correct, return an error message
    //            print("Error: Something is wrong with your URL")
                return completion(.failure(getError.wrongUrl))
        let prm = ["citName":"","appid":apiKey];

        var urlComponent = URLComponents(string: myURL)!
            }
                //Sending a request to the servse to get data (image)
               let task = URLSession.shared.dataTask(with:url) {(data, response, error) in
                   if let error = error {
                       return completion(.failure(error))
                   }
                    else if let data = data {
                        completion(.success(data))}
    //                else if let responde = response {}
               }

                task.resume()
            }
    }
    func getImageData (from url:URL, completion: @escaping(Data?,URLResponse?, Error?)->()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()}
}
 


