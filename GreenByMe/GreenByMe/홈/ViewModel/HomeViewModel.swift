//
//  HomeViewModel.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Action
class HomeCommonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class HomeViewModel : HomeCommonViewModel{
  var userMissionList : Observable<[Mission]> {
    
    
    
    return storage.callmissionList()
  }
  var popularMissionList : Observable<[Mission]> {
    return storage.callmissionList()
  }
  var userMissionCount : Int {
    return storage.count()
  }
}
