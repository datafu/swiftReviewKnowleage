//
//  FSPTodoListViewController.swift
//  swiftReviewKnowleage
//
//  Created by fushp on 2019/7/17.
//  Copyright © 2019年 fushp. All rights reserved.
//

import UIKit
import RxSwift
class FSPTodoListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var addBarBtn: UIBarButtonItem!
    let todoTtems = Variable<[TodoItem]>([])
    let bag = DisposeBag()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
//         loadTodoItems()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        todoTtems.asObservable().subscribe(onNext: { [weak self](todos) in
            self!.updateUI(todos: todos)

        }, onError: nil, onCompleted: {
            print("onCompleted1")
        }){
            print("onDisposed1")
        }.disposed(by:bag)
        
    }
    func updateUI(todos: [TodoItem]) {
        clearBtn.isEnabled = !todos.isEmpty
        addBarBtn.isEnabled = todos.filter { !$0.isFinished }.count < 5
        title = todos.isEmpty ? "Todo" : "\(todos.count) ToDos"
        
        tableview.reloadData()
    }
    
    @IBAction func clearTodoList(_ sender: Any) {
        todoTtems.value.removeAll()
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        let todoItem = TodoItem(name: "Todo Demo", isFinished: false)
        todoTtems.value.append(todoItem)

    }
    
    @IBAction func saveToList(_ sender: Any) {
        
    }
    
   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

}
