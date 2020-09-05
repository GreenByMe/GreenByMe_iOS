//
//  Services.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpService {
  static let shared = SignUpService()
  
  private func makeParameter(_ email:String, _ pwd:String) ->Parameters{
    return ["":email, "":pwd]
  }
}

struct PopularMission {
  static var shared = PopularMission()
  var completionHandler : [(NetworkResult<Any>) -> Void] = []

  mutating func getPopularMissions(completion : @escaping (NetworkResult<Any>) -> Void) {
    let header : HTTPHeaders = ["Content-Type" : "application/json"]
    let url = APIConstraints.popularmission
    let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData {
      dataResponse in
      switch dataResponse.result {
      case.success(let value) :
        guard let statusCode = dataResponse.response?.statusCode else{return}
//        guard let value = dataResponse.result.value else {return}
        var networkResult : NetworkResult<Any>?
        switch statusCode {
        case 200:
          let decoder = JSONDecoder()
          
          guard let decodedData = try? decoder.decode(PopularMissionData.self, from: value) else
          {
            return networkResult = .pathErr
          }
          networkResult = .success(decodedData.data)
        case 400 : networkResult = .pathErr
        case 500 : networkResult = .serverErr
        default :
          networkResult = .netwrokFail
        }
        completion(networkResult!)
        
      case .failure : completion(.netwrokFail)
      }
    }
    completionHandler.append(completion)
    return
  }
  
}
