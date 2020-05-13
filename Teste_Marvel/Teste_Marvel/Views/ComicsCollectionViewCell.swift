//
//  ComicsCollectionViewCell.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit
import Kingfisher

class ComicsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iv_comics: UIImageView!
    
    @IBOutlet weak var lb_nomeComic: UILabel!
    
    
    
    func prepareComic(with comics: ComicSummary) {
        
        
        //var comic = character.comics
        
        lb_nomeComic.text = comics.name
 
    }
    
    
    
    
}
