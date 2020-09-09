//
//  HttpServices.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Alamofire

protocol HttpService {
  var sessionManager : Session { get set}
  func request( _ urlRequest : URLRequestConvertible) -> DataRequest
  
}
