//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by ac on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class AddTriviaViewController: UIViewController {
    
    var location = Location()
    
    @IBOutlet weak var triviaTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triviaTextField.accessibilityLabel = "Trivium Text Field"
        triviaTextField.accessibilityIdentifier = "Trivium Text Field"
        
        saveButton.accessibilityIdentifier = "Save Button"
        saveButton.accessibilityLabel = "Save Button"
        
        cancelButton.accessibilityLabel = "Cancel Button"
        cancelButton.accessibilityIdentifier = "Cancel Button"
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let triviaText = triviaTextField.text {
            let trivia = Trivium(content: triviaText, likes: 0)
            location.trivia.append(trivia)
            dismiss(animated: true)
        }
    }
    
    
    
}
