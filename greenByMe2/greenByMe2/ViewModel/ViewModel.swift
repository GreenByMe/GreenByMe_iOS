//
//  ViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
import Action
class CommoonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class ViewModel : CommoonViewModel {
  
  private let disposeBag = DisposeBag()
  var onShowErr :((_ alert : SingleButtonAlert) -> Void)?
  let showLoadingHud : Bindable = Bindable(false)
  
  public let missions : PublishSubject<[Mission]> = PublishSubject()
  public let loading : PublishSubject<Bool> = PublishSubject()
  
  
  
  
  
  let serviceClient : ServiceClient<PopularMissionData> = ServiceClient(url: APIConstraints.popularmission, httpMethod: .get, header : ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyIiwicm9sZXMiOltdLCJpYXQiOjE2MDE4ODY3OTksImV4cCI6MTYwMzA5NjM5OX0.TzN7e-yhJkgzL_lu7EUP6tmXmDV7UwNnR3TklFs6vJs","Content-Type" : "application/json"])
  let Cells = Bindable([Mission]())
  let appServerClient : AppServerClient
  init (appServerClient : AppServerClient = AppServerClient(), _ store : MissionStorageType) {
    self.appServerClient = appServerClient
    super.init(storage: store)
  }
  
  func getMissions2() {
    showLoadingHud.value = true
    self.loading.onNext(true)
    serviceClient.service(completion: { [weak self] result in
      self?.showLoadingHud.value = false
      
      switch result {
      case .success(let popularMission) :

        guard let mission : [Mission] = popularMission.data.contents else {
          return
        }
        self?.missions.onNext(mission)
        guard mission.count > 0 else {
          self?.Cells.value = []
          return
        }
        print(mission)
        self?.Cells.value = mission
      case .failure(let error) :
        self?.Cells.value = []
      }
    })
  }
  func saveContents(_ contents : [Mission] ) -> Observable<[Mission]> {
    return Observable.create { content in
      content.onNext(contents)
      content.onCompleted()
      return Disposables.create()
    }
     
  }
  
  var popularMissionList : Observable<[Mission]> {
    let missions = Observable<[Mission]>.create { seal in
      seal.onNext(self.Cells.value)
      self.Cells.bindAndFire { [weak self] mission in
        if !mission.isEmpty {
          seal.onNext(mission)
          seal.onCompleted()
        }
      }
      self.showLoadingHud.bind() { [weak self] visible in
        
      }
      return Disposables.create()
    }
    return storage.popMissoinList(content: missions)
  }
}


