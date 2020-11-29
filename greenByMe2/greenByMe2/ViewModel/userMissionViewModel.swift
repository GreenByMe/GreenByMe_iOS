//
//  userMissionViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/11/16.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class UserMissionViewModel{
  private let disposeBag = DisposeBag()
  
  public let loading : PublishSubject<Bool> = PublishSubject()
  public let userMissionPublish : PublishSubject<[userMissionCell]> = PublishSubject()
  private let headerWithKey : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"]
  
  
  func getPersonalMissionList() {
    let personalMissionList : ServiceClient<DTOForm<userMissions>> = ServiceClient(url: APIConstraints.personalMission, httpMethod: .get, header: headerWithKey)
    self.loading.onNext(true)
    personalMissionList.service(completion: { [weak self] result in
      switch result {
      case .success(payload: let missionData) :
        
        let campains : [userMissionCell] = missionData.data.contents
        dump(campains)
        self?.userMissionPublish.onNext(campains)
      case .failure(let message) :
        print(message as Any)
      }
    })
  }

}
