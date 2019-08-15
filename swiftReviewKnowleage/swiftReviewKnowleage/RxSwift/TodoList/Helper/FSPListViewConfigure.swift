//
//  TodoListViewConfigure.swift
//  swiftReviewKnowleage
//
//  Created by fushp on 2019/7/17.
//  Copyright © 2019年 fushp. All rights reserved.
//

import UIKit

let CELL_CHECKMARK_TAG = 1001
let CELL_TODO_TITLE_TAG = 1002

extension FSPTodoListViewController {
    func configureStatus(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(CELL_CHECKMARK_TAG) as! UILabel
        
        if item.isFinished {
            label.text = "✓"
        }
        else {
            label.text = ""
        }
    }
    
    func configureLabel(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(CELL_TODO_TITLE_TAG) as! UILabel
        
        label.text = item.name
    }
}



