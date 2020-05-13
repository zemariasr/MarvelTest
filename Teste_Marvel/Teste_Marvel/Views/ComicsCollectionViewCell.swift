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
    
    
    
    func prepareComic(with comic: Comic) {
        
        
        //var comic = character.comics
        
        lb_nomeComic.text = comic.title
        if let url = URL(string: comic.thumbnail.url) {
            iv_comics.kf.indicatorType = .activity
            iv_comics.kf.setImage(with: url)
        } else {
            iv_comics.image = nil
        }
 
        
        
    }
    
    
    
    
}
