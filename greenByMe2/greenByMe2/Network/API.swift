//
//  API.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct APIConstraints {
  static let baseURL = "https://cafecube.iptime.org/api/"
  static let page = baseURL + "page"
  static let cert = page + "/cert"
  static let home = page + "/home"
  
  static let user = baseURL + "users"
  static let email = user + "/email/"
  static let expectation = user + "/expectTreeCo2"
  static let images = user + "/images/"
  static let nickname = user + "/nickname/"
  static let userPersonalMission = user + "/personalMissions"
  static let posts = user + "/posts"
  static let refresh = user + "/refresh"
  static let signin = user + "/signin"
  static let signup = user + "/signup"
  
  static let missionData = baseURL + "missions"
  static let missionInfo = missionData + "/"
  static let categoryInfo = missionData + "/categorys/"
  static let daycategory = "/daycategory/"
  static let missionImg = missionData + "/images/"
  static let popularmission = missionData + "/populars"
  
  
  static let personalMission = baseURL + "personalmissions"

}

