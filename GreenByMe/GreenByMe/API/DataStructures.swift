//
//  DataStructures.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct SignUpData : Codable {
  var status : Int
  var success : Bool
  var message : String
  var data : TokenData?
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(TokenData.self, forKey: .data)) ?? TokenData.init( accessToken: "")
  }
  struct TokenData:Codable{
    var accessToken : String
  }
}
