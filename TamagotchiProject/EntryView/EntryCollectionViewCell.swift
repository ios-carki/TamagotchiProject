//
//  EntryCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//

import UIKit

class EntryCollectionViewCell: UICollectionViewCell {
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let fontFamily = UIFont(name: "Galmuri11-Regular", size: 10)

    
    @IBOutlet weak var tamagochiImage: UIImageView!
    @IBOutlet weak var tamagochiName: UILabel!
    
    func configureCell(data: Tamagochi) {
        tamagochiImage.image = UIImage(named: data.image)
        tamagochiImage.contentMode = .scaleAspectFit
        
        tamagochiName.text = data.name
        tamagochiName.font = fontFamily
        tamagochiName.textAlignment = .center
        tamagochiName.textColor = fontColorSet
        tamagochiName.layer.cornerRadius = 5
        tamagochiName.layer.borderWidth = 1
        tamagochiName.layer.borderColor = fontColorSet.cgColor
    }
    
}
