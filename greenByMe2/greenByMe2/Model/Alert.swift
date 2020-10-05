//
//  Alert.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import UIKit

struct AlertAction{
  let Title : String
  let handler : (() -> Void)?
}

struct SingleButtonAlert {
  let title : String
  let message : String?
  let action : AlertAction
}
