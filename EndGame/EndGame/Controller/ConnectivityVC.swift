//
//  ConnectivityVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 25/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation

enum ConnectionError: Error {
    case noInternetConnection
    case customError(String)
    case other
}

extension ConnectionError {
    init(json: JSON) {
        if let message =  json["status_message"] as? String {
            self = .customError(message)
        } else {
            self = .other
        }
    }
}
extension ConnectionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .customError(let message):
            return "Error code 404"
        case .other:
            return "Not Responding Check your connection"
        }
    }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


class ConnectivityVC {
    
    class func loadEmployeeData(urlString: String, completion: @escaping ((Any?,Error?) -> ())){
        guard let url = URL(string: urlString) else{
            debugPrint("unable");
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethod.get.rawValue
        let session = URLSession(configuration: .default)
        let sessionTask = session.dataTask(with: request) { (responseData, response, err) in
            var object: Any? = nil
            if let data = responseData {
                object = try? JSONDecoder().decode([Employee].self, from: data)
            }
            
            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                completion(object, nil)
            } else {
                let error = (object as? JSON).flatMap(ConnectionError.init) ?? ConnectionError.other
                completion(nil, error)
            }
        }
        sessionTask.resume()
    }
    
    class func loadEmployeeById(urlString: String, completion: @escaping ((Any?,Error?) -> ())){
        guard let url = URL(string: urlString) else{
            debugPrint("unable");
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethod.get.rawValue
        let session = URLSession(configuration: .default)
        
        let sessionTask = session.dataTask(with: request) { (responseData, response, err) in
            var object: Any? = nil
            if let data = responseData {
                object = try? JSONDecoder().decode(Employee.self, from: data)
            }
            
            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                completion(object, nil)
            } else {
                let error = (object as? JSON).flatMap(ConnectionError.init) ?? ConnectionError.other
                completion(nil, error)
            }
        }
        sessionTask.resume()
    }
}
