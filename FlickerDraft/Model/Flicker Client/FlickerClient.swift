//
//  FlickerClient.swift
//  FlickerDraft
//
//  Created by Chuck.Zhou on 1/26/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit

class FlickerClient {
    
    static let apiKey = "{ your api key }"
    
    struct Auth {
        static var requestToken = ""
        
    }
    
    enum Endpoints {
        static let base = "https://www.flickr.com/services/rest"
        static let apiKeyParam = "&api_key=\(FlickerClient.apiKey)"
        static var keyword = ""
        
        // case webAuth
        case searchByKeyword
        
        var stringValue: String {
            switch self {
            case .searchByKeyword:
                return Endpoints.base + "/?method=flickr.photos.search" + Endpoints.apiKeyParam + "&text=\(Endpoints.keyword)" + "&format=json" + "&extras=url_m" + "&nojsoncallback=1"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func getSearchResult(url: URL, completion: @escaping ([Photo], Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                Alert().displayAlert(("No data was returned by the request!"))
                completion([], error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                print("data: ", data)
                let responseObject = try decoder.decode(SearchResults.self, from: data)
                let Photos = responseObject.photos.photo
                completion(Photos, nil)
                
            } catch {
                print("ERROR: ", error)
                completion([], error)
            }
        }
        task.resume()
    }
    
    class func fetchImage(_ url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let downloadedImage = UIImage(data: data)
            completion(downloadedImage, nil)
        }
        task.resume()
    }
}
