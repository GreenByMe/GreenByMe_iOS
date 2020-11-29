//
//  Datastructures.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

// MARK: - DTOForm
public struct DTOForm<T:Codable> : Codable {
  let data : T
  let status : Int
  let message : String?

}
// MARK: - DataClass
struct DataClass: Codable {
    let userHomePageDetailDto: UserHomePageDetailDto
    let personalMissionHomePageDtos: [PersonalMissionHomePageDto]
    let popularMissionHomePageResponseDtos: [PopularMissionHomePageResponseDto]
}

// MARK: - PersonalMissionHomePageDto
struct PersonalMissionHomePageDto: Codable {
    let personalMissionID, missionID: Int
    let missionTitle: String
    let finishCount, progress: Int?
    let manyPeople: Int
    let startDate, endDate: String
    let remainPeriod: RemainPeriod?
    let pictureURL: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case personalMissionID = "personalMissionId"
        case missionID = "missionId"
        case missionTitle, finishCount, progress, manyPeople, startDate, endDate, remainPeriod
        case pictureURL = "pictureUrl"
        case status
    }
}

// MARK: - RemainPeriod
struct RemainPeriod: Codable {
    let remainDay, remainHour, remainMin: Int
}

// MARK: - PopularMissionHomePageResponseDto
struct PopularMissionHomePageResponseDto: Codable {
    let missionID: Int
    let subject, startDate, endDate: String
    let passCandidatesCount: Int
    let pictureURL: String

    enum CodingKeys: String, CodingKey {
        case missionID = "missionId"
        case subject, startDate, endDate, passCandidatesCount
        case pictureURL = "pictureUrl"
    }
}

// MARK: - UserHomePageDetailDto
struct UserHomePageDetailDto: Codable {
    let nickName, treeSentence: String
    let expectedCO2, expectedTree: Double
    let progressRates, progressCampaign: Int
}

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
// MARK: - Missions
struct Missions: Codable {
    let totalPage, pageNumber: Int
    let contents: [MissionCell]
}
// MARK: - userMissions

struct userMissions : Codable {
  let totalPage, pageNumber : Int
  let contents : [userMissionCell]
}
// MARK: - userMissionCell

struct userMissionCell: Codable {
    let personalMissionID, missionID: Int
    let missionTitle: String
    let finishCount, progress, manyPeople: Int
    let startDate, endDate: String
    let remainPeriod: RemainPeriod
    let missionPictureURL: String

    enum CodingKeys: String, CodingKey {
        case personalMissionID = "personalMissionId"
        case missionID = "missionId"
        case missionTitle, finishCount, progress, manyPeople, startDate, endDate, remainPeriod
        case missionPictureURL = "missionPictureUrl"
    }
}

// MARK: - MissionCell
struct MissionCell: Codable {
    let missionID: Int
    let category, missionTitle, subject, contentDescription: String
    let missionPictureURL: String
    let dayCategory : String
    let expectTree, expectCo2: Double
    let passCandidatesCount: Int

    enum CodingKeys: String, CodingKey {
        case missionID = "missionId"
        case category, missionTitle, subject
        case contentDescription = "description"
        case missionPictureURL = "missionPictureUrl"
        case dayCategory, expectTree, expectCo2, passCandidatesCount
    }
}

