//
//  MainGameViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/23.
//

//텍스트의 길이를 제한하기위해 텍스트필드를 뷰에 델리게이트 시킨다?
//익스텐션

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
    
    //레벨1, 밥알0, 물0 테이블뷰 타이틀 이름초기화
    var LevelCount = 1
    var RiceCount = 0
    var WaterCount = 0
    var defaultUserName: String = "대장"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //초기 캐릭터정보(1, 0, 0)
        defaultCharInfo(levelLabel: charLevelLabel, riceLabel: numOfRiceLabel, waterLabel: numOfWaterLabel)
        //밥주기, 물주기버튼 디자인
        buttonDesign(buttonName1: riceButton, buttonName2: waterButton)
        //밥주기, 물주기 텍스트필드 디자인
        textFieldDesign(textFieldName1: riceTextField, textFieldName2: waterTextField)
        //말풍선 이미지뷰
        textBackGroundImageView.image = UIImage(named: "bubble")
        
        navigationItem.title = "\(defaultUserName)님의 다마고치"
        settingBarButton.image = UIImage(systemName: "person.circle")
        settingBarButton.tintColor = fontColorSet
        centerView.backgroundColor = backgroundColorSet
        bottomView.backgroundColor = backgroundColorSet
        view.backgroundColor = backgroundColorSet
        
        
    }
    
    //초기 캐릭터 정보(레벨 1, 밥알 0개, 물통 0개)
    func defaultCharInfo(levelLabel: UILabel, riceLabel: UILabel, waterLabel: UILabel) {
        levelLabel.text = "LV\(LevelCount)"
        levelLabel.textColor = fontColorSet
        levelLabel.font = .boldSystemFont(ofSize: 13)
        levelLabel.textAlignment = .right
        riceLabel.text = "- 밥알 \(RiceCount)개 -"
        riceLabel.textColor = fontColorSet
        riceLabel.font = .boldSystemFont(ofSize: 13)
        riceLabel.textAlignment = .center
        waterLabel.text = "물방울 \(WaterCount)개"
        waterLabel.textColor = fontColorSet
        waterLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    //물주기, 밥주기 텍스트필드 디자인
    func textFieldDesign(textFieldName1: UITextField, textFieldName2: UITextField) {
        textFieldName1.backgroundColor = backgroundColorSet
        textFieldName1.placeholder = "밥주세용"
        
        
        textFieldName2.backgroundColor = backgroundColorSet
        textFieldName2.placeholder = "물주세용"
    }
    
    //물주기, 밥주기 버튼 디자인
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
    
    //밥알 + 물방울 값을 받아서 레벨을 측정하는 계산함수
    func countingFunc(addedObject: Int) -> Int{
        if 0 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 10 {
            LevelCount = 1
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 10 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 20 {
            LevelCount = 1
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 20 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 30 {
            LevelCount = 2
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 30 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 40 {
            LevelCount = 3
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 40 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 50 {
            LevelCount = 4
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 50 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 60 {
            LevelCount = 5
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 60 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 70 {
            LevelCount = 6
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 70 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 80 {
            LevelCount = 7
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 80 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 90 {
            LevelCount = 8
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 90 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 100 {
            LevelCount = 9
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 100 <= (RiceCount / 5) + (WaterCount / 2) {
            LevelCount = 10
            charLevelLabel.text = "LV\(LevelCount)"
        }
        return LevelCount
    }
    
    //밥주기 버튼
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        let addedRice:Int? = Int(riceTextField.text!)
        RiceCount = RiceCount + addedRice!
        numOfRiceLabel.text = "- 밥알 \(RiceCount)개 -"
        
        countingFunc(addedObject: addedRice!)
    }
    
    //물주기 버튼
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        let addedWater:Int? = Int(waterTextField.text!)
        WaterCount = WaterCount + addedWater!
        numOfWaterLabel.text = "물방울 \(WaterCount)개"
        
        countingFunc(addedObject: addedWater!)
    }
    
    //코드 분석하기 필요
    //MainGameVie -> 설정
    @IBAction func settingButtonClicked(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as! SettingTableViewController
        vc.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

