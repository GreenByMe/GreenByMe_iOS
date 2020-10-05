//
//  ViewModrl.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import RxSwift
class ViewModel {
  var onShowErr :((_ alert : SingleButtonAlert) -> Void)?
  let showLoadingHud : Bindable = Bindable(false)
  
  let Cells = Bindable([Contents]())
  let appServerClient : AppServerClient
  init (appServerClient : AppServerClient = AppServerClient()) {
    self.appServerClient = appServerClient
  }
  
  func getMissions() {
    showLoadingHud.value = true
    appServerClient.getPopularMissions(completion : { [weak self] result in
      self?.showLoadingHud.value = false
      
      switch result {
      case .success(let mission) :
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
  var disposeBag : DisposeBag = DisposeBag()
  
  func loadPopular() -> Observable<[Contents]> {
    return Observable.create { seal in
      self.Cells.bindAndFire { [weak self] mission in
        if !mission.isEmpty {
          seal.onNext(mission)
          seal.onCompleted()
        }
      }
      self.showLoadingHud.bind() { [weak self] visible in
        if let `self` = self {
        }
      }
      return Disposables.create()
    }
  }
}
