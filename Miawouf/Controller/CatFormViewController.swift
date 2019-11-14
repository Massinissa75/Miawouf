//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Massinissa_theking on 03/11/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController {
  
  var cat: Pet!
  // MARK: - Outlets
  @IBOutlet weak var nameTxtFld: UIStackView!
  @IBOutlet weak var nameTxtField: UITextField!
  @IBOutlet weak var NbrTxtFld: UITextField!
  @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
  @IBOutlet weak var majoritySwitch: UISwitch!
  @IBOutlet weak var racePickeView: UIPickerView!
}
  // MARK: - PickerView
extension CatFormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return catRaces.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return catRaces[row]
  }
}
  //MARK: - Keyboard
extension CatFormViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  @IBAction func dismissKeybord(_ sender: UITapGestureRecognizer) {
    nameTxtField.resignFirstResponder()
    NbrTxtFld.resignFirstResponder()
  }
}
  //MARK: - Validate
extension CatFormViewController {
  @IBAction func validate() {
    createPetObject()
    checkPetStatus()
  }
  private func createPetObject () {
    let name = nameTxtField.text
    let phone = NbrTxtFld.text
    let genderIndex = genderSegmentedControl.selectedSegmentIndex
    let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
    let hasMajority = majoritySwitch.isOn
    let raceIndex = racePickeView.selectedRow(inComponent: 0)
    let race = catRaces[raceIndex]
    
    cat = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
  
  }
  private func checkPetStatus(){
    switch cat.status {
    case .accepted:
      performSegue(withIdentifier: "segueToSuccess", sender: nil)
    case .rejected(let error):
      let alert = UIAlertController(title: "MiaOups", message: error, preferredStyle: .alert)
      let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    }
  }
}
///Navigation
extension CatFormViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueToSuccess" {
      let successVc = segue.destination as! CatSuccessViewController
      successVc.cat = cat
    }
  }
}
