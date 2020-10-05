//
//  Bindable.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
class Bindable<T> {
  typealias Listener = ((T) -> Void)
  var listener : Listener?
  var value:T {
    didSet {
      listener?(value)
    }
  }
  init(_ v : T) {
    self.value = v
  }
  func bind(_ listener : Listener?) {
    self.listener = listener
  }
  func bindAndFire(_ listener : Listener?) {
    self.listener = listener
    listener?(value)
  }
}
