//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Jose Luiz Bento da Silva on 17/02/24.
//

import Foundation


struct UserModel: Codable {
    let email: String
    let password: String
    
    init (){
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
