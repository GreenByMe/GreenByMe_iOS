//
//  ModelDetailViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/12/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class ModelDetialViewModel{
  private let disposeBag = DisposeBag()
  
  public let loading : PublishSubject<Bool> = PublishSubject()
  public let MissionDetail : PublishSubject<DetailMisison> = PublishSubject()
  private let headerWithKey : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"]
  
  private let parameters : Parameters = ["missionId" : 1]
  func getDetailMission() {
    let service : ServiceClient<DTOForm<DetailMisison>> = ServiceClient(url: APIConstraints.missionData, httpMethod: .get, header: headerWithKey, parameters: parameters)
    self.loading.onNext(true)
    service.service(completion: { [weak self] result in
      switch result {
      case .success(payload: let data) :
        let missionData : DetailMisison = data.data
        print(missionData)
        self?.MissionDetail.onNext(missionData)
      case .failure(let err) : print(err as Any)
      }
    })
  }
}
