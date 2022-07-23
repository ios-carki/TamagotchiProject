//
//  MainGameViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/23.
//

import UIKit

class MainGameViewController: UIViewController {
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    @IBOutlet weak var textBackGroundImageView: UIImageView!
    @IBOutlet weak var textOnImageLabel: UILabel!
    
    @IBOutlet weak var charinGameImage: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    
    @IBOutlet weak var charLevelLabel: UILabel!
    @IBOutlet weak var numOfRiceLabel: UILabel!
    @IBOutlet weak var numOfWaterLabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var settingBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "돼지돼지"
        settingBarButton.image = UIImage(systemName: "person.circle")
        settingBarButton.tintColor = fontColorSet
        centerView.backgroundColor = backgroundColorSet
        bottomView.backgroundColor = backgroundColorSet
        view.backgroundColor = backgroundColorSet
        
        charinGameImage.image = UIImage(named: "2-4")

        buttonDesign(buttonName1: riceButton, buttonName2: waterButton)
        textFieldDesign(textFieldName1: riceTextField, textFieldName2: waterTextField)
        textBackGroundImageView.image = UIImage(named: "bubble")
        
    }
    
    
    func textFieldDesign(textFieldName1: UITextField, textFieldName2: UITextField) {
        textFieldName1.backgroundColor = backgroundColorSet
        textFieldName1.placeholder = "밥주세용"
        
        
        textFieldName2.backgroundColor = backgroundColorSet
        textFieldName2.placeholder = "물주세용"
    }
    
    func buttonDesign(buttonName1: UIButton, buttonName2: UIButton) {
        buttonName1.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        buttonName1.tintColor = fontColorSet
        buttonName1.semanticContentAttribute = .forceLeftToRight
        buttonName1.setTitle("밥먹기", for: .normal)
        buttonName1.setTitleColor(fontColorSet, for: .normal)
        buttonName1.backgroundColor = backgroundColorSet
        buttonName1.layer.cornerRadius = 5
        buttonName1.layer.borderColor = fontColorSet.cgColor
        buttonName1.layer.borderWidth = 1
        
        buttonName2.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        buttonName2.tintColor = fontColorSet
        buttonName2.semanticContentAttribute = .forceLeftToRight
        buttonName2.setTitle("물먹기", for: .normal)
        buttonName2.setTitleColor(fontColorSet, for: .normal)
        buttonName2.backgroundColor = backgroundColorSet
        buttonName2.layer.cornerRadius = 5
        buttonName2.layer.borderColor = fontColorSet.cgColor
        buttonName2.layer.borderWidth = 1
        
    }
    
    @IBAction func riceButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
    }
    
    
}
