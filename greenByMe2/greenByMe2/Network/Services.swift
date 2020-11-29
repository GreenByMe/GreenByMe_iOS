//
//  Services.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire
class AppServerClient {
  let personalToken : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyIiwicm9sZXMiOltdLCJpYXQiOjE2MDE4ODY3OTksImV4cCI6MTYwMzA5NjM5OX0.TzN7e-yhJkgzL_lu7EUP6tmXmDV7UwNnR3TklFs6vJs","Content-Type" : "application/json"]
  
  
  enum GetFailureReason : Int , Error {
    case unAuthorized = 401
    case notFound = 404
  }
  
  typealias getResult = Result<[Mission], GetFailureReason>
  typealias getCompletion = (_ result : getResult) -> Void
  typealias signUpResult = Result<SignUpData, GetFailureReason>
  typealias signUpCompletion = (_ result : signUpResult) -> Void
  typealias signInResult = Result<SignInData, GetFailureReason>
  typealias signInCompletion = (_ result : signInResult) -> Void
  
  
  private func makeParameter(_ email:String, _ name: String, _ nickname : String, _ pwd:String) ->Parameters{
    return ["email":email,"name" : name ,"nickname" : nickname,"password":pwd]
  }
  
  
  func signIn(email : String, pwd :String, completion :  @escaping signUpCompletion) {
     let header : HTTPHeaders = ["Content-Type" : "application/json"]
     let url = APIConstraints.signin
     let dataRequest = AF.request(url, method: .post, parameters: ["email":email,"password":pwd], encoding: JSONEncoding.default, headers: header)
     .validate()
       .responseJSON { response in
         switch response.result {
         case .success :
           do {
             guard let data = response.data else {
               completion(.failure(nil))
               return
             }
             print(data)
             let user = try JSONDecoder().decode(SignUpData.self, from : data)
             completion(.success(payload: user))
           }
           catch {
             completion(.failure(nil))
           }
         case .failure(let message) :
           print(message)
           if let statusCode = response.response?.statusCode, let reason = GetFailureReason(rawValue: statusCode) {
             completion(.failure(reason))
           }
           completion(.failure(nil))
       }
     }
   }
  
  
  
  func signUp(email : String, name : String, nickname : String, pwd :String, completion :  @escaping signUpCompletion) {
    let header : HTTPHeaders = ["Content-Type" : "application/json"]
    let url = APIConstraints.signup
    let dataRequest = AF.request(url, method: .post, parameters: makeParameter(email, name, nickname, pwd), encoding: JSONEncoding.default, headers: header)
    .validate()
      .responseJSON { response in
        switch response.result {
        case .success :
          do {
            guard let data = response.data else {
              completion(.failure(nil))
              return
            }
            print(data)
            let user = try JSONDecoder().decode(SignUpData.self, from : data)
            completion(.success(payload: user))
          }
          catch {
            completion(.failure(nil))
          }
        case .failure(let message) :
          print(message)
          if let statusCode = response.response?.statusCode, let reason = GetFailureReason(rawValue: statusCode) {
            completion(.failure(reason))
          }
          completion(.failure(nil))
      }
    }
  }
  

}
