//
//  ServicioPelicula.swift
//  ProyectoFinal_Peliculas
//
//  Created by alumno on 13/11/24.
//

import Foundation

protocol ServicioPelicula{
    func buscarPeliculas(from endpoint: ListaPeliculas, completion: @escaping (Result<PeliculaRespuesta, PeliculaError>) -> ())
    func buscarPelicula(id: Int, completion: @escaping (Result<Pelicula, PeliculaError>) -> ())
    func busquedaPelicula(query: String, completion: @escaping (Result<PeliculaRespuesta, PeliculaError>) -> ())
    
}

enum ListaPeliculas: String, CaseIterable {
    case nowPlaying = "now-playing"
    case upcoming
    case topRated = "top-rated"
    case popular
    
    var description: String {
        switch self{
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum PeliculaError: Error{
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var descripcion_localizada: String {
        switch self {
        case .apiError: return "No se pudieron recuperar los datos"
        case .invalidEndpoint: return "Endpoint inválido"
        case .invalidResponse: return "Respuesta no válida"
        case .noData: return "Sin datos"
        case .serializationError: return "Fallo al decodificar los datos"
        }
    }
    
    var informacion_usuario_error: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
