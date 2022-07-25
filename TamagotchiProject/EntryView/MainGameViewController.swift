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
    
    var tamagochiList = tamagochiDetail()
    
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
//    var v1Name: String? = ""
    
    //레벨1, 밥알0, 물0 테이블뷰 타이틀 이름초기화

    var loadLevel = 0
    var loadRice = 0
    var loadWater = 0
    
    var WaterCount = UserDefaults.standard.value(forKey: "Water") as! Int
    var RiceCount = UserDefaults.standard.value(forKey: "Rice") as! Int
    var LevelCount = UserDefaults.standard.value(forKey: "Level") as! Int
    var v1name = UserDefaults.standard.value(forKey: "Name") as! String
    
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
        
        settingBarButton.image = UIImage(systemName: "person.circle")
        settingBarButton.tintColor = fontColorSet
        centerView.backgroundColor = backgroundColorSet
        bottomView.backgroundColor = backgroundColorSet
        view.backgroundColor = backgroundColorSet
        textOnImageLabel.text = "\(v1name)님 안녕하세요"
        textOnImageLabel.textColor = fontColorSet
        textOnImageLabel.textAlignment = .center
        
        //메인게임 받아온 캐릭터 이름
        charNameDesign(labelName: charNameLabel)
        
        //메인게임 다마고치 이미지
        gameChar(imageName: charinGameImage)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

        v1name = UserDefaults.standard.value(forKey: "Name") as! String
        navigationItem.title = "\(v1name)님의 다마고치"
        
        loadLevel = UserDefaults.standard.integer(forKey: "Level")
        loadRice = UserDefaults.standard.integer(forKey: "Rice")
        loadWater = UserDefaults.standard.integer(forKey: "Water")
    }
    
    
    //다마고치 메인 이미지 초기화
    func gameChar(imageName: UIImageView) {
        if charNameLabel.text == "따끔따끔 다마고치" {
            imageName.image = UIImage(named: "1-1")
        }else if charNameLabel.text == "방실방실 다마고치" {
            imageName.image = UIImage(named: "2-1")
        }else if charNameLabel.text == "반짝반짝 다마고치" {
            imageName.image = UIImage(named: "3-1")
        }
    }
    
    //다마고치 이름 디자인
    func charNameDesign(labelName: UILabel) {
        labelName.text = inGameCharName
        labelName.textColor = fontColorSet
        labelName.font = .boldSystemFont(ofSize: 15)
        labelName.textAlignment = .center
        labelName.layer.borderWidth = 1
        labelName.layer.cornerRadius = 5
        labelName.layer.backgroundColor = backgroundColorSet.cgColor
        labelName.layer.borderColor = fontColorSet.cgColor
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
    
    //formula함수를 통해 수학식 계산함
//    func formula() -> Int {
//        var result = (RiceCount / 5) + (WaterCount / 2)
//
//        return result / 10
//    }
//
//    func countFunc() {
//
//    }
    //formula 함수와 countFunc()함수를 통해 Line183~ 레벨업 계산식을 대체하려고 했지만
    //좋은 로직이 떠오르지 않아서 포기...
    //코드 피드백을 통하여 이미지 파일의 이름에 접근하여 contain()을 통한 문자열 비교를 할 수 있다면 좋겠다고 생각함
    
    
    //밥알 + 물방울 값을 받아서 레벨을 측정하는 계산함수
    func countingFunc(addedObject: Int) -> Int{
        //이미지 이름을 문자열로 받아오기
//      charinGameImage.contains("1-")
        print("이미지이름 출력")
        print(type(of: charinGameImage.tag))
        
        if 0 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 10 {
            LevelCount = 1
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 10 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 20 {
            LevelCount = 1
            charLevelLabel.text = "LV\(LevelCount)"
        }else if 20 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 30 {
            LevelCount = 2
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-1") && LevelCount == 2 {
                charinGameImage.image = UIImage(named: "1-2")
            }else if charinGameImage.image == UIImage(named: "2-1") && LevelCount == 2 {
                charinGameImage.image = UIImage(named: "2-2")
            }else if charinGameImage.image == UIImage(named: "3-1") && LevelCount == 2 {
                charinGameImage.image = UIImage(named: "3-2")
            }
        }else if 30 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 40 {
            LevelCount = 3
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-2") && LevelCount == 3 {
                charinGameImage.image = UIImage(named: "1-3")
            }else if charinGameImage.image == UIImage(named: "2-2") && LevelCount == 3 {
                charinGameImage.image = UIImage(named: "2-3")
            }else if charinGameImage.image == UIImage(named: "3-2") && LevelCount == 3 {
                charinGameImage.image = UIImage(named: "3-3")
            }
        }else if 40 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 50 {
            LevelCount = 4
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-3") && LevelCount == 4 {
                charinGameImage.image = UIImage(named: "1-4")
            }else if charinGameImage.image == UIImage(named: "2-3") && LevelCount == 4 {
                charinGameImage.image = UIImage(named: "2-4")
            }else if charinGameImage.image == UIImage(named: "3-3") && LevelCount == 4 {
                charinGameImage.image = UIImage(named: "3-4")
            }
        }else if 50 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 60 {
            LevelCount = 5
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-4") && LevelCount == 5 {
                charinGameImage.image = UIImage(named: "1-5")
            }else if charinGameImage.image == UIImage(named: "2-4") && LevelCount == 5 {
                charinGameImage.image = UIImage(named: "2-5")
            }else if charinGameImage.image == UIImage(named: "3-4") && LevelCount == 5 {
                charinGameImage.image = UIImage(named: "3-5")
            }
        }else if 60 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 70 {
            LevelCount = 6
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-5") && LevelCount == 6 {
                charinGameImage.image = UIImage(named: "1-6")
            }else if charinGameImage.image == UIImage(named: "2-5") && LevelCount == 6 {
                charinGameImage.image = UIImage(named: "2-6")
            }else if charinGameImage.image == UIImage(named: "3-5") && LevelCount == 6{
                charinGameImage.image = UIImage(named: "3-6")
            }
        }else if 70 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 80 {
            LevelCount = 7
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-6") {
                charinGameImage.image = UIImage(named: "1-7")
            }else if charinGameImage.image == UIImage(named: "2-6") {
                charinGameImage.image = UIImage(named: "2-7")
            }else if charinGameImage.image == UIImage(named: "3-6") {
                charinGameImage.image = UIImage(named: "3-7")
            }
        }else if 80 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 90 {
            LevelCount = 8
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-7") {
                charinGameImage.image = UIImage(named: "1-8")
            }else if charinGameImage.image == UIImage(named: "2-7") {
                charinGameImage.image = UIImage(named: "2-8")
            }else if charinGameImage.image == UIImage(named: "3-7") {
                charinGameImage.image = UIImage(named: "3-8")
            }
        }else if 90 <= (RiceCount / 5) + (WaterCount / 2) && (RiceCount / 5) + (WaterCount / 2) < 100 {
            LevelCount = 9
            charLevelLabel.text = "LV\(LevelCount)"
            
            if charinGameImage.image == UIImage(named: "1-8") {
                charinGameImage.image = UIImage(named: "1-9")
            }else if charinGameImage.image == UIImage(named: "2-8") {
                charinGameImage.image = UIImage(named: "2-9")
            }else if charinGameImage.image == UIImage(named: "3-8") {
                charinGameImage.image = UIImage(named: "3-9")
            }
        }else if 100 <= (RiceCount / 5) + (WaterCount / 2) {
            LevelCount = 10
            charLevelLabel.text = "LV\(LevelCount)"
            
            textOnImageLabel.text = "서버 최초 만렙 달성을 축하드립니다!"
        }
        return LevelCount
    }
    
    //밥주기 버튼
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        let talkArr = ["물도 좀 주세요!", "밥맛이 좋네요", "배가 불러와요", "밥이 좀 식었어요"]
        let addedRice:Int? = Int(riceTextField.text!)
        RiceCount += addedRice!
        numOfRiceLabel.text = "- 밥알 \(RiceCount)개 -"
        
        countingFunc(addedObject: addedRice!)
        textOnImageLabel.text = talkArr.randomElement()
    }
    
    //물주기 버튼
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        let talkArr = ["밥도 좀 주세요!", "물맛이 좋네요", "우리나라는 물부족 국가인가요?", "저는 에비앙 생수 아니면 안마셔요.."]
        let addedWater:Int? = Int(waterTextField.text!)
        WaterCount += addedWater!
        numOfWaterLabel.text = "물방울 \(WaterCount)개"
        
        countingFunc(addedObject: addedWater!)
        textOnImageLabel.text = talkArr.randomElement()
    }
    
    //설정버튼
    @IBAction func settingButtonClicked(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as! SettingTableViewController
        vc.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: vc)
        
        vc.rightTextLabel[0] = v1name
        
        UserDefaults.standard.set(WaterCount, forKey: "Water")
        UserDefaults.standard.set(RiceCount, forKey: "Rice")
        UserDefaults.standard.set(LevelCount, forKey: "Level")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

