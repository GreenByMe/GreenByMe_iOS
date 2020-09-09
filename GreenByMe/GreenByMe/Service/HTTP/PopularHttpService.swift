//
//  PopularHttpService.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import Alamofire
class PopularHttpService: HttpService {
  var sessionManager: Session = Session.default

  func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
    return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
  }
  
}
