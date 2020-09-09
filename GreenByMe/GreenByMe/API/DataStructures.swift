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
  var data : MissionInfo
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
     let values = try decoder.container(keyedBy: CodingKeys.self)
     status = (try? values.decode(Int.self, forKey: .status)) ?? -1
     data = (try? values.decode(MissionInfo.self, forKey: .data)) ?? MissionInfo()
   }
}

struct MissionInfo : Codable{
  var totalPage : Int
  var pageNumber : Int
  var contents : [Contents]
  enum CodingKeys:String, CodingKey {
    case totalPage = "totalPage"
    case pageNumber = "pageNumber"
    case contents = "contents"
  }
  init(totalPage : Int = 0, pageNumber : Int = 0, contents : [Contents] = [Contents()]) {
    self.totalPage = totalPage
    self.pageNumber = pageNumber
    self.contents = contents
  }
  init(from decoder : Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    totalPage = (try? values.decode(Int.self, forKey: .totalPage)) ?? 0
    pageNumber = (try? values.decode(Int.self, forKey: .totalPage)) ?? 0
    contents =  (try? values.decode([Contents].self, forKey: .contents)) ?? [Contents()]
  }
}
struct  Contents : Codable {
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
  enum CodingKeys:String, CodingKey {
    case missionId = "missionId"
    case category = "category"
    case title = "title"
    case subject = "subject"
    case description = "description"
    case missionPictureUrl = "missionPictureUrl"
    case dayCategory = "dayCategory"
    case expectTree = "expectTree"
    case expectCo2 = "expectCo2"
    case passCandidateCount = "passCandidateCount"
  }
  init ( missionId : Int = 0,category : String = "" , title : String = "", subject : String = "", description : String = "", missionPictureURL : String = "", dayCategory : String = "", expectTree : Double = 0, expectCo2 : Double = 0, passCandidateCount : Int = 0) {
    self.missionId = missionId
    self.category = category
    self.title = title
    self.subject = subject
    self.description = description
    self.missionPictureUrl = missionPictureURL
    self.dayCategory = dayCategory
    self.expectTree = expectTree
    self.expectCo2 = expectCo2
    self.passCandidateCount = passCandidateCount
  }
  init(from decoder : Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    missionId = (try? values.decode(Int.self, forKey: .missionId)) ?? 0
    category = (try? values.decode(String.self, forKey: .category)) ?? ""
    title = (try? values.decode(String.self, forKey: .title)) ?? ""
    subject  = (try? values.decode(String.self, forKey: .subject)) ?? ""
    description = (try? values.decode(String.self, forKey: .description)) ?? ""
    missionPictureUrl  = (try? values.decode(String.self, forKey: .missionPictureUrl)) ?? ""
    dayCategory = (try? values.decode(String.self, forKey: .dayCategory)) ?? ""
    expectTree  = (try? values.decode(Double.self, forKey: .expectTree)) ?? 0.0
    expectCo2  = (try? values.decode(Double.self, forKey: .expectCo2)) ?? 0.0
    passCandidateCount  = (try? values.decode(Int.self, forKey: .passCandidateCount)) ?? 0
  }
}
