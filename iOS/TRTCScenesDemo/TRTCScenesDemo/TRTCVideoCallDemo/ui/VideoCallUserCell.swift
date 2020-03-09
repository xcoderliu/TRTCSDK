//
//  VideoCallUserCell.swift
//  trtcScenesDemo
//
//  Created by xcoderliu on 1/17/20.
//  Copyright © 2020 xcoderliu. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

struct VideoCallUserModel: Equatable {
    var avatarUrl: String = ""
    var name: String = ""
    var userId: String = ""
    var isEnter: Bool = false
    var isVideoAvaliable: Bool = false
    
    static func == (lhs: VideoCallUserModel, rhs: VideoCallUserModel) -> Bool {
        if lhs.userId == rhs.userId {
                return true
        }
        return false
    }
}

class VideoCallUserCell: UICollectionViewCell {
   
    var userModel = VideoCallUserModel() {
        didSet {
            configModel(model: userModel)
        }
    }
    
    func configModel(model: VideoCallUserModel) {
        let noModel = model.userId.count == 0
        if !noModel {
            if userModel.userId != VideoCallUtils.shared.curUserId() {
                if let render = VideoCallViewController.getRenderView(userId: userModel.userId) {
                    if render.superview != self {
                        render.removeFromSuperview()
                        DispatchQueue.main.async {
                            render.frame = self.bounds
                        }
                        addSubview(render)
                        render.userModel = userModel
                    }
                } else {
                    print("error")
                }
            }
        }
    }
}
