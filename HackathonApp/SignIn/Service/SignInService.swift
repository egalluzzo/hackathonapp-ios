//
//  SignInService.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/21/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import Foundation

protocol SignInService {
    func login(#email: String, password: String, success: (User -> ()), failure: (NSError -> ()));
}