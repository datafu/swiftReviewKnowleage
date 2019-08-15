//
//  TodoItem.swift
//  swiftReviewKnowleage
//
//  Created by fushp on 2019/7/17.
//  Copyright © 2019年 fushp. All rights reserved.
//

import Foundation

class TodoItem: NSObject, NSCoding {
    
    var name: String = ""
    var isFinished: Bool = false
    required init?(coder aDecoder: NSCoder) {
        isFinished = aDecoder.decodeBool(forKey: "isFinished")
        name = aDecoder.decodeObject(forKey: "name") as! String
        
    }
    
    init(name: String, isFinished: Bool) {
        self.name = name
        self.isFinished = isFinished
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(isFinished, forKey: "isFinished") 
        
    }
    
    func toggleFinished() {
        isFinished = !isFinished
    }
    
    
}
