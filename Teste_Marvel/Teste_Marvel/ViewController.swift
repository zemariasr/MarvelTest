//
//  ViewController.swift
//  Teste_Marvel
//
//  Created by José Maria Só Rodrigues on 12/05/20.
//  Copyright © 2020 ZM System. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var name: String? = ""
    var characters: [Character] = []
    // opcional
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    var loadingCharacters = false
    var currentPage = 0
    var total = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "Buscando Personagens ..."
        loadCharacters()
        
        
    }

    func loadCharacters() {
        
        loadingCharacters = true
        APIMarvel.loadCharacters(name: name, page: currentPage) { (info) in
            if let info = info {
                self.characters += info.data.results
                self.total = info.data.total
                print("Total: ", self.total, " - já incluidos: ", self.characters.count)
               // DispatchQueue.main.sync {
                    self.loadingCharacters = false
                    self.tableView.reloadData()
               // }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! QuadrinhosViewController
        vc.character = characters[tableView.indexPathForSelectedRow!.row]
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.backgroundView = characters.count == 0 ? label : nil
        
        return characters.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPersonagem", for: indexPath) as! CharacterTableViewCell
        
        let character = characters[indexPath.row]
        cell.prepareCell(with: character)
        
        return cell
       }
    
    
    // Pagina Infinita
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 10 && !loadingCharacters && characters.count != total {
            currentPage += 1
            loadCharacters()
        }
    }
    
    
    
    
    
}

