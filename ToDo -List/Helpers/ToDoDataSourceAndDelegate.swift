//
//  ToDoDataSourceAndDelegate.swift
//  ToDo -List
//
//  Created by as on 5/3/20.
//  Copyright © 2020 as. All rights reserved.
//

import Foundation
import UIKit

protocol ToDoItemTappedDelegate : class {
    func setCompletedState(index : Int , completion : @escaping() -> Void)
}

class ToDoListDataSourceDelegate : NSObject , UITableViewDelegate , UITableViewDataSource{
    
    
    var viewModel : ToDoViewModel
    
    weak var delegate : ToDoItemTappedDelegate? = nil
    
     init(viewModel : ToDoViewModel) {
        self.viewModel = viewModel
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoCell
        cell.todo = viewModel.itemAt(index: indexPath.item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setCompletedState(index: indexPath.item, completion: {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}
