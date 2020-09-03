//
//  DataStructures.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct SignUpData : Codable {
  var status : Int
  var success : Bool
  var message : String
  var data : TokenData?
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(TokenData.self, forKey: .data)) ?? TokenData.init( accessToken: "")
  }
  struct TokenData:Codable{
    var accessToken : String
  }
}
struct PopularMissionData : Codable {
  var status : Int
  var success : Bool
  var message : String
  var data : [Mission]
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
     let values = try decoder.container(keyedBy: CodingKeys.self)
     status = (try? values.decode(Int.self, forKey: .status)) ?? -1
     success = (try? values.decode(Bool.self, forKey: .success)) ?? false
     message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode([Mission].self, forKey: .data)) ?? [Mission(missionName: "", category: .ALL, missionId: 0, dateCategory: .ALL, missionDescription: "", expectTree: 0, expectCo2: nil, missionImg: 0, startDate: "", endDate: "", passCandidateCount: nil, progressByMissionId: nil)]
   }
}

struct MissionInfo : Codable{
  var data : Int
  init(mission : Int) {
    self.data = mission
  }
}
