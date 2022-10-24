//
//  FlagPortraitComponent.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

struct FlagPortrait {
    let url: String = "https://countryflagsapi.com/png/"
    var flag: String? = ""
    var resultUrl: String {
        return "\(url)\(flag!)"
    }
}
