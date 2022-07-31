//
//  PopUpViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//
/*
 열거형 활용해보기
 */

import UIKit

class PopUpViewController: UIViewController {
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    
    var tamagochiList = tamagochiDetail()
    
    var imageRepo: String? //받아오는 캐릭터이미지
    var lableRepo: String? //받아오는 캐릭터이름
    var introduceRepo: String? //받아오는 캐릭터소개
    var fontFamily = UIFont(name: "Galmuri11-Regular", size: 17)//폰트
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var viewView: UIView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var boundaryLineView: UIView!
    @IBOutlet weak var charStroryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3) // 팝업 흐린 배경
        viewView.backgroundColor = backgroundColorSet//팝업뷰 배경색
        viewView.layer.cornerRadius = 10//팝업뷰 코너 둥글기
        
        //캐릭터 이미지, 이름, 소개
        charImage.image = UIImage(named: imageRepo ?? "noImage")//캐릭터 이미지 불러오기
        loadNameDesign(loadName: imageNameLabel)//캐릭터 이름 불러오기
        loadIntrouduceDesign(labelName: charStroryLabel)//캐릭터 소개 불러오기
        
        cancelButtonDesign(btnName: cancelButton)//취소버튼
        okButtonDesign(btnName: okButton)//ok버튼
        boundaryLineDesign(viewName: boundaryLineView)//경계선
    }
    
    
    //캐릭터 이름 레이블 디자인
    func loadNameDesign(loadName: UILabel) {
        loadName.text = lableRepo
        loadName.textColor = fontColorSet
        loadName.textAlignment = .center
        loadName.font = fontFamily
        loadName.layer.cornerRadius = 5
        loadName.layer.borderWidth = 1
        loadName.backgroundColor = backgroundColorSet
        loadName.font = .boldSystemFont(ofSize: 15)
    }
    
    //캐릭터 자기소개 레이블 디자인
    func loadIntrouduceDesign(labelName: UILabel) {
        labelName.text = introduceRepo
        labelName.textColor = fontColorSet
        labelName.textAlignment = .center
        labelName.font = fontFamily
    }
    
    //경계선 표현
    func boundaryLineDesign(viewName: UIView) {
        viewName.layer.borderWidth = 1
        viewName.layer.borderColor = fontColorSet.cgColor
    }
    
    //취소버튼 디자인
    func cancelButtonDesign(btnName: UIButton) {
        btnName.setTitle("취소", for: .normal)
        btnName.setTitleColor(fontColorSet, for: .normal)
        btnName.layer.borderWidth = 1
        btnName.layer.borderColor = fontColorSet.cgColor
    }
    
    //ok버튼 디자인
    func okButtonDesign(btnName: UIButton) {
        btnName.setTitle("시작하기", for: .normal)
        btnName.setTitleColor(fontColorSet, for: .normal)
        btnName.layer.borderWidth = 1
        btnName.layer.borderColor = fontColorSet.cgColor
    }
    
    //취소버튼 액션
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    //ok버튼 액션
    @IBAction func okButtonClicked(_ sender: UIButton) {
        let data = tamagochiList.tamagochi
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        vc.inGameCharName = lableRepo
        UserDefaults.standard.set(lableRepo, forKey: "damaName")
        vc.LevelCount = UserDefaults.standard.integer(forKey: "Level")
        vc.RiceCount = UserDefaults.standard.integer(forKey: "Rice")
        vc.WaterCount = UserDefaults.standard.integer(forKey: "Water")
        vc.v1name = UserDefaults.standard.string(forKey: "Name") ?? "왜안돼"
        
//        UserDefaults.standard.string(forKey: "CharImage")
        
        UserDefaults.standard.set(true, forKey: "First")

        self.present(nav, animated: false)
    }
    
    
    
}
