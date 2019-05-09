//
//  PreviewCell.swift
//  AVKitEasyUseProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {

    lazy var backImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1.jpg"))
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var playLabel: UILabel = {
        let label = UILabel()
        label.text = "Play"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 40
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addViews() {
        contentView.addSubview(backImage)
        contentView.addSubview(playLabel)
        
        //设置约束
        //1. backImage
        backImage.translatesAutoresizingMaskIntoConstraints = false
        let backImageLeftCons = NSLayoutConstraint(item: backImage, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0)
        let backImageRightCons = NSLayoutConstraint(item: backImage, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0)
        let backImageTopCons = NSLayoutConstraint(item: backImage, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let backImageBottomCons = NSLayoutConstraint(item: backImage, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        backImage.superview?.addConstraint(backImageLeftCons)
        backImage.superview?.addConstraint(backImageRightCons)
        backImage.superview?.addConstraint(backImageTopCons)
        backImage.superview?.addConstraint(backImageBottomCons)
        
        //2. playBtn
        playLabel.translatesAutoresizingMaskIntoConstraints = false
        let playBtnCenterXCons = NSLayoutConstraint(item: playLabel, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let playBtnCenterYCons = NSLayoutConstraint(item: playLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let playBtnWidthCons = NSLayoutConstraint(item: playLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 80)
        let playBtnHeightCons = NSLayoutConstraint(item: playLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 80)
        playLabel.superview?.addConstraint(playBtnCenterXCons)
        playLabel.superview?.addConstraint(playBtnCenterYCons)
        playLabel.superview?.addConstraint(playBtnWidthCons)
        playLabel.superview?.addConstraint(playBtnHeightCons)
        
    }
    
    ///创建Cell
    class func createCellWith(tableView: UITableView, indexPath: IndexPath) -> PreviewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableReuseIdentifier, for: indexPath) as? PreviewCell
        if cell == nil {
            cell = PreviewCell(style: .default, reuseIdentifier: BaseTableReuseIdentifier)
        }
        return cell!
    }
    
}
