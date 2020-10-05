//
//  Mission.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct Mission: Codable {
  var missionId : Int
  var category : String
  var title : String
  var subject : String
  var description : String
  var missionPictureUrl : String
  var dayCategory : String
  var expectTree : Double
  var expectCo2 : Double
  var passCandidateCount : Int
}

