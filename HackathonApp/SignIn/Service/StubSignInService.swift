//
//  StubSignInService.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/22/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import Foundation

class StubSignInService : SignInService {
    func login(#email: String, password: String, success: (User -> ()), failure: (NSError -> ())) {
        if (email == "fail") {
            failure(NSError(
                domain: "com.hackathonapp.services",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey: "Login service failed"]));
            return;
        }
        
        var user = User(creator: nil);
        user.email = email;
        user.name = "Eric Galluzzo";
        user.token = "fake-token";
        success(user);
    }
}