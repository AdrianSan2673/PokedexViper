//
//  Utils.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 02/05/24.

import Foundation
import UIKit

class Utils {
    static var shared: Utils = {
        let instance = Utils()
        return instance
    }()
    
    private init(){}
    
    let constantURLPokemonAPI = "https://pokeapi.co/api/v2/"
    
    private let urlSession = URLSession.shared
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func loadURLAndDecodePokeApi<T: Codable>(url: URL, params: [String: String]? = nil, completion: @escaping (T?, SessionError?) -> ()) {
        
        //save URL

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(nil, .invalidEndPoint)
            return
        }
        
        //Recive params and quaryItems
        if let params = params {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.key) }
        }
        
        // complete final url
        guard let finalURL = urlComponents.url else {
            completion(nil, .invalidEndPoint)
            return
        }
        
        //start task
        urlSession.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else {return}
            if error != nil {
                completion(nil, .apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            let decodificador = JSONDecoder()
            do {
                let decodeResponse = try decodificador.decode(T.self, from: data)
                completion(decodeResponse, nil)
            } catch let decodingError as DecodingError {
                switch decodingError {
                    case .typeMismatch(let type, let context):
                            print("Type mismatch error: \(type), context: \(context)")
                            completion(nil,.typeMismatch)
                    case .keyNotFound(let key, let context):
                            print("Key not found error: \(key), context: \(context)")
                            completion(nil, .keyNotFound)
                    case .valueNotFound(let type, let context):
                            print("Value not found error: \(type), context: \(context)")
                            completion(nil, .valueNotFound)
                    case .dataCorrupted(let context):
                            print("Data corrupted error, context: \(context)")
                            completion(nil, .invalidResponse)
                    default:
                            print("Decoding error: \(decodingError)")
                            completion(nil, .serializationError)
                    }
            } catch {
                completion(nil, .serializationError)
            }
        }.resume()
    }
    
    func loadURLAndDecodeAPIList<T: Codable>(url: URL, params: [String: String]? = nil, completion: @escaping (T?, SessionError?) -> ()) {
        
        //save URL
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(nil, .invalidEndPoint)
            return
        }
        
        //Recive params and quaryItems
        if let params = params {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.key) }
        }
        
        // complete final url
        guard let finalURL = urlComponents.url else {
            completion(nil, .invalidEndPoint)
            return
        }
        
        //start task
        urlSession.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else {return}
            if error != nil {
                completion(nil, .apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            let decodificador = JSONDecoder()
            do {
                
                if let safeData = data.parseData(quitarString: "null,") {
                    let decodeResponse = try decodificador.decode(T.self, from: safeData) 
                    completion(decodeResponse, nil)
                } else {
                    completion(nil, .invalidResponse)
                }
                
            } catch let decodingError as DecodingError {
                switch decodingError {
                    case .typeMismatch(let type, let context):
                            print("Type mismatch error: \(type), context: \(context)")
                            completion(nil,.typeMismatch)
                    case .keyNotFound(let key, let context):
                            print("Key not found error: \(key), context: \(context)")
                            completion(nil, .keyNotFound)
                    case .valueNotFound(let type, let context):
                            print("Value not found error: \(type), context: \(context)")
                            completion(nil, .valueNotFound)
                    case .dataCorrupted(let context):
                            print("Data corrupted error, context: \(context)")
                            completion(nil, .invalidResponse)
                    default:
                            print("Decoding error: \(decodingError)")
                            completion(nil, .serializationError)
                    }
            } catch {
                completion(nil, .serializationError)
            }
        }.resume()
    }
    
    func parsearJson<T: Decodable>(_ dynamicType: T.Type, data: Data) async throws -> Result<T,Error> {
        let decoder = JSONDecoder()
        return Result { try decoder.decode(T.self, from: data)}
    }
}

public typealias RequestResult<T: Decodable> = Result<T, Error>

enum SessionError: Error {
    case apiError
    case invalidEndPoint
    case invalidResponse
    case noData
    case serializationError
    case typeMismatch
    case keyNotFound
    case valueNotFound
    
    var localizedDescription: String{
        switch self {
        case .apiError: return "Failed to Fetch data"
        case .invalidEndPoint: return "Invalid End Point"
        case .invalidResponse: return "Invalid Response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        case .typeMismatch: return "Type mismatch error"
        case .keyNotFound: return "Key not found error"
        case .valueNotFound: return "valueNotFound"
        }
    }
    var errorUserInfo: [String: Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

enum EndPoints: String {
    case pokemonApi = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    case pokemonMoves = "move/"
    case pokemonPokemon = "pokemon/"
    case pokemonRegion = "pokedex/"
}

extension Data {
    func parseData(quitarString palabra: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
        
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
    
    func haveNull(checkString word: String) -> Bool {
        let dataAsString = String(data: self, encoding: .utf8)
        if ((dataAsString?.starts(with: word)) != nil) {
            return true
        } else {
            return false
        }
    }
}

extension String {
    static var empty: String {
        return ""
    }
}
