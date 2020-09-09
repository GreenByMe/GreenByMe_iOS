//
//  PopularHttpRouter.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Alamofire

enum PopularHttpRouter {
  case getPopularMissions
}

extension PopularHttpRouter : HttpRouter {
  var baseURLString: String {
    return APIConstraints.baseURL
  }
  
  var path: String {
    switch self {
    case .getPopularMissions:
      return "missions/populars"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getPopularMissions:
      return .get
    }
  }
  var headers: HTTPHeaders? {
    let header : HTTPHeaders = ["Content-Type" : "application/json"]
    return header
  }
  
  
}
