//
//  TableViewCell.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import UIKit

class TableViewCell: UITableViewCell {
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(myCityName: City)-> Void {
        textLabel?.text = myCityName.cityname
        detailTextLabel?.text = "Temperature"
        imageView?.image = UIImage(systemName: "photo")
        
        if let parsedCityName = myCityName.cityname {
            let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
            let query = ["q":parsedCityName,
                         "appid":apiKey]
            Service.shared.getJsonData(myURL: baseUrl, query: query) { (Result) in
                switch Result{
                case.failure(let error): print (error)
                DispatchQueue.main.async {
                    self.detailTextLabel?.text = "NA"
                    self.imageView?.image = UIImage(systemName: "photo")
                }
                case.success(let data):
                if let data = try? JSONDecoder().decode(WeatherResult.self, from: data){
                    DispatchQueue.main.async {
                        self.detailTextLabel?.text = "\(data.main.temp)"
                    }
                    if let imageIcon = data.weather?[0].icon {
                        var iconURL:URL!
                        iconURL = URL(string:"http://openweathermap.org/img/wn/\(imageIcon)@2x.png")
                                
                        Service.shared.getImageData(from: iconURL){ data,response,error in
                            guard let data = data
                            , error == nil
                            else{return}
                            DispatchQueue.main.async (){
                                [weak self] in
                                self?.imageView?.image = UIImage(data:data)}
                        }}}
                }}}}}



