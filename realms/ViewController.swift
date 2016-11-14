//
//  ViewController.swift
//  realms
//
//  Created by Mean Reaksmey on 10/31/16.
//  Copyright © 2016 Mean Reaksmey. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyJSON
import PDFReader

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryPeople()
    }
    
    
    
    
    
    
    
    
    @IBAction func btnDetail(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present (nvc, animated: true, completion: nil)
        self.navigationController?.show(vc, sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.TableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdd(_ sender: AnyObject) {
        queryPeople()
        self.TableView.reloadData()
        print("======add succes")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  allPeople.count
    }
    var apiURL = ""
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NibTableViewCell", for: indexPath) as! NibTableViewCell
        DispatchQueue.main.async {
            print("====cell",allPeople)
            cell.txtID.text = "\(allPeople[indexPath.row].id)"
            cell.txtName.text =  allPeople[indexPath.row]["name"] as? String
            cell.txtAge.text =  "\(allPeople[indexPath.row].age)"
            cell.txtRace.text =  allPeople[indexPath.row]["race"] as? String
        }
        return cell
    }
}

class NibTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtRace: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
