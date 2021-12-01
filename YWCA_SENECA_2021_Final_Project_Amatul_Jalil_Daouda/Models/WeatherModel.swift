//
//  Weather.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import Foundation
struct WeatherResult: Codable{
    var weather:[Weather]?
    var main:Main
}

struct Weather: Codable{
    var icon: String
}
    
struct Main: Codable{
    var temp: Float
}


//enum CodingKeys: String, CodingKey{
//        case temp
//        case icon
//    }
    
//    init(from decoder: Decoder) throws{
//        let container = try? decoder.container(keyedBy: CodingKeys.self)
////        self.weather.{i} = try! container!.decode(String.self, forKey: CodingKeys.icon)
//        self.main.temp = Float(try! container!.decode(Int.self, forKey: CodingKeys.temp))
        
    
