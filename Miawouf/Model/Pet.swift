//
//  Pet.swift
//  Miawouf
//
//  Created by Massinissa_theking on 12/11/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import Foundation

struct Pet {
    enum Gender {
        case male, female
    }

    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}

  extension Pet {
    enum Status {
        case accepted
        case rejected(String)
    }

    var status: Status {
        if name == nil || name == "" {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        if phone == nil || phone == "" {
            return .rejected("Vous n'avez pas indiqué votre telephone !")
        }
        if race == nil || race == "" {
            return .rejected("Quelle est votre race ?")
        }
        if !hasMajority {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }
}
