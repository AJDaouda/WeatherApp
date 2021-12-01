//
//  TableViewController.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import UIKit

class SearchCityController: UITableViewController {
    
//    lazy var EditViewController = UISearchController()
    weak var EditVRef: EditViewController?
//    weak var ParentVRef: ParentViewController?
    
    var Citylist: [String] = []{
        didSet {
            print("Cittylist Array updated")
            DispatchQueue.main.async { self.tableView.reloadData() }}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("My FINAL LIST:\(Citylist)")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Citylist.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSVC = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath)
        cellSVC.textLabel?.text = Citylist[indexPath.row]
        return cellSVC
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        EditVRef?.navigationItem.title = Citylist[indexPath.row]
        let CityToSave = City(context: CoreDataStack.shared.persistentContainer.viewContext)
        CityToSave.cityname = Citylist[indexPath.row]
        print(CityToSave.cityname)
        do{
            try!CoreDataStack.shared.persistentContainer.viewContext.save()        }
        catch{
                print("Something went wrong")
        
        }

    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let toEditSegue = segue.destination as? EditViewController{
            self.EditVRef = toEditSegue
            
            
        }}
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */


