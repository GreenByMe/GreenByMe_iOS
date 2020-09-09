//
//  PopularMissionService.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import RxSwift
import Alamofire
class PopularMissionService {
  
  private lazy var httpService = PopularHttpService()
  static let shared : PopularMissionService = PopularMissionService()
  
}
extension PopularMissionService : PopularMissionApi {
  func fetchMissions() -> Single<PopularMissionResponse> {
    return Single.create { [httpService] (single) -> Disposable in
      do {
        try PopularHttpRouter.getPopularMissions
          .request(usingHttpService: httpService)
          .responseJSON{(result) in
            guard let data = result.data else {return}
            do {
              let popmissions = try PopularMissionService.parseMissions(result : result)
              single(.success(popmissions))
            } catch {
              single(.error(error))
            }
        }
      }
      catch {
        single(.error(CustomError.error(message: "fetch failed")))}
      return Disposables.create()
    }
  }
  
  
}

extension PopularMissionService {
  static func parseMissions(result : AFDataResponse<Any>) throws -> PopularMissionResponse {
    guard let data = result.data,
      let popularResponse = try? JSONDecoder().decode(PopularMissionResponse.self, from: data)
    else {
      throw CustomError.error(message: "Invaild json")
    }
    return popularResponse
  }
}
