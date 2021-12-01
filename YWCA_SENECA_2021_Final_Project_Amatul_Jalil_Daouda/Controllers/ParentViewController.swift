//
//  TableViewController.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import UIKit
import CoreData

class ParentViewController: UITableViewController, UISearchBarDelegate, NSFetchedResultsControllerDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).pers
    lazy var myFetchResult : NSFetchedResultsController <City> = {
        let fetch:NSFetchRequest<City> = City.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key: "cityname", ascending: true)]
        let ftcResult = NSFetchedResultsController(fetchRequest: fetch, managedObjectContext: CoreDataStack.shared.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        ftcResult.delegate = self
        return ftcResult
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchBar.delegate=self
        try? myFetchResult.performFetch()
        print("My name")
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myFetchResult.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFetchResult.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let myCity = myFetchResult.object(at: indexPath)
        cell.configureCell(myCityName: myCity)
  // Configure the cell...
        return cell
    }
    

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let obj = myFetchResult.object(at: indexPath)
                        CoreDataStack.shared.persistentContainer.viewContext.delete(obj)
                        CoreDataStack.shared.saveContext()

        }    
    }

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
