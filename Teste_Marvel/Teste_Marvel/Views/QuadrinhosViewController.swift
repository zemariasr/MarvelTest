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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lb_nome.text = character.name
        lb_descricao.text = character.description
        if let url = URL(string: character.thumbnail.url) {
            iv_character.kf.indicatorType = .activity
            iv_character.kf.setImage(with: url)
        } else {
            iv_character.image = nil
        }
        
        iv_character.layer.borderColor = UIColor.black.cgColor
        iv_character.layer.borderWidth = 1
        
        vi_collection.dataSource = self
        vi_collection.delegate = self
        
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

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.comics.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = vi_collection.dequeueReusableCell(withReuseIdentifier: "cellComic", for: indexPath) as! ComicsCollectionViewCell
        
        let comic = character.comics.items[indexPath.item]
        cell.prepareComic(with: comic)
        
        
        
        return cell
        
    }
    
    
    
    
}
