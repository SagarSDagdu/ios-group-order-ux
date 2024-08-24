//
//  ViewController.swift
//  GroupOrderFoodExample
//
//  Created by Sagar Dagdu on 24/08/24.
//

import UIKit
import LinkPresentation

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var restaurantName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func shareGroupOrder(_ sender: Any) {
        shareGroupOrder()
    }
    
    private func shareGroupOrder() {
        var url = URL(string: "grouporder://")!
        let queryItems = [
            URLQueryItem(name: "user_name", value: username.text!),
            URLQueryItem(name: "restaurant_name", value: restaurantName.text!)
        ]
        
        url.append(queryItems: queryItems)
        
        let metadata = LPLinkMetadata()
        metadata.originalURL = url
        metadata.url = url
        metadata.title = "Join to order from \(restaurantName.text!)!"
        
        metadata.iconProvider = NSItemProvider(object: UIImage(systemName: "cart")!)
        
        
        let linkProvider = LinkProvider(metadata: metadata)
        
        let activityViewController = UIActivityViewController(activityItems: [linkProvider], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}


