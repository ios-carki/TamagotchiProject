//
//  MainGameViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/23.
//

//텍스트의 길이를 제한하기위해 텍스트필드를 뷰에 델리게이트 시킨다?
//익스텐션

import UIKit

enum GameCharacter {
    case dama1, dama2, dama3
}

class MainGameViewController: UIViewController {
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
     
    var tamagochiList = tamagochiDetail()
    var damaNum = 0 //func gameChar()
    
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
    var inGameCharName: String? = UserDefaults.standard.string(forKey: "damaName")
    var keyHeight: CGFloat? //키보드 높이
    
    var characterSort: GameCharacter = .dama1
    
    //레벨1, 밥알0, 물0 테이블뷰 타이틀 이름초기화
    var loadLevel = 1
    var loadRice = 0
    var loadWater = 0
    
    //수정부분
    var WaterCount = UserDefaults.standard.value(forKey: "Water") as! Int
    var RiceCount = UserDefaults.standard.value(forKey: "Rice") as! Int
    var LevelCount = UserDefaults.standard.value(forKey: "Level") as! Int
    var v1name = UserDefaults.standard.value(forKey: "Name") as! String
    
    let manlepMent = ["서버 최초 만렙 달성을 축하드립니다!", "전 만렙이라 밥이 필요없어요!", "윽....절 고문할 생각인가요??다른 다마고치도 키워보세요!"] //만렙 멘트
    
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
        
        barButtonItemDesign(barButtonName: settingBarButton)
        uiViewDesign(uiviewName1: centerView, uiviewName2: bottomView, mainViewName: view)
        textDesign(labelName: textOnImageLabel)
        
        //메인게임 받아온 캐릭터 이름
        charNameDesign(labelName: charNameLabel)
        
        //메인게임 다마고치 이미지
//        gameChar(imageName: charinGameImage)
        
        //키보드가 나타나고 사라질때
//        addKeyBoardListener()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        v1name = UserDefaults.standard.value(forKey: "Name") as! String
        navigationItem.title = "\(v1name)님의 다마고치"
        
        loadLevel = UserDefaults.standard.integer(forKey: "Level")
        loadRice = UserDefaults.standard.integer(forKey: "Rice")
        loadWater = UserDefaults.standard.integer(forKey: "Water")
        
        var imageTag: String = "\(LevelCount)"
        if LevelCount == 10 {
            imageTag = "9"
        }
        
        if charNameLabel.text == "따끔따끔 다마고치" {
            charinGameImage.image = UIImage(named: "1-\(imageTag)")
        }else if charNameLabel.text == "방실방실 다마고치" {
            charinGameImage.image = UIImage(named: "2-\(imageTag)")
        }else if charNameLabel.text == "반짝반짝 다마고치" {
            charinGameImage.image = UIImage(named: "3-\(imageTag)")
        }
        gameChar(imageName: charinGameImage)
    }
    
    
    //다마고치 메인 이미지 초기화
    func gameChar(imageName: UIImageView) {
        let colorSet = color()
        
        charNameLabel.font = colorSet.fontFamily
        
        if charNameLabel.text == "따끔따끔 다마고치" {
            damaNum = 1
            characterSort = GameCharacter.dama1
            imageName.image = UIImage(named: "1-\(LevelCount)")
//            UserDefaults.standard.set(charNameLabel, forKey: "damaName")
        }else if charNameLabel.text == "방실방실 다마고치" {
            damaNum = 2
            characterSort = GameCharacter.dama2
            imageName.image = UIImage(named: "2-\(LevelCount)")
//            UserDefaults.standard.set(charNameLabel, forKey: "damaName")
        }else if charNameLabel.text == "반짝반짝 다마고치" {
            damaNum = 3
            characterSort = GameCharacter.dama3
            imageName.image = UIImage(named: "3-\(LevelCount)")
//            UserDefaults.standard.set(charNameLabel, forKey: "damaName")
        }
        UserDefaults.standard.set(charNameLabel.text, forKey: "damaName")
        print(UserDefaults.standard.string(forKey: "damaName"))
        //다마고치 이름을 받아오는
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
        textFieldName1.keyboardType = .numberPad
        
        textFieldName2.backgroundColor = backgroundColorSet
        textFieldName2.placeholder = "물주세용"
        textFieldName2.keyboardType = .numberPad
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
    func formula() -> Int {
        let result: Int = (RiceCount / 5) + (WaterCount / 2)
        var level = result / 10
        
        if 2 > level {
            level = 1
        }
        return level
    }

    //피드백1 -> switch ~case(range())
    //fomula 값에 따른 캐릭터 성장 이미지 변화
    func countFunc() {
        
        switch formula() {
        case 0...1:
            break
        case 1...10:
            LevelCount = formula()
            charLevelLabel.text = "LV\(LevelCount)"
            charinGameImage.image = UIImage(named: "\(damaNum)-\(LevelCount)")
            
        case 10:
            LevelCount = formula()
            charLevelLabel.text = "LV\(LevelCount)"
            charinGameImage.image = UIImage(named: "\(damaNum)-\(LevelCount)")
            
        default:
            break
        }
        UserDefaults.standard.set(damaNum, forKey: "damaNum") // 다마고치 번호 유저 디폴트
        UserDefaults.standard.set(LevelCount, forKey: "Level") // 레벨 유저 디폴트
    }
    
    //밥주기 버튼

    @IBAction func riceButtonClicked(_ sender: UIButton) {
        let talkArr = ["물도 좀 주세요!", "밥맛이 좋네요", "배가 불러와요", "밥이 좀 식었어요"]
        let addedRice:Int? = Int(riceTextField.text!)
        
        if riceTextField.text != "" {
            RiceCount += addedRice!
        }else {
            RiceCount += 1
        }
        numOfRiceLabel.text = "- 밥알 \(RiceCount)개 -"
        UserDefaults.standard.set(RiceCount, forKey: "Rice") //쌀 개수 유저 디폴트
        
//        countingFunc(addedObject: addedRice!)
        countFunc()
        textOnImageLabel.text = talkArr.randomElement()
        if LevelCount == 10 {
            textOnImageLabel.text = manlepMent.randomElement()
        }
    }
    
    //물주기 버튼
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        let talkArr = ["밥도 좀 주세요!", "물맛이 좋네요", "우리나라는 물부족 국가인가요?", "저는 에비앙 생수 아니면 안마셔요.."]
        let addedWater:Int? = Int(waterTextField.text!)
        
        if waterTextField.text != "" {
            WaterCount += addedWater!
        }else {
            WaterCount += 1
        }
        numOfWaterLabel.text = "물방울 \(WaterCount)개"
        UserDefaults.standard.set(WaterCount, forKey: "Water") //물 개수 유저 디폴트
        
//        countingFunc(addedObject: addedWater!)
        countFunc()
        textOnImageLabel.text = talkArr.randomElement()
        if LevelCount == 10 {
            textOnImageLabel.text = manlepMent.randomElement()
        }
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
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
}

extension MainGameViewController {
    
    struct color {
        let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        let backGroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        let testRedColor = UIColor.red
        
        let fontFamily = UIFont(name: "Galmuri11-Regular", size: 17)
    }
    
    
    func barButtonItemDesign(barButtonName: UIBarButtonItem) {
        let colorSet = color() // 중복될 메서드가 많을 것 같아서 extension 메인게임뷰의 저장 프로퍼티로 활용하자니 문법상 오류가 있고 -> 구조체 안에 포함시키는 방법이있나?
        
        barButtonName.tintColor = colorSet.fontColorSet
        barButtonName.image = UIImage(systemName: "person.circle")
    }
    
    func uiViewDesign(uiviewName1: UIView, uiviewName2: UIView, mainViewName: UIView) {
        let colorSet = color()
        
        uiviewName1.backgroundColor = colorSet.backGroundColorSet
        uiviewName2.backgroundColor = colorSet.backGroundColorSet
        mainViewName.backgroundColor = colorSet.backGroundColorSet
    }
    
    func textDesign(labelName: UILabel) {
        let colorSet = color()
        let fontFamily = UIFont(name: "Galmuri11-Regular", size: 17)
        
        labelName.text = "\(v1name)님 안녕하세요"
        labelName.textColor = colorSet.fontColorSet
        labelName.textAlignment = .center
        labelName.font = fontFamily
    }
    
    //다마고치 이름 디자인
    func charNameDesign(labelName: UILabel) {
        let colorSet = color()
        
        labelName.text = inGameCharName
        labelName.textColor = colorSet.fontColorSet
        labelName.font = colorSet.fontFamily
        labelName.textAlignment = .center
        labelName.layer.borderWidth = 1
        labelName.layer.cornerRadius = 5
        labelName.layer.backgroundColor = colorSet.backGroundColorSet.cgColor
        labelName.layer.borderColor = colorSet.fontColorSet.cgColor
    }
    
}


