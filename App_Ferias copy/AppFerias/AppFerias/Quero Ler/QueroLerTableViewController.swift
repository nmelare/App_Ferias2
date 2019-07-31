//
//  QueroLerTableViewController.swift
//  AppFerias
//
//  Created by Nathalia Melare on 11/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class QueroLerTableViewController: UITableViewController {
    
    var context: NSManagedObjectContext?
    
    var books: [Book?] = []
    var booksJson: [Books] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        navigationItem.title = "Quero Ler"
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let label1 = UILabel()
//            label1.text = "  Quero Ler"
//            label1.textColor = #colorLiteral(red: 0.1976624131, green: 0.2988785505, blue: 0.5258377194, alpha: 1)
//            label1.font = UIFont.boldSystemFont(ofSize: 22.0)
//            return label1
//    }

//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 30
//        }
//        return 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "ListaQueroLer") as? ListaQueroLerTableViewCell {
        cell.imagemLivroQueroLer.image = UIImage(named: books[indexPath.row]?.image ?? "Erro")
        cell.tituloLivroQueroLer.text = books[indexPath.row]?.title
        cell.autorLivroQueroLer.text = books[indexPath.row]?.authors
        
        return cell
    }
        return UITableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = context {
            do {
                let books = try context.fetch(Book.fetchRequest())
                guard let booksTry = books as? [Book] else {
                    navigationItem.title = "404"
                    return
                }
                self.books = booksTry
            }
            catch {
                print("Err loading books")
                return
            }
        }
        else {
            return
        }
        tableView.reloadData()
    }

    /*
    

        // Configure the cell...

        return cell
    }
    */

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LivroInfo") as? LivroInfoTableViewController {
    //
    //            if let navigator = navigationController {
    //                navigator.pushViewController(viewController, animated: true)
    //            }
    //        }
    //    }
}
