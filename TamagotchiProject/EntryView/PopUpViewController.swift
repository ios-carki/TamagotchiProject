//
//  PopUpViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    
    var tamagochiList = tamagochiDetail()
    var imageRepo: String?
    
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
        viewView.backgroundColor = backgroundColorSet
        viewView.layer.cornerRadius = 10
        charImage.image = UIImage(named: imageRepo ?? "noImage")
        print(imageRepo)
       
        cancelButtonDesign(btnName: cancelButton)
        okButtonDesign(btnName: okButton)
        boundaryLineDesign(viewName: boundaryLineView)//경계선
    }
    
//    func charImageLoad(imageName: UIImage) {
//        tamagochiList.tamagochi
//
//    }
    
    func labelDesign(labelName: UILabel) {
        labelName.textColor = fontColorSet
        labelName.textAlignment = .center
        labelName.font = .boldSystemFont(ofSize: 12)
    }
    
    func boundaryLineDesign(viewName: UIView) {
        viewName.layer.borderWidth = 1
        viewName.layer.borderColor = fontColorSet.cgColor
    }
    
    
    func cancelButtonDesign(btnName: UIButton) {
        btnName.setTitle("취소", for: .normal)
        btnName.setTitleColor(fontColorSet, for: .normal)
        btnName.layer.borderWidth = 1
        btnName.layer.borderColor = fontColorSet.cgColor
    }
    
    func okButtonDesign(btnName: UIButton) {
        btnName.setTitle("시작하기", for: .normal)
        btnName.setTitleColor(fontColorSet, for: .normal)
        btnName.layer.borderWidth = 1
        btnName.layer.borderColor = fontColorSet.cgColor
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func okButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen

        self.present(nav, animated: false)
    }
    

}
