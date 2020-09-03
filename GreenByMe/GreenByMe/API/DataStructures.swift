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
  var data : [MissionInfo]
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
    data = (try? values.decode([MissionInfo].self, forKey: .data)) ?? [MissionInfo()]
   }
}

struct MissionInfo : Codable{
  var totalPage : Int
  var pageNumber : Int
  var contents : [Contents]
  init(totalPage : Int = 0, pageNumber : Int = 0, contents : [Contents] = [Contents()]) {
    self.totalPage = totalPage
    self.pageNumber = pageNumber
    self.contents = contents
  }
}
struct  Contents : Codable {
  var missionId : Int
  var category : String
  var title : String
  var subject : String
  var description : String
  var missionPictureURL : String
  var dayCategory : String
  var expectTree : Double
  var expectCo2 : Double
  var passCandidateCount : Int
  
  init ( missionId : Int = 0,category : String = "" , title : String = "", subject : String = "", description : String = "", missionPictureURL : String = "", dayCategory : String = "", expectTree : Double = 0, expectCo2 : Double = 0, passCandidateCount : Int = 0) {
    self.missionId = missionId
    self.category = category
    self.title = title
    self.subject = subject
    self.description = description
    self.missionPictureURL = missionPictureURL
    self.dayCategory = dayCategory
    self.expectTree = expectTree
    self.expectCo2 = expectCo2
    self.passCandidateCount = passCandidateCount
  }
}
