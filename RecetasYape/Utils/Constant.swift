//
//  Constant.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import Foundation

class Constants {
    struct dataFood {
        static let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sapien sem, commodo ac metus sed, dignissim cursus neque. Phasellus rutrum eros."
        
        static let dataRecipe = [
            Recipe(name: "Ceviche", category: "Plato", ingredients: ["- 1 pizca de pimienta", "\n- 1 kilo de pescado", "\n- 12 limones", "\n- 1 pizca de sal y pimienta", "\n- 1 taza de caldo de pescado", "\n- 1 cebolla", "\n- 1 aji amarillo picado","\n- aji limo", "\n- 1 camote"], description: loremIpsum, imagen: "ceviche_peruano", country: "Peru", city: "Lima", flag: "pe",latitude: -12.0725923,longitude: -77.0551006),
            Recipe(name: "Poutine", category: "Aperitivo", ingredients: ["- 1 kilo de papas", "\n- 2 cucharadas de harina con trigo", "\n- 1/2 kilo de queso mozzarella", "\n- 2 cucharadas de Mantequilla"], description: loremIpsum, imagen: "poutine", country: "Canadá", city: "Toronto", flag: "ca", latitude: 43.6784176,longitude: -79.4113711),
            Recipe(name: "Lasagna", category: "Plato", ingredients: ["- Pulpa de cerdo 400g", "\n- Salsa de Tomates", "\n- Crema 500ml"], description: loremIpsum, imagen: "lasagna", country: "Italia", city: "Napoles", flag: "it",latitude: 40.853586,longitude: 14.1729677),
            Recipe(name: "Pizza", category: "Aperitivo", ingredients: ["- Masa", "\n- Queso Mozarella", "\n- Salsa de tomates", "\n- Peperoni"], description: loremIpsum, imagen: "pizza", country: "Italia", city: "Napoles", flag: "it",latitude: 40.853586,longitude: 14.1729677),
            Recipe(name: "Tiramisú", category: "Postre", ingredients: [], description: loremIpsum, imagen: "tiramisu", country: "Italia", city: "Venecia", flag: "it",latitude: 35.9990368,longitude: 137.1387056),
            Recipe(name: "Sashimi", category: "Aperitivo", ingredients: ["- Salmón crudo", "\n- Sésamo", "\n- Salsa de Soya"], description:  loremIpsum, imagen: "sashimi", country: "Japon", city: "Saitama", flag: "jp",latitude: 35.9990368,longitude: 137.1387056),
            Recipe(name: "Pure de papas", category: "Plato", ingredients: ["- Papas 300g", "\n- Leche 250ml"], description: loremIpsum, imagen: "puredepapas", country: "Francia", city: "Lyon", flag: "fr",latitude: 45.7609200,longitude: 4.8066235)
        ]
    }
}
