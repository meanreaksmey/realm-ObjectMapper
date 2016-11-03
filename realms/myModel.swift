//
//  File.swift
//  realms
//
//  Created by Mean Reaksmey on 10/31/16.
//  Copyright © 2016 Mean Reaksmey. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON
import ObjectMapper

class Human: Object{
    dynamic var id = ""
    dynamic var name = ""
    dynamic var age: NSInteger = 0
    dynamic var race = ""
    
    //    required convenience init?(map: Map) {
    //        self.init()
    //        mapping(map: map)
    //
    //    }
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    //    func mapping(map: Map) {
    //        id <- map["id"]
    //        name <- map["name"]
    //        age  <- map["age"]
    //        race <- map["race"]
    //    }
    
    //Incrementa ID
    func IncrementaID() -> String{
        let realm = try! Realm()
        let RetNext: Array = Array(realm.objects(Human.self).sorted(byProperty: "id"))
        let last = RetNext[RetNext.count-1]
        if RetNext.count > 0 {
            return "\(Int(last.id)! + 1)"
        } else {
            return "1"
        }
    }
}
