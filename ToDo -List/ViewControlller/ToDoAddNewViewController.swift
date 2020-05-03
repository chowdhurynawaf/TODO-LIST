//
//  ToDoAddNewViewController.swift
//  ToDo -List
//
//  Created by as on 5/3/20.
//  Copyright © 2020 as. All rights reserved.
//

import UIKit


protocol AddnewItemProtocol : class {
    func didAddNewItem(addVm : AddNewToDoViewModel)
}

class ToDoAddNewViewController: UIViewController {
    
    @IBOutlet weak var taskTextField : UITextField!
    @IBOutlet weak var notesTextTextField : UITextField!
    
    var viewModl = AddNewToDoViewModel()
    
    weak var delegate : AddnewItemProtocol? = nil
    
  


    override func viewDidLoad() {
        super.viewDidLoad()



    }
    
    @IBAction func didTapSaveBtn (_ sender : UIBarButtonItem){
          let todo = ToDo(task: taskTextField.text!, completed: false, notes: notesTextTextField.text!)
          viewModl.newToDo = todo
          self.delegate?.didAddNewItem(addVm: viewModl)
          navigationController?.popViewController(animated: true)
          
      }
    

    

}
