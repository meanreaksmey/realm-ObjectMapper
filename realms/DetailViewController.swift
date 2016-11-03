//
//  DetailViewController.swift
//  realms
//
//  Created by Mean Reaksmey on 11/2/16.
//  Copyright © 2016 Mean Reaksmey. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtRace: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnAction(_ sender: AnyObject) {
        if sender.titleLabel??.text == "Insert" {
            addHuman()
        }else if sender.titleLabel??.text == "Delete" {
            deleteData(name: txtName.text!)
        }else if sender.titleLabel??.text == "Update" {
            deleteData(name: txtName.text!)
        }

        
        
    }
    func addHuman(){
        if validateInput(){
            let mike = Human()
            mike.id = mike.IncrementaID()//self.txtID.text!//NSInteger(self.txtID.text!)!
            mike.name = self.txtName.text!
            mike.age  = NSInteger(self.txtAge.text!)!
            mike.race = self.txtRace.text!
            let realm = try! Realm()
            try! realm.write {
                if validateData(item: mike.name){
                    print("Added \(mike.name) to Realm\(realm)")
                    realm.add(mike)
                }
            }
            callBack()
        }
    }
    
    func getDataJson(){
        
    }
    
    
    func deleteData(name:String){
        if (txtName.text?.isEmpty)!{
            alertMessage(message: "Not Found Data Delete", btnTitle: "OK")
            return
        }
        let realm = try! Realm()
        try! realm.write {
            let deletedNotifications = realm.objects(Human.self).filter("name == %@",name)
            realm.delete(deletedNotifications)
        }
        callBack()
    }
    func searchData(search_name:String,new_name:String){
        
        for data in getAllPeople(){
            if search_name == data.name{
                let realm = try! Realm()
                try! realm.write {
                    if validateData(item: new_name){
                        data.name = new_name
                    }
                }
            }
        }
    }
    
    func validateInput()->Bool{
        if (txtName.text?.isEmpty)! || (txtRace.text?.isEmpty)! || (txtAge.text?.isEmpty)! {
            alertMessage( message: "Input Invalid ", btnTitle: "OK")
            return false
        }
        return true
    }
    func alertMessage(title:String = "Information",message:String,btnTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func callBack(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present (nvc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
