//
//  TableViewController.swift
//  LoveBooks
//
//  Created by jk on 2016/9/29.
//  Copyright © 2016年 jk. All rights reserved.
//

import UIKit
import QuickLook
class TableViewController: UITableViewController {

    var booksArr = NSMutableArray()
    let docInteractionController = UIDocumentInteractionController()
    let fileManager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell");
        
        ////////
        
//        let image  = UIImage(named: "64x64分享图")
//        let imageData : NSData = UIImagePNGRepresentation(image!)! as NSData
//        
//        let patch = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true
//        )
//        let documentPath = patch[0]
//        var filePath = documentPath + "/64x64分享图.png"
//       print(filePath)
//        
//        imageData.write(toFile: filePath, atomically: true)
//        let data : NSData = NSData(bytes: "hahahahha", length: 10)
//        filePath = documentPath + "/hehe.txt"
//        
//        data.write(toFile: filePath, atomically: true)
//        
//        
        
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let documentDir = documentPaths[0]
       
        
        let fileList =  fileManager.subpaths(atPath: documentDir)
        
        for file in fileList! {
            
            self.booksArr.add(file)
            
        }
        print(fileList)
        self.tableView.reloadData()
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    public func setupDocumentController(URL:NSURL ){
    
        self.docInteractionController.url = URL as URL
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.booksArr.count;
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        var fileURL = NSURL()
        let documentPatchs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentDir = documentPatchs[0]
        let patch = documentDir.appending(self.booksArr[indexPath.row] as!String)
        fileURL = NSURL.fileURL(withPath: patch) as NSURL
        self.setupDocumentController(URL: fileURL)
        cell.booksName.text = self.booksArr[indexPath.row] as?String
        let iconCount = self.docInteractionController.icons.count
        if iconCount > 0 {
            cell.booksImage.image = self.docInteractionController.icons[indexPath.row]
        }
        
        
        
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

}

