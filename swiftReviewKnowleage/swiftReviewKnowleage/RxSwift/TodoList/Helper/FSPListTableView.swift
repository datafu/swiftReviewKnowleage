//
//  TodoListTableView.swift
//  swiftReviewKnowleage
//
//  Created by fushp on 2019/7/17.
//  Copyright © 2019年 fushp. All rights reserved.
//

import UIKit

// UITableView delegate
extension FSPTodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let todo = todoTtems.value[indexPath.row]
            todo.toggleFinished()

            todoTtems.value[indexPath.row] = todo
            
            configureStatus(for: cell, with: todo)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        todoTtems.value.remove(at: indexPath.row)
    }
}

// UITableView data source
extension FSPTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.todoTtems.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TodoItem", for: indexPath)
        let todo = todoTtems.value[indexPath.row]
        
        configureLabel(for: cell, with: todo)
        configureStatus(for: cell, with: todo)
        
        return cell
    }
}
