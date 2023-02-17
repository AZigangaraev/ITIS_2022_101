//
//  AuthorizationViewController.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit

@MainActor
class AuthorizationViewController: UIViewController {
    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!
    
    var presenter: AuthorizationPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
    
    func show(error:  Error) {
        let alertController = UIAlertController(title: "OOOPS",
                                                message: "Something went wrong: \(error)",
                                                preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
    
    @IBAction private func login() {
        guard
            let login = loginField.text,
            let password = passwordField.text
        else { return }
        presenter.logIn(login: login, password: password)
    }
}
