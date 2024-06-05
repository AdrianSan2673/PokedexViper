//
//  Utils.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 02/05/24.
//

import Foundation
import UIKit

class Utils {
    static var shared: Utils = {
        let instance = Utils()
        return instance
    }()
    
    private init(){}
    
    let constantURLPokemonAPI = "https://pokeapi.co/api/v2/"
    
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
    
    func parsearJson<T: Decodable>(_ dynamicType: T.Type, data: Data) async throws -> Result<T,Error> {
        let decoder = JSONDecoder()
        //let dataDecoded = try decoder.decode(T.self, from: data)
        //return .success(dataDecoded)
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
}

extension String {
    static var empty: String {
        return ""
    }
}
