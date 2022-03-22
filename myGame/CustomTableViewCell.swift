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
        label.textColor = .black
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
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
        guard  let value = userDefaults.tableLeaders?[indexPath.row].values else { return }
        guard let key = userDefaults.tableLeaders?[indexPath.row].keys else { return }
        let arrayValue = Array(value)
        let arrayKey = Array(key)
        nameLabel.text = (arrayKey[0])
        scoreLabel.text = "\(arrayValue[0])"
    }
    
    func setupViews() {
        
        contentView.addSubviewsForAutoLayout([nameLabel, scoreLabel])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
