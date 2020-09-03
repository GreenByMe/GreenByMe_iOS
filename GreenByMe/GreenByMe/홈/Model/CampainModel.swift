//
//  missionModel.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
struct Mission : Equatable, Comparable{
  static func < (lhs: Mission, rhs: Mission) -> Bool {
    return true
  }
  var missionName : String
  var category : MissionCategory
  var missionId : Int
  var dateCategory : DateCategory
  var missionDescription : String
  var expectTree : Double
  var expectCo2 : Double
  var missionImg : UIImage
  var startDate : String
  var endDate : String
  var passCandidateCount : Int
  var progressByMissionId : Int
  
  func strToCategory ( _ s : String) -> MissionCategory {
    switch s {
    case "ALL" : return MissionCategory.ALL
    case "NONE" : return MissionCategory.NONE
    case "ENERGY" : return MissionCategory.ENERGY
    case "DISPOSABLE" : return MissionCategory.DISPOSABLE
    case "TRAFFIC" : return MissionCategory.TRAFFIC
    case "WATERWORKS" : return MissionCategory.WATERWORKS
    case "CAMPAIGN" : return MissionCategory.CAMPAIGN
    default :
      return MissionCategory.ALL
    }
  }
  func strToDateCategory ( _ s : String) -> DateCategory {
    switch s {
    case "ALL" : return DateCategory.ALL
    case "DAY" : return DateCategory.DAY
    case "WEEK" : return DateCategory.WEEK
    case "MONTH" : return DateCategory.MONTH
    default :
      return DateCategory.ALL
    }
  }
  enum MissionCategory {
    case ALL
    case NONE
    case ENERGY
    case DISPOSABLE
    case TRAFFIC
    case WATERWORKS
    case CAMPAIGN
  }

  enum DateCategory {
    case ALL
    case DAY
    case WEEK
    case MONTH
  }
  
  init (missionName : String,category : MissionCategory,missionId : Int,dateCategory : DateCategory,missionDescription : String,expectTree : Double,expectCo2 : Double,missionImg : UIImage,startDate : String,endDate : String,passCandidateCount : Int, progressByMissionId : Int) {
    self.missionName = missionName
    self.category = category
    self.missionId = missionId
    self.dateCategory = dateCategory
    self.missionDescription = missionDescription
    self.expectTree = expectTree
    self.expectCo2 = expectCo2
    self.missionImg = missionImg
    self.startDate = startDate
    self.endDate = endDate
    self.passCandidateCount = passCandidateCount
    self.progressByMissionId = progressByMissionId
  }
  init ( mission : Mission , duration : DateCategory){
    self = mission
    self.dateCategory = duration
  }
}

//MARK : 캠페인 프로토콜
protocol MissionStorageType {
  @discardableResult
  func callmissionList() -> Observable<[Mission]>
  
  @discardableResult
  func savemission(mission : Mission, duration dayCategory : String) -> Observable<Mission>
  
  @discardableResult
  func delete(mission : Mission) -> Observable<Mission>
  
  @discardableResult
  func count() -> Int
}
