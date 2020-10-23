//
//  LastViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

protocol EditedValue{
    func dataIsChangedTo (newData: String)
}

class LastViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var editdataTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var editingDetailDelegate: EditedValue?
    var newData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editdataTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        editingDetailDelegate?.dataIsChangedTo(newData: editdataTextField.text ?? "Hello")
    }
    
  
}
