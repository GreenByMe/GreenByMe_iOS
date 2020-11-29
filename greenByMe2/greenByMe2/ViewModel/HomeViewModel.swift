//
//  ViewModel.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import Action
class CommoonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class HomeViewModel : CommoonViewModel {
  
  private let disposeBag = DisposeBag()
  var onShowErr :((_ alert : SingleButtonAlert) -> Void)?
  let showLoadingHud : Bindable = Bindable(false)
  
  public let missions : PublishSubject<[Mission]> = PublishSubject()
  public let loading : PublishSubject<Bool> = PublishSubject()
  public let homePageDto : PublishSubject<UserHomePageDetailDto> = PublishSubject()
  public let personalMissions : PublishSubject<[PersonalMissionHomePageDto]> = PublishSubject()
  public let popularMissions : PublishSubject<[PopularMissionHomePageResponseDto]> = PublishSubject()
  private let headerWithKey : HTTPHeaders = ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"]
  let Cells = Bindable([Mission]())
  let appServerClient : AppServerClient
  init (appServerClient : AppServerClient = AppServerClient(), _ store : MissionStorageType) {
    self.appServerClient = appServerClient
    super.init(storage: store)
  }
  
  func getHomePageInfo() {
    let homePageService : ServiceClient<DTOForm<DataClass>> = ServiceClient(url: APIConstraints.home, httpMethod: .get, header: ["jwt" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwicm9sZXMiOltdLCJpYXQiOjE2MDY0NzU1ODUsImV4cCI6MTYwNzY4NTE4NX0.jUofnfBQi4OtlwfzzXiFa_fxKXSwvz4MyCiUJ4SIVrE","Content-Type" : "application/json"])
    self.loading.onNext(true)
    homePageService.service(completion: { [weak self] result in
      
      switch result {
      case .success(let homePage) :
        
        guard let homepageDetails : UserHomePageDetailDto = homePage.data.userHomePageDetailDto else {
          return
        }
        print(homepageDetails)
        guard let personalMissions : [PersonalMissionHomePageDto] = homePage.data.personalMissionHomePageDtos else {
          return
        }
        guard let popularMissions : [PopularMissionHomePageResponseDto] = homePage.data.popularMissionHomePageResponseDtos else { return }
        self?.popularMissions.onNext(popularMissions)
        self?.personalMissions.onNext(personalMissions)
        
        self?.homePageDto.onNext(homepageDetails)
      case .failure(let error) :
        print(error)
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


