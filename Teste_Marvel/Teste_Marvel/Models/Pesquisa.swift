//
//  Pesquisa.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit

class Pesquisa {
    
    var titulo: String
    var mensagem: String
    var nome: String
    var botao: String
    
    init(titulo: String, mensagem: String, nome: String, botao: String) {
        self.titulo = titulo
        self.mensagem = mensagem
        self.nome = nome
        self.botao = botao
}
    func getNome() -> UIAlertController {
        
        let pesquisa = UIAlertController(title: titulo, message: mensagem, preferredStyle: .actionSheet)
        let pesquisar = UIAlertAction(title: botao, style: .default) { (qualNome) in
            
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        pesquisa.addAction(pesquisar)
        pesquisa.addAction(cancelar)
        return pesquisa
        
    }

}
