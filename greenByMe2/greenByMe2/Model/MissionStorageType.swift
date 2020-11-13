//
//  MissionStorageType.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift

protocol MissionStorageType {
  @discardableResult
  func createMission(content : Mission) -> Observable<Mission>
  @discardableResult
  func missionList() -> Observable<[Mission]>
  @discardableResult
  func popMissoinList(content : Observable<[Mission]>) -> Observable<[Mission]>
}
