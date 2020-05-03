//
//  ToDoListViewController.swift
//  ToDo -List
//
//  Created by as on 5/3/20.
//  Copyright © 2020 as. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView : UITableView!
    
    var viewModel : ToDoViewModel!
    var dataSource : ToDoListDataSourceDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       viewModel = ToDoViewModel()
       dataSource = ToDoListDataSourceDelegate(viewModel: viewModel)
        dataSource.delegate = self
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        //tableView.estimatedRowHeight = 100
        //tableView.rowHeight = UITableView.automaticDimension
        
            

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func didTapAddNew (_ sender : UIBarButtonItem){
        performSegue(withIdentifier: "addNewToDo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewToDo"{
            let vc = segue.destination as! ToDoAddNewViewController
            vc.delegate = self
        }
    }


}

extension ToDoListViewController : AddnewItemProtocol {
    func didAddNewItem(addVm: AddNewToDoViewModel) {
        if let newToDo = addVm.newToDo {
            viewModel.addNew(todo: newToDo)
        }
    }
    
    
}


extension ToDoListViewController : ToDoItemTappedDelegate{
    func setCompletedState(index: Int, completion: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: "Mark completed", message: "Mark this item completed", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.viewModel.updateCompletedState(index: index, newValue: true)
            completion()
        }))
        alertViewController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
}
