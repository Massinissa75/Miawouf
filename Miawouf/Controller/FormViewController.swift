//
//  FormViewController.swift
//  Miawouf
//
//  Created by Massinissa_theking on 03/11/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
  
  var dog: Pet!
  /// OUTLET
  @IBOutlet weak var nameTxtField: UITextField!
  @IBOutlet weak var nbrTxtField: UITextField!
  @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
  @IBOutlet weak var majoritySwitch: UISwitch!
  @IBOutlet weak var racePickerView: UIPickerView!
}
/// PickerView
extension FormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return dogRaces.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return dogRaces[row]
  }
}
// MARK: - Keyboard
extension FormViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    nameTxtField.resignFirstResponder()
    nbrTxtField.resignFirstResponder()
  }
}

// Mark: - Validate
  extension FormViewController {
    
  @IBAction func validate() {
    createPetObject()
    checkPetStatus()
  }
  
  private func createPetObject () {
     let name = nameTxtField.text
     let phone = nbrTxtField.text
     let genderIndex = genderSegmentedControl.selectedSegmentIndex
     let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
     let hasMajority = majoritySwitch.isOn
     let raceIndex = racePickerView.selectedRow(inComponent: 0)
     let race = catRaces[raceIndex]
     
    dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
   }
  private func checkPetStatus() {
    switch dog.status {
    case .accepted:
      performSegue(withIdentifier: "segueToSuccess", sender: nil)
    case .rejected(let error):
      let alert = UIAlertController(title: "WoufOups", message: error, preferredStyle: .alert)
      let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    }
  }
}
/// Navigation 
extension FormViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueToSuccess" {
      let successVc = segue.destination as! SuccessViewController
      successVc.dog = dog
    }
  }
}
