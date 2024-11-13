//
//  UtilesJSON.swift
//  ProyectoFinal_Peliculas
//
//  Created by alumno on 13/11/24.
//

import Foundation

class UtilesJSON {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
            
        return jsonDecoder
    }()
        
    static let dateFormatter: DateFormatter = {
        let formato_fecha = DateFormatter()
        formato_fecha.dateFormat = "yyyy-mm-dd"
        return formato_fecha
    }()
    
}
