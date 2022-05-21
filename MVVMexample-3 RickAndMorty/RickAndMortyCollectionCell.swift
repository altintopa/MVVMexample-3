//
//  RickAndMortyCollectionCell.swift
//  MVVMexample-3 RickAndMorty
//
//  Created by Ahmet WOW on 19/05/2022.
//

import UIKit

class RickAndMortyCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    
    func configureCell(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
