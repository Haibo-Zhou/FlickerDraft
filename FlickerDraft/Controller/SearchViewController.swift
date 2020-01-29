//
//  SearchViewController.swift
//  FlickerDraft
//
//  Created by Chuck.Zhou on 1/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var flickerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        if let keyword = searchTextField.text {
            if let escapedString = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                print(escapedString)
                FlickerClient.Endpoints.keyword = escapedString
            } else {
                print("escapedString not exist!")
            }
            
            FlickerClient.getSearchResult(url: FlickerClient.Endpoints.searchByKeyword.url) { (photos, error) in
                PhotoModel.searchResult = photos
                // get image
                guard let urlString = PhotoModel.searchResult[0].url else {
                    print("Cannot find key 'url_m' in \(PhotoModel.searchResult[0])")
                    return
                }
                
                let imageURL = URL(string: urlString)!
                
                FlickerClient.fetchImage(imageURL, completion: self.handleImageFileResponse(image:error:))
            }
        } else {
            print("Search text field is empty!")
        }
        DispatchQueue.main.async {
            self.searchTextField.endEditing(true)
        }
    }
    
    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.flickerImageView.image = image
        }
    }

}



