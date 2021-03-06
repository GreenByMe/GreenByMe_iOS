//
//  PopularMissionsViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/11/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PopularMissionsViewModel {
  private let disposeBag = DisposeBag()
  
  public let loading : PublishSubject<Bool> = PublishSubject()
  public let popularMissions : PublishSubject<[MissionCell]> = PublishSubject()
  
  private let headerWithKey : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"]
  func getPopularMissionList() {
    let popularMissionList : ServiceClient<DTOForm<Missions>> = ServiceClient(url: APIConstraints.popularmission, httpMethod: .get, header: headerWithKey)
    self.loading.onNext(true)
    popularMissionList.service( completion : { [weak self] result in
      switch result {
      case .success(let missiondata) :
        guard let campains : [MissionCell] = missiondata.data.contents else {return}
        self?.popularMissions.onNext(campains)
      case .failure(let message) :
        print(message as Any)
      }
    })
  }
}
