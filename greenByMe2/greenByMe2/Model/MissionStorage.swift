//
//  MissionStorage.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
class MissionStorage : MissionStorageType {

  
  private var list : [Mission] = []
  private lazy var store = BehaviorSubject<[Mission]>(value: list)
  
  
  @discardableResult
  func createMission(content: Mission) -> Observable<Mission> {
    list.append(content)
    store.onNext(list)
    return Observable.just(content)
  }
  @discardableResult
  func missionList() -> Observable<[Mission]> {
    return store
  }
  @discardableResult
  func popMissoinList(content: Observable<[Mission]>) -> Observable<[Mission]> {
    content.map{ missions in
      
      self.store.onNext(missions)
    }
    return store
  }
}
