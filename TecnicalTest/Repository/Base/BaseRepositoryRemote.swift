//
//  BaseRepositoryRemote.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BaseRepositoryRemote {
    
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let urlString = Constantes.baseURL + endpoint
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        let request = URLSession.shared

        request.dataTask(with: urlRequest) { (data,response, error) in
            
            guard let letData = data else {
                completion(.failure(.parsingData))
                return
            }
            
            do{
                let json = try JSONDecoder().decode(T.self, from: letData)
                completion(.success(json))
            } catch {
                completion(.failure(.genericError))
            }
        }.resume()
    }
}
