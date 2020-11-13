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
    let personalMissionHomePageDtos: [PersonalMissionHomePageDto]
    let popularMissionHomePageResponseDtos: [PopularMissionHomePageResponseDto]
    let userHomePageDetailDto: UserHomePageDetailDto
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
        case missionID
        case missionTitle
        case personalMissionID
        case pictureURL
        case progress, remainPeriod, startDate, status
    }
}

// MARK: - RemainPeriod
struct RemainPeriod: Codable {
    let remainDay, remainHour, remainMin: Int
}

// MARK: - PopularMissionHomePageResponseDto
struct PopularMissionHomePageResponseDto: Codable {
    let endDate: String
    let missionID, passCandidatesCount: Int
    let pictureURL, startDate, subject: String

    enum CodingKeys: String, CodingKey {
        case endDate
        case missionID
        case passCandidatesCount
        case pictureURL
        case startDate, subject
    }
}

// MARK: - UserHomePageDetailDto
struct UserHomePageDetailDto: Codable {
    let expectedCO2, expectedTree: Int
    let nickName: String
    let progressCampaign, progressRates: Int
    let treeSentence: String
}
