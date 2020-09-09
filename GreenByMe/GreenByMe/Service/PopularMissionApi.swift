//
//  PopularMissionApi.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import RxSwift

import Foundation
protocol PopularMissionApi {
  func fetchMissions() -> Single<PopularMissionResponse>
}
