//
//  ViewController.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import UIKit
import CoreData
// When user starts typing on searchBar(on 2nd screen) , the third screen will open up

class EditViewController: UIViewController {
    weak var ParentVRef: ParentViewController?
    
  
    @IBOutlet weak var SearchCVContainer: UIView!
//
    
    lazy var SearchController = UISearchController()
    weak var SearchCVRef = SearchCityController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = SearchController
        configureSearchController()
        print("I am fetchning")}

    
//  #Get the text from searchBar and pass it with the below URl to get the list of the CITY
    
    @objc func getData() {
        // let searchText = searchconroller.searchBar.text ?? ""//Toronto
        //http://gd.geobytes.com/AutoCompleteCity?callback=&q=Toronto
        let searchText = SearchController.searchBar.text ?? ""
    
         let query = [ "q" : searchText, "callback" : "?" ]
        print("I am going to get JSON")
        if searchText.count <= 2 {return} //Search text will go and fetch if I type atleast 2 letters
     Service.shared.getJsonData(myURL: "http://gd.geobytes.com/AutoCompleteCity?",query: query) { (result) in
         switch result{
                case .failure(let error):
                print(error)
               case .success(let data):

            if let xdata = String(data: data, encoding: .utf8)?.cleanJson().data(using: .utf8),
            let result = try? JSONDecoder().decode([String].self, from: xdata){
            let cityNames = result.reduce(into: [String]()) {
            let spliter = $1.split(separator: ",")
            if(spliter.count == 3) {$0.append(String(spliter[0]))}}
            self.SearchCVRef?.Citylist = cityNames}}}}
    
//  Do not forget to add the segueway
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let searchVC = segue.destination as? SearchCityController{
            self.SearchCVRef = searchVC
        //print("Segue for SearchController is Active now")
        }
        // Pass the selected object to the new view controller.
        if let SaveSegue = segue.destination as? ParentViewController{
            self.ParentVRef = SaveSegue

//            ParentViewController.
        }
        if let CancelSegue = segue.destination as? ParentViewController{
            self.ParentVRef = CancelSegue}}
}
extension EditViewController : UISearchResultsUpdating {
    func configureSearchController() {
        print("I am inside configure step2")
        navigationItem.searchController = SearchController
        //I am navigation Item of searchController
        SearchController.searchResultsUpdater = self
        SearchController.obscuresBackgroundDuringPresentation = false
        SearchController.automaticallyShowsSearchResultsController = true
        }
        
        func updateSearchResults(for searchController: UISearchController) {
//            print("I am updating search result and going to fetchdata  from server step4\(String(describing: SearchController.searchBar.text))",,
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(getData), object: nil)
                        perform(#selector(getData), with: nil, afterDelay: 0.3)

//                            getData()
                        }
                    }
                
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */




