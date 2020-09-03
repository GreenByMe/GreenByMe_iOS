//
//  NetworkResult.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
enum NetworkResult<T> {
  case success(T)
  case requestErr(T)
  case pathErr
  case serverErr
  case netwrokFail
}
