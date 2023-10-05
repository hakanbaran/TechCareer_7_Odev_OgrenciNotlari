//
//  StudentCell.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import UIKit

class StudentCell: UITableViewCell {

    static let identifier = "StudentCell"
    
    private let studentName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Hakan Baran"
        label.textColor = .label
        return label
    }()
    
    private let studentScore: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.text = "75"
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(studentName)
        contentView.addSubview(studentScore)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = contentView.frame.width
        let height = contentView.frame.height
        
        studentName.frame = CGRect(x: width/25, y: height/5, width: width/3, height: height/2)
        studentScore.frame = CGRect(x: width-width/10-width/25, y: height/5, width: width/10, height: height/2)
    }
    
    public func configure(name: String, score: String  ) {
        studentName.text = name
        studentScore.text = score
    }

}
