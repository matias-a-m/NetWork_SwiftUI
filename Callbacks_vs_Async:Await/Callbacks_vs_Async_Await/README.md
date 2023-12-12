# App Comparativa: Callbacks vs Async/Await

## Descripción

Esta aplicación iOS demuestra el uso de programación asíncrona en Swift, comparando enfoques tradicionales basados en callbacks con el patrón más moderno de async/await. La aplicación obtiene información de personajes de la API de "Rick and Morty" y muestra detalles básicos, como el nombre del personaje, la imagen, el título del primer episodio y la dimensión.

## Características

- Obtiene datos de personajes de la [API de Rick and Morty](https://rickandmortyapi.com/).
- Utiliza el patrón async/await de Swift para operaciones asíncronas.
- Compara y contrasta async/await con enfoques tradicionales basados en callbacks.
- Muestra la información del personaje obtenida en una interfaz de usuario SwiftUI.

## Arquitectura del Código

### Modelo de Datos

- **`CharacterBasicInfo`**: Representa información básica sobre un personaje, incluido el nombre, la URL de la imagen, el título del primer episodio y la dimensión.

- **`CharacterModel`**: Estructura decodable que representa los datos del personaje obtenidos de la API.

- **`EpisodeModel`**: Estructura decodable que representa los datos del episodio obtenidos de la API.

- **`LocationModel`**: Estructura decodable que representa los datos de ubicación obtenidos de la API.

### Vista

- **`ContentView`**: Vista SwiftUI que muestra la información del personaje obtenida de la API.

### ViewModel

- **`ViewModel`**: ObservableObject responsable de manejar las solicitudes de red asíncronas y actualizar la interfaz de usuario.

## Requisitos

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Instalación

1. **Clona el repositorio:**

   ```bash
   git clone https://github.com/your-username/Callbacks-vs-Async-Await.git
