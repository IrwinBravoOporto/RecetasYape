//
//  RecipeModel.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var name:  String
    var category: String? = "Sin categoría"
    var ingredients: [String]
    var description: String? = "Sin descripción"
    var imagen: String
    var country: String? = "Desconocido"
    var city: String? = ""
    var flag: String? = ""
}

let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sapien sem, commodo ac metus sed, dignissim cursus neque. Phasellus rutrum eros efficitur sapien lobortis lobortis. Suspendisse dapibus rhoncus arcu vel pellentesque. Aliquam justo ipsum, dignissim vel fermentum venenatis, sagittis id odio. Vivamus euismod tellus eu risus dictum mollis. Ut eget mi imperdiet, ultrices erat ut, tristique lacus. Integer volutpat urna vitae molestie egestas. Cras dui lorem, sagittis vel sagittis non, tristique nec nisi. Aenean vitae dui vel felis tincidunt mattis. Curabitur tristique est dolor, accumsan elementum turpis rutrum id. Curabitur pulvinar nisl vitae leo tempus, eget efficitur libero iaculis.orem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sapien sem, commodo ac metus sed, dignissim cursus neque. Phasellus rutrum eros efficitur sapien lobortis lobortis. Suspendisse dapibus rhoncus arcu vel pellentesque. Aliquam justo ipsum, dignissim vel fermentum venenatis, sagittis id odio. Vivamus euismod tellus eu risus dictum mollis. Ut eget mi imperdiet, ultrices erat ut, tristique lacus. Integer volutpat urna vitae molestie egestas."


var recipeList = [
    Recipe(name: "Lasagna Bolognesa", category: "Plato", ingredients: ["Pulpa de cerdo 400g", "Salsa de Tomates", "Crema 500ml"], description: loremIpsum, imagen: "lasagna", country: "Italia", city: "Napoles", flag: "it"),
    Recipe(name: "Pizza", category: "Aperitivo", ingredients: ["Masa", "Queso Mozarella", "Salsa de tomates", "Peperoni"], description: loremIpsum, imagen: "pizza", country: "Italia", city: "Napoles", flag: "it"),
    Recipe(name: "Tiramisú", category: "Postre", ingredients: [], description: loremIpsum, imagen: "tiramisu", country: "Italia", city: "Venecia", flag: "it"),
    Recipe(name: "Sashimi", category: "Aperitivo", ingredients: ["Salmón crudo", "Sésamo", "Salsa de Soya"], description: loremIpsum, imagen: "sashimi", country: "Japon", city: "Saitama", flag: "jp"),
    Recipe(name: "Pure de papas", category: "Plato", ingredients: ["Papas 300g", "Leche 250ml"], description: loremIpsum, imagen: "puredepapas", country: "Francia", city: "Lyon", flag: "fr"),
]
