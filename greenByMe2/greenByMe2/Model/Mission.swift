//
//  Mission.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct Mission : Codable {
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


struct http<T : Codable> : Codable {
  let data : T
  let message : String?
  let status : Int
}

struct homepageDTO : Codable {
  
}


protocol Mission3 {
  var missionID: Int { get set }
  var subject : String { get set }
  var startDate : String { get set }
  var endDate : String { get set }
  var pictureURL : String { get set }
}

struct popularMissionDto : Codable , Mission3 {
  var missionID: Int
  var subject: String
  var startDate: String
  var endDate: String
  var pictureURL: String
}
 
