//
//  Pelicula.swift
//  ProyectoFinal_Peliculas
//
//  Created by alumno on 13/11/24.
//

import Foundation

struct PeliculaRespuesta: Decodable {
    let resultado: [Pelicula]
}

struct Pelicula: Decodable {
    let id: Int
    let title: String
    let backdropPath: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
}
