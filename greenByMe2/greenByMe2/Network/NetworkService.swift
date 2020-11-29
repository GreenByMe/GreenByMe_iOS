//
//  NetworkService.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/11/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

class ServiceClient<T : Codable> {
  
  let personalToken : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"]
  let httpMethod : HTTPMethod
  let header : HTTPHeaders
  let parameters : Parameters?
  let url : String
  
  enum FailureReasons : Int, Error {
    case unAuthorized = 401
    case notFound = 404
  }
  
  typealias getResult = Result< T , FailureReasons >
  typealias serviceCompletion = (_ result : getResult) -> Void
  
  
  init(url : String, httpMethod : HTTPMethod, header : HTTPHeaders, parameters : Parameters? = nil) {
    self.httpMethod = httpMethod
    self.header = header
    self.parameters = parameters
    self.url = url
  }
  
  func service(completion : @escaping serviceCompletion) {
    let dataRequest = AF.request(url,method: httpMethod, parameters: parameters, encoding: JSONEncoding.default, headers: header)
      .validate()
      .responseJSON { response in
        completion(self.responseResult(response: response))
    }
  }
  
  func responseResult(response : AFDataResponse<Any>) -> getResult{
    switch response.result{
    case .success:
      return decodeResultData(response: response)
    case .failure(let message) :
      print(message)
      if let statusCode = response.response?.statusCode , let reason = FailureReasons(rawValue: statusCode) {
        return .failure(reason)
      }
      return .failure(nil)
    }
  }
  
  func decodeResultData(response : AFDataResponse<Any>) -> getResult {
    guard let data = response.data else {
      print("can't get data")
      print(response)
      return .failure(nil)
    }
    do {
      dump(data)
      dump(T.self)
      let decodedData = try JSONDecoder().decode(T.self, from: data)
      return .success(payload: decodedData)
    }
    catch {
      print("decode fail")
      return .failure(nil)
    }
  }
}
