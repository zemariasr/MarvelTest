//
//  APIMarvel.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class APIMarvel {
    // informacoes na pagina da marvel do desenvolvedor
    static private let basepath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "b60bc87d5641dae8eab0063d5d229761666e5067"
    static private let publicKey = "9533b37a303cbcb29bec9e4b444b30be"
    static private let limit = 20

    
    class func loadCharacters(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        
        let offset = page * limit
        
        // para buscar um personagem especifico pelo nome inicial
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        
        // montagem da url de consulta
        let url = basepath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredetials()
        print(url)
        
        // Alamofire
        AF.request(url).responseJSON { (response) in
            
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(marvelInfo)
            
        }
        
        
    }
    
    // MOntar a função caso precise fazer especifico para as revistas
   // class func loadComics(
    
    
    
    
    
    
    
    
    
    
    // constroe a url com todas as credenciais
    private class func getCredetials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        // usado o lowercase pois o MD5 devolve em maiusculo, e a marvel quer minusculo
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
    }
}


