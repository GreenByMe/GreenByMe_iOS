//
//  APIConstraint.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct APIConstraints {
  static let baseURL = "http://ec2-13-58-104-154.us-east-2.compute.amazonaws.com:8080/api/"
  static let page = baseURL + "page"
  static let cert = page + "/cert"
  static let home = page + "/home"
  
  static let user = baseURL + "users"
  static let email = user + "/email/"
  static let expectation = user + "/expectTreeCo2"
  static let images = user + "/images/"
  static let nickname = user + "/nickname/"
  static let personalMission = user + "/personalMissions"
  static let posts = user + "/posts"
  static let refresh = user + "/refresh"
  static let signin = user + "/signin"
  static let signup = user + "/signup"
  
  static let missionData = baseURL + "/missions"
  static let missionInfo = missionData + "/"
  static let categoryInfo = missionData + "/categorys/"
  static let daycategory = "/daycategory/"
  static let missionImg = missionData + "/images/"
  static let popularmission = missionData + "/populars"
}
