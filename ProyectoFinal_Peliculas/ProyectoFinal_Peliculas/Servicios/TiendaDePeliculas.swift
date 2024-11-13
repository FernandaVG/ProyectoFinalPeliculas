//
//  TiendaDePeliculas.swift
//  ProyectoFinal_Peliculas
//
//  Created by alumno on 13/11/24.
//

import Foundation

class TiendaDePeliculas: ServicioPelicula{
    
    static let shared = TiendaDePeliculas()
    private init() {}
    
    private let apiKey = "APIKEY"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = UtilesJSON.jsonDecoder
    
    func buscarPeliculas(from endpoint: ListaPeliculas, completion: @escaping (Result<PeliculaRespuesta, PeliculaError>) -> ()) {
        
    }
    
    func buscarPelicula(id: Int, completion: @escaping (Result<Pelicula, PeliculaError>) -> ()){
        
        
    }
    
    func busquedaPelicula(query: String, completion: @escaping (Result<PeliculaRespuesta, PeliculaError>) -> ()){
        
        
    }
    
    private func carga_de_URL<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, PeliculaError>) -> ()) {
        guard var URL_componentes = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
            
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        URL_componentes.queryItems = queryItems
        
        guard let URL_final = URL_componentes.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: URL_final) { (data, response, error) in
            
                        if error != nil {
                            self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                            return
                        }
                        
                        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                            self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                            return
                        }
                        
                        guard let data = data else {
                            self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                            return
                        }
                        
                        do {
                            let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                            self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
                        } catch {
                            self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
                        }
                    }.resume()
        
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, PeliculaError>, completion: @escaping (Result<D, PeliculaError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    
}
