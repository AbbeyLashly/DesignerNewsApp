//
//  Model.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-08.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import Alamofire

var baseURL             = "https://api-news.layervault.com"
var loginURL            = "/oauth/token"
var storiesURL          = "/api/v1/stories"
var storiesIDURL        = "/api/v1/stories/:id"
var storiesRecentURL    = "/api/v1/stories/recent"
var storiesSearchURL    = "/api/v1/stories/search"
var clientID            = "750ab22aac78be1c6d4bbe584f0e3477064f646720f327c5464bc127100a1a6d"
var clientSecret        = "53e3822c49287190768e009a8f8e55d09041c5bf26d0ef982693f215c72d87da"

func postLogin(email: String, password: String, callback: (AnyObject?) -> ()) {
    var request = baseURL + loginURL
    var parameters = [
        "grant_type": "password",
        "username": email,
        "password": password,
        "client_id": clientID,
        "client_secret": clientSecret
    ]
    
    Alamofire.request(.POST, request, parameters: parameters)
        .responseJSON { (_, _, json, _) in
            callback(json as? NSDictionary)
    }
}

func getStories(page: String, callback: (AnyObject?) -> ()) {
    var request = baseURL + storiesURL
    var parameters = [
        "page": page,
        "client_id": clientID
    ]
    
    Alamofire.request(.GET, request, parameters: parameters)
        .responseJSON { (_, _, json, _) in
            callback(json as? NSDictionary)
    }
}