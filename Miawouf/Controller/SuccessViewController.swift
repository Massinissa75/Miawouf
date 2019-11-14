//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by Massinissa_theking on 03/11/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

  var dog: Pet!
  
  @IBOutlet weak var successMessage: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText2()
    }
    
  @IBAction func dismiss(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  private func setLabelText2() {
    if let name = dog.name {
      successMessage.text = """
        Wouf de bienvenue à
        \(name)
        Vous avez bien été ajouté à notre base de données ! Nous vous enverrons un SMS dès que nous avons une âme sœur à vous proposer !
      """
    }
  
  }

}
