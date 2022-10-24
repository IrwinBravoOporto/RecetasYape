# RecetasYape
Recetas - VIPER

## Stubbing Network Requests for Unit Tests

Generally, it is not a good idea to rely on the actual network requests for unit tests because it adds too much dependency on tests. One way to stub networking is to subclass `URLProtocol`.

### 1. Arquitectura `VIPER`
 Se tiene la el patron de Arquitectura VIPER, y para tal reto se uso la configuracion siguiente -> Router - Presenter - Configurator - Controller - View 

### 1. Patron de diseño 

Observer: Se uso el patrón observer, para poder controlar la animacion customizada del TabBar -> NotificationCenter


### 1. Separacion de Capas  

- Component : Para ordenar las animaciones customizadas como el Loader y ImageCache
- Utils: Para definir data constante y extensiones de componentes del UIKit.
- CustomButton: Creacion de buttons customizados.
- Resources: Creacion del componenete TabBar Light
- Module: 
          - Model: Estructuracion de data
          - Presentation: Logica del proyecto - VIPER
                          - Search: Busqueda de foods
                          - MapKit: Ubicación del origen de la receta
                          - Home: Lista de todos los platos tipicos de diferentes paises.
                          - FoodDetail: Detalle del plato seleccionado.
          - View: Vistas de las diferentes capas

Observaciones: No se usaron librerias.
