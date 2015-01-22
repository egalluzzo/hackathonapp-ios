//
//  NetworkSignInService.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/21/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import Foundation

let baseUrl = "https://murmuring-sands-6072.herokuapp.com";

class NetworkSignInService : SignInService {
    func login(#email: String, password: String, success: (User -> ()), failure: (NSError -> ())) {
        
        var request = NSMutableURLRequest(URL: NSURL(string:"\(baseUrl)/login")!);
        var writeError: NSError?;
        var data = NSJSONSerialization.dataWithJSONObject(
            ["user": ["email": email, "password": password]],
            options: NSJSONWritingOptions.allZeros,
            error: &writeError);
        
        if let error = writeError {
            failure(error);
            return;
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.setValue(String(data!.length), forHTTPHeaderField:"Content-Length");
        request.HTTPMethod = "POST";
        request.HTTPBody = data;
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response: NSURLResponse!, data: NSData!, connectionError: NSError!) -> Void in
            
            if (connectionError != nil) {
                failure(connectionError);
                return;
            }
            
            var readError: NSError?;
            var jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &readError) as Dictionary<String, AnyObject>;
            if let error = readError {
                failure(error);
                return;
            }
            
            var user = User(creator: nil);
            user.email = email;
            user.name = jsonObject["name"] as String;
            user.token = jsonObject["token"] as String;
            success(user);
        });
    }
}
