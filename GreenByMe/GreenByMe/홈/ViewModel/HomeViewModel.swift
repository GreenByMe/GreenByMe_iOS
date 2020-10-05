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
import RxDataSources


class HomeCommonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class HomeViewModel : HomeCommonViewModel{
  let disposeBag = DisposeBag()
  //var vc = HomeViewController?.self
  private var popMissions : [Mission] = []
  
  var completionHandler : [() -> Void] = []
  
  //private let popularService : PopularMissionApi
  var userMissionList : Observable<[Mission]> {
    return storage.callmissionList()
  }
  var popularMissionList : Observable<[Mission]> {
//    print(getPopularMissions)
//    dump(storage)
//    print(completionHandler)
    return storage.callmissionList()
  }
  var userMissionCount : Int {
    return storage.count()
  }
  
  private var mission : MissionInfo? {
    didSet {
      guard let m = mission else {return}
      self.didFinishFetch?()
    }
  }
  
  var error :Error? {
    didSet{self.showAlertClosure?()}
  }
  var isLoading : Bool = false {
    didSet {self.updateLoadinngStatus?()}
  }
  private var dataService : PopularMission?
  
  var showAlertClosure : (() -> ())?
  var updateLoadinngStatus : (() -> ())?
  var didFinishFetch : (() -> ())?
  
  init(dataService : PopularMission) {
    self.dataService = dataService
  }
  func fetchMission() {
    self.dataService?.getPopularMissions(completion: { (networkResult) in
      switch networkResult {
      case .success(let data) :
        self.error = nil
        self.isLoading = false
        self.mission = data as! MissionInfo
      case .netwrokFail :
        print("networkFail")
        self.isLoading = false
      case .pathErr :
        print("pathErr")
        self.isLoading = false
      case .serverErr :
        print("serverErr")
        self.isLoading = false

      case .requestErr( _) :
        print("requestErr")
        self.isLoading = false

      }
    })

  }
  private func setUpCell(with missionInfo : MissionInfo) {
    if let 
  }
  
  
}

