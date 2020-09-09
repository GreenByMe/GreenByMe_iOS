//
//  MissionStorage.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import Foundation

import RxSwift

class MissionStorage : MissionStorageType {

  
  private var list : [Mission] = []
  private lazy var store = BehaviorSubject<[Mission]>(value: list)
  
  @discardableResult
  func callmissionList() -> Observable<[Mission]> {
    return store
  }
  @discardableResult
  func loadMission(missions:[Mission]) -> Observable<[Mission]>{
    list = missions
    store.onNext(list)
    return store
  }
  
  
  @discardableResult
  func savemission(mission: Mission, duration dayCategory: String) -> Observable<Mission> {
    
    let temp = Mission(mission: mission, duration: mission.strToDateCategory(dayCategory))
    list.append(temp)
    store.onNext(list)
    return Observable.just(temp)
  }
  @discardableResult
  func delete(mission: Mission) -> Observable<Mission> {
    if let index = list.firstIndex(where: { $0 == mission
    }) {
      list.remove(at: index)
    }
    store.onNext(list)
    return Observable.just(mission)
  }
  
  @discardableResult
  func count() -> Int {
    return list.count
  }
  
}
