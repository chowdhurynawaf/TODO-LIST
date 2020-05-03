//
//  ToDoCell.swift
//  ToDo -List
//
//  Created by as on 5/3/20.
//  Copyright © 2020 as. All rights reserved.
//

import UIKit

class ToDoCell : UITableViewCell{
    
    @IBOutlet weak var taskName : UILabel!
    @IBOutlet weak var taskNote : UILabel!
    
    var todo : ToDo?{
        didSet{
            if let todo = todo{
                taskName.text = todo.task
                taskNote.text = todo.notes
                
                if todo.completed {
                    accessoryType = .checkmark
                    taskName.attributedText = strikeThough(text: todo.task)
                    taskNote.attributedText = strikeThough(text: todo.notes)
                }else{
                    accessoryType = .none
                    //taskName.text = todo.task
                    //taskNote.text = todo.notes
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func strikeThough(text : String) -> NSAttributedString{
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
        
        
    }
    
    
}
