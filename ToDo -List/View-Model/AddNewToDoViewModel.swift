//
//  AddNewToDoViewModel.swift
//  ToDo -List
//
//  Created by as on 5/3/20.
//  Copyright © 2020 as. All rights reserved.
//

import Foundation

class AddNewToDoViewModel {
    
    
    private var toDoItem:ToDo?
    
    
    var newToDo : ToDo? {
        get {
            return toDoItem
        }
        set {
            toDoItem = newValue
        }
    }
}
