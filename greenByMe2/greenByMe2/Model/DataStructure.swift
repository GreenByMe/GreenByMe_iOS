//
//  DataStructure.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct SignUpData : Codable {
  var status : Int
  var message : String
  var data : String
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case message = "message"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(String.self, forKey: .data)) ?? ""
  }
}

struct SignInData : Codable {
  var status : Int
  var message : String
  var data : String
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case message = "message"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(String.self, forKey: .data)) ?? ""
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
  var contents : [Mission]
  enum CodingKeys:String, CodingKey {
    case totalPage = "totalPage"
    case pageNumber = "pageNumber"
    case contents = "contents"
  }
  init(totalPage : Int = 0, pageNumber : Int = 0, contents : [Mission] = [Mission()]) {
    self.totalPage = totalPage
    self.pageNumber = pageNumber
    self.contents = contents
  }
  init(from decoder : Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    totalPage = (try? values.decode(Int.self, forKey: .totalPage)) ?? 0
    pageNumber = (try? values.decode(Int.self, forKey: .totalPage)) ?? 0
    contents =  (try? values.decode([Mission].self, forKey: .contents)) ?? [Mission()]
  }
}

struct PersonalMissionData : Codable {
  var message : String
  var status : Int
  var errors : [String : String]
  var data : MissionInfo
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
     let values = try decoder.container(keyedBy: CodingKeys.self)
    message = (try? values.decode(String.self, forKey: .status)) ?? ""
    errors = (try? values.decode([String:String].self, forKey: .status)) ?? [:]
     status = (try? values.decode(Int.self, forKey: .status)) ?? -1
     data = (try? values.decode(MissionInfo.self, forKey: .data)) ?? MissionInfo()
   }
}
