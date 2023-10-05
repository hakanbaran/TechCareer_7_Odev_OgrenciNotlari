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
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Hakan Baran"
        label.textColor = .label
        return label
    }()
    
    private let studentClass: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Maths"
        label.textColor = .label
        return label
    }()
    
    private let studentScore: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.text = "75"
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 24
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(studentName)
        contentView.addSubview(studentScore)
        contentView.addSubview(studentClass)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = contentView.frame.width
        let height = contentView.frame.height
        
        studentName.frame = CGRect(x: width/25, y: height/5, width: width/3, height: height/2)
        studentClass.frame = CGRect(x: width/2-width/22, y: height/5, width: width/3, height: height/2)
        studentScore.frame = CGRect(x: width-width/6, y: height/5-height/10, width: width/9, height: width/9)
    }
    
    public func configure(name: String, score: String) {
        studentName.text = name
        studentScore.text = score
    }

}
