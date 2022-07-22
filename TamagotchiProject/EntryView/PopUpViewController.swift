//
//  PopUpViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var charImage: UIImageView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
       
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func okButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen

        self.present(nav, animated: false)
    }
    

}
