//
//  AuthViewController.swift
//  VKApplication
//
//  Created by Дмитрий Пономарев on 17.06.2023.
//

import UIKit


class AuthViewController: UIViewController, AppDelegateProtool {

    
    var appde: AppDelegate!

    let button = UIButton()
    var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        makeButton()
        appde = UIApplication.shared.delegate as? AppDelegate
        appde?.delegateAppDelegate = self
        authService = AppDelegate.shared().authService
    }
    
    func makeButton() {
        button.center = view.center
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        button.bounds.size = CGSize(width: 100, height: 200)
    }
    
    @objc func click() {
        authService.wakeUpSession()
        print(#function)

    }
    
    func openVKAuthViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
        print(#function)

    }
    
    func openFeedViewController() {
        let nextVC = FeedViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print(#function)

    }
    
    
    
}

