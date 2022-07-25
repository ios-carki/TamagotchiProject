//
//  ChangeNickNameViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/24.
//

import UIKit

class ChangeNickNameViewController: UIViewController {
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

    var loadText: String? = ""
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var userNickNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColorSet
        loadText = UserDefaults.standard.string(forKey: "Name")
        
        titleSetting()
        rightBarButtonDesign(barButton: saveBarButton)
        userNickNameTextField.placeholder = "\(loadText!)님의 이름을 알려주세요"

    }
    
    //저장 바 버튼
    func rightBarButtonDesign(barButton: UIBarButtonItem) {
        barButton.title = "저장"
    }
    
    //유저 이름에 따라 다른 타이틀 보여주기
    func titleSetting() {
        self.navigationController?.navigationBar.tintColor = fontColorSet
        
        //닉네임 변경 뷰 -> 설정 뷰
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        
        self.title = "\(loadText!)님 이름 정하기"
    }
    
    //저장버튼 클릭 이벤트
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        loadText = userNickNameTextField.text
        
        UserDefaults.standard.set(loadText, forKey:"Name")
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
}
