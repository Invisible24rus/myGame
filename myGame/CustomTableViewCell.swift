//
//  CustomTableViewCell.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let userDefaults = UserSettings()
    static let identifier = "CustomTableViewCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfig(indexPath: IndexPath) {
        guard  let value = userDefaults.tableLeaders?[indexPath.row]["Score"] else { return }
        guard let key = userDefaults.tableLeaders?[indexPath.row]["Name"] else { return }
        let arrayValue = Array(arrayLiteral: value)
        let arrayKey = Array(arrayLiteral: key)
        nameLabel.text = "\(arrayKey[0])"
        scoreLabel.text = "\(arrayValue[0])"
    }
    
    func setupViews() {
        
        contentView.backgroundColor = .darkGray
        
        contentView.addSubviewsForAutoLayout([nameLabel, scoreLabel])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
