//
//  Datastructures.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

// MARK: - HomeView
struct HomeView: Codable {
    let data: DataClass
    let status: Int
    let message: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let userHomePageDetailDto: UserHomePageDetailDto
    let personalMissionHomePageDtos: [PersonalMissionHomePageDto]
    let popularMissionHomePageResponseDtos: [PopularMissionHomePageResponseDto]
}

// MARK: - PersonalMissionHomePageDto
struct PersonalMissionHomePageDto: Codable {
    let endDate: String
    let finishCount, manyPeople, missionID: Int
    let missionTitle: String
    let personalMissionID: Int
    let pictureURL: String
    let progress: Int
    let remainPeriod: RemainPeriod
    let startDate, status: String

    enum CodingKeys: String, CodingKey {
        case endDate, finishCount, manyPeople
        case missionID = "missionId"
        case missionTitle
        case personalMissionID = "personalMissionId"
        case pictureURL = "pictureUrl"
        case progress, remainPeriod, startDate, status
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
    let expectedCO2, expectedTree, progressRates, progressCampaign: Int
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
// MARK: - PopularMissions
struct PopularMissions: Codable {
    let data: Missions
    let status: Int
    let message: String?
}

// MARK: - Missions
struct Missions: Codable {
    let totalPage, pageNumber: Int
    let contents: [MissionCell]
}

// MARK: - MissionCell
struct MissionCell: Codable {
    let missionID: Int
    let category, missionTitle, subject, contentDescription: String
    let missionPictureURL: String
    let dayCategory: String
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
