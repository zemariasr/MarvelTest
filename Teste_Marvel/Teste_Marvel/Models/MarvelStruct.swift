//
//  MarvelStruct.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import Foundation

struct MarvelInfo: Codable {
    // verifica os dados do servidor
    let code: Int
    let status: String
    let data: MarvelData
    
}
// verifica as quantidades, limite e personagens
struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}
// Personagens
struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [CharacterURL]
    let comics: ComicList
}
// imagem
struct Thumbnail: Codable {
    let path: String
    let ext: String
    
   var url: String {
        return path + "." + ext
    }
  // resolve o problema da palavra reservada do sistema
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
   }
    
}
    struct CharacterURL: Codable {
        let type: String
        let url: String
    }

struct ComicList: Codable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [ComicSummary]
 
}

struct ComicSummary: Codable {
    let resourceURI:String
    let name: String
}
