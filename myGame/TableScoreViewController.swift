//
//  TableScoreViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.03.2022.
//

import UIKit

class TableScoreViewController: UIViewController {
    
    private let userDefaults = UserSettings()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupViews()
        tableView.reloadData()
    }
}

private extension TableScoreViewController {
    
    func setupViews() {
        
        title = "Tаблица лидеров"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0),
            
        ])
    }
}

//MARK: - UITableViewDataSource

extension TableScoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userDefaults.tableLeaders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let indexPath = indexPath
        cell.cellConfig(indexPath: indexPath)
        return cell
    }
}
