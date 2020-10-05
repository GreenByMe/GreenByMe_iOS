//
//  missionViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
protocol MissionViewModel {
  var missionItem : Mission { get }
  
}
extension Mission : MissionViewModel {
  var missionItem: Mission {
    return self
  }
}
