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
    
    @IBOutlet weak var textBackGroundImageView: UIImageView!//말풍선 이미지뷰
    @IBOutlet weak var textOnImageLabel: UILabel!//말풍선 텍스트 레이블
    
    @IBOutlet weak var charinGameImage: UIImageView!//캐릭터 이미지뷰
    @IBOutlet weak var charNameLabel: UILabel!//캐릭터 이름 텍스트 레이블
    
    @IBOutlet weak var charLevelLabel: UILabel!//레벨 텍스트 레이블
    @IBOutlet weak var numOfRiceLabel: UILabel!//밥알 텍스트 레이블
    @IBOutlet weak var numOfWaterLabel: UILabel!//물방울 텍스트 레이블
    
    @IBOutlet weak var riceTextField: UITextField!//밥주기 텍스트 필드
    @IBOutlet weak var waterTextField: UITextField!//물주기 텍스트 필드
    
    @IBOutlet weak var riceButton: UIButton!//밥주기 버튼
    @IBOutlet weak var waterButton: UIButton!//물주기 버튼
    
    @IBOutlet weak var centerView: UIView!//레벨 + 밥 + 물 뷰
    @IBOutlet weak var bottomView: UIView!//텍스트필드 + 버튼 뷰
    
    @IBOutlet weak var settingBarButton: UIBarButtonItem!//설정 바 버튼 아이템
    
    var inGameCharImage: String?
    var inGameCharName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "돼지돼지"
        settingBarButton.image = UIImage(systemName: "person.circle")
        settingBarButton.tintColor = fontColorSet
        centerView.backgroundColor = backgroundColorSet
        bottomView.backgroundColor = backgroundColorSet
        view.backgroundColor = backgroundColorSet
        

        buttonDesign(buttonName1: riceButton, buttonName2: waterButton)
        textFieldDesign(textFieldName1: riceTextField, textFieldName2: waterTextField)
        textBackGroundImageView.image = UIImage(named: "bubble")
        
        if inGameCharImage == Optional("1-6") {
            charinGameImage.image = UIImage(named: "1-1")
        }
        
//        if inGameCharName == Optional("")
        
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
