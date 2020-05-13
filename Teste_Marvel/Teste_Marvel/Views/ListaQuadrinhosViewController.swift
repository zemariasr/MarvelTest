//
//  ListaQuadrinhosViewController.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 13/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit
import Kingfisher

class ListaQuadrinhosViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var iv_character: UIImageView!
    @IBOutlet weak var lb_nome: UILabel!
    @IBOutlet weak var lb_descricao: UILabel!
    
    
    @IBOutlet weak var tabeView: UITableView!
    
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lb_nome.text = character.name
        lb_descricao.text = character.description
        if let url = URL(string: character.thumbnail.url) {
            iv_character.kf.indicatorType = .activity
            iv_character.kf.setImage(with: url)
        } else {
            iv_character.image = nil
        }
        
        iv_character.layer.borderColor = UIColor.yellow.cgColor
        iv_character.layer.borderWidth = 1
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.comics.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLista", for: indexPath)
        
        let comic = character.comics.items[indexPath.item]
        cell.textLabel?.text = comic.name
        
        return cell
        
    }
    
    
    
    
}
