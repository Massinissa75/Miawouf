//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by Massinissa_theking on 03/11/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {

  var cat: Pet!
  
  @IBOutlet weak var successMessage: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
  setTextLabel()
  }
  
  @IBAction func dismiss(_ sender: Any) {
     dismiss(animated: true, completion: nil)
   }

  private func setTextLabel (){
    if let name = cat.name {
      successMessage.text = """
      Miaou de bienvenue à
      \(name)
      Vous avez bien été ajouté à notre base de données ! Nous vous enverrons un SMS dès que nous avons une âme sœur à vous proposer !
    """
    }
  }

}
