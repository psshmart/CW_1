//
//  MainViewController.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit
import Combine

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
    init() {
        activity = ""
        type = ""
        participants = 0
        price = 0.0
        link = ""
        key = ""
        accessibility = 0.0
    }
}

class MainViewController: UIViewController, FlowController {
    
    // MARK: - Properties
    
    var completionHandler: ((String?) -> ())?
    private var cancellable: AnyCancellable?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Activities"
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = BaseButton()
        button.setTitle("Log Out", for: .normal)
        button.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Reset",
                                     style: .plain,
                                     target: self,
                                     action: #selector(reset))
        button.tintColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        makeConstraints()
        setupNavigationBar()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(logoutButton)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        logoutButton.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(15)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Activities"
        navigationItem.rightBarButtonItem = resetButton
            
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = UIColor.lightGray
        navigationController?.navigationBar.isTranslucent = false
            
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func activityRequest() {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            return
        }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Activity.self, decoder: JSONDecoder())
            .replaceError(with: Activity())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
            }) { [weak self] activity in
                self?.label.text = activity.activity
            }
    }
    
    // MARK: - Actions
    
    @objc private func reset() {
        activityRequest()
    }
    
    @objc private func logOut() {
        completionHandler?("logout")
    }

}
