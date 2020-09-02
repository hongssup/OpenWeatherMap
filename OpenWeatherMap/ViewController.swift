//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by SeoYeon on 2020/09/01.
//  Copyright © 2020 SeoYeon. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let headers = [
            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
            "x-rapidapi-key": "809d751bb2msh012338b6953c756p169d82jsn314e7888acbc"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://community-open-weather-map.p.rapidapi.com/weather?callback=test&id=2172797&units=%2522metric%2522%20or%20%2522imperial%2522&mode=xml%252C%20html&q=London%252Cuk")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                // Try to parse out the data
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    print(dictionary)
                }
                catch{
                    print("Error parsing response data")
                }
                //print(data)
            }
        })

        dataTask.resume()
 
        /*
        // URL
            let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/weather?callback=test&id=2172797&units=%2522metric%2522%20or%20%2522imperial%2522&mode=xml%252C%20html&q=London%252Cuk")
            
            guard url != nil else {
                print("Error creating url object")
                return
            }
            
            // URL Request
            var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            
            // Specify the header
            let headers = ["x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
            "x-rapidapi-key": "809d751bb2msh012338b6953c756p169d82jsn314e7888acbc"]
            
            request.allHTTPHeaderFields = headers
            
            /*
            // Specify the body _no need for "GET" request
            let jsonObject = ["city": "London,uk",
                          "callback": "test",
                          "id": 2172797,
                          "units": "metric or imperial",
                          "mode": "xml, html"] as [String:Any] //keys are strings, values are any
            
            do {
                let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
                
                request.httpBody = requestBody
            }
            catch {
                print("Error creating the data object from json")
            }
            */
        
            // Set the request type
            request.httpMethod = "GET"
            
            // Get the URLSession
            let session = URLSession.shared
            
            // Create the data task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                // Check for errors
                if error == nil && data != nil {
                    
                    // Try to parse out the data
                    do {
                        let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                        print(dictionary)
                    }
                    catch{
                        print("Error parsing response data")
                    }
                }
            }
            
            // Fire off the data task
            dataTask.resume()
        */
 
        }
    


}

