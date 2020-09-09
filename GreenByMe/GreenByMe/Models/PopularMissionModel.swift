//
//  PopularMissionModel.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let popularMissionResponse = try? newJSONDecoder().decode(PopularMissionResponse.self, from: jsonData)

import Foundation

// MARK: - PopularMissionResponse
struct PopularMissionResponse: Codable {
    let data: DataClass
    let status: Int
    let message: JSONNull?
}

// MARK: - DataClass
struct DataClass: Codable {
    let totalPage, pageNumber: Int
    let contents: [Content]
}

// MARK: - Content
struct Content: Codable {
    let missionID: Int
    let category, title, subject, contentDescription: String
    let missionPictureURL: String
    let dayCategory: String
    let expectTree, expectCo2: Double
    let passCandidatesCount: Int
  
    enum CodingKeys: String, CodingKey {
        case missionID
        case category, title, subject
        case contentDescription
        case missionPictureURL
        case dayCategory, expectTree, expectCo2, passCandidatesCount
    }
  init ( missionId : Int = 0,category : String = "" , title : String = "", subject : String = "", description : String = "", missionPictureURL : String = "", dayCategory : String = "", expectTree : Double = 0, expectCo2 : Double = 0, passCandidateCount : Int = 0) {
    self.missionID = missionId
    self.category = category
    self.title = title
    self.subject = subject
    self.contentDescription = description
    self.missionPictureURL = missionPictureURL
    self.dayCategory = dayCategory
    self.expectTree = expectTree
    self.expectCo2 = expectCo2
    self.passCandidatesCount = passCandidateCount
  }
  init(from decoder : Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    missionID = (try? values.decode(Int.self, forKey: .missionID)) ?? 0
    category = (try? values.decode(String.self, forKey: .category)) ?? ""
    title = (try? values.decode(String.self, forKey: .title)) ?? ""
    subject  = (try? values.decode(String.self, forKey: .subject)) ?? ""
    contentDescription = (try? values.decode(String.self, forKey: .contentDescription)) ?? ""
    missionPictureURL  = (try? values.decode(String.self, forKey: .missionPictureURL)) ?? ""
    dayCategory = (try? values.decode(String.self, forKey: .dayCategory)) ?? ""
    expectTree  = (try? values.decode(Double.self, forKey: .expectTree)) ?? 0.0
    expectCo2  = (try? values.decode(Double.self, forKey: .expectCo2)) ?? 0.0
    passCandidatesCount  = (try? values.decode(Int.self, forKey: .passCandidatesCount)) ?? 0
  }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
