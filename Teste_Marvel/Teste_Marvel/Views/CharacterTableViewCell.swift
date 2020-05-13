//
//  CharacterTableViewCell.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var iv_character: UIImageView!
    @IBOutlet weak var lb_nameCharacter: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func prepareCell(with character: Character) {
        
        lb_nameCharacter.text = character.name
        if let url = URL(string: character.thumbnail.url) {
            iv_character.kf.indicatorType = .activity
            iv_character.kf.setImage(with: url)
        } else {
            iv_character.image = nil
        }
        
        iv_character.layer.borderColor = UIColor.yellow.cgColor
        iv_character.layer.borderWidth = 2
        
    }
    
    
    
    
    
    
}
