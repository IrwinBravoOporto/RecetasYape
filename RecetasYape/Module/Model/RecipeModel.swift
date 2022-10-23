//
//  RecipeModel.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var name:  String?
    var category: String? = "Sin categoría"
    var ingredients: [String]?
    var description: String? = "Sin descripción"
    var imagen: String?
    var country: String? = "Desconocido"
    var city: String? = ""
    var flag: String? = ""
}


