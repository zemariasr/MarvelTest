//
//  QuadrinhosViewController.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit
import Kingfisher

class QuadrinhosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var vi_collection: UICollectionView!
    
    @IBOutlet weak var iv_character: UIImageView!
    @IBOutlet weak var lb_nome: UILabel!
    @IBOutlet weak var lb_descricao: UILabel!
    
    var character: Character!
    var comics: [Comic] = []
    var idCharacter: String!
    
    var loadingComics = false
    var currentPage = 0
    var total = 0
    
    var label: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.textColor = .yellow
           return label
       }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idCharacter = String(character.id)
        
        lb_nome.text = character.name
        lb_descricao.text = character.description
        if let url = URL(string: character.thumbnail.url) {
            iv_character.kf.indicatorType = .activity
            iv_character.kf.setImage(with: url)
        } else {
            iv_character.image = nil
        }
        
        iv_character.layer.borderColor = UIColor.yellow.cgColor
        iv_character.layer.borderWidth = 2
        iv_character.layer.cornerRadius = 8
        
        vi_collection.dataSource = self
        vi_collection.delegate = self
        
         label.text = "Buscando Quadrinhos ..."
        
        loadComics()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func loadComics() {
        loadingComics = true
        APIMarvel.loadComics(id: idCharacter) { (info) in
            if let info = info {
            self.comics += info.data.results
                self.total = info.data.total
                print("Total:", self.total, "- já incluidos:", self.comics.count)
              //  DispatchQueue.main.sync {
                    self.loadingComics = false
                    
                self.vi_collection.reloadData()
              //  }
        }
        
    }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return character.comics.items.count
        return comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = vi_collection.dequeueReusableCell(withReuseIdentifier: "cellComic", for: indexPath) as! ComicsCollectionViewCell
        
      //  let comic2 = character.comics.items[indexPath.item]
        
        let comic2 = comics[indexPath.item]
        cell.prepareComic(with: comic2)
        
        // Montar a parte que busca as imagens tb
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item == comics.count - 10 && !loadingComics && comics.count != total {
            currentPage += 1
            loadComics()
        }
        
    }
    
    /*
     // Pagina Infinita
      func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         if indexPath.row == characters.count - 10 && !loadingCharacters && characters.count != total {
             currentPage += 1
             loadCharacters()
         }
     }
     
     */
    
    
}
