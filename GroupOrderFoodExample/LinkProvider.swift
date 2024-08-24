//
//  LinkProvider.swift
//  GroupOrderFoodExample
//
//  Created by Sagar Dagdu on 24/08/24.
//

import Foundation
import LinkPresentation

// Helper class to provide the metadata
class LinkProvider: NSObject, UIActivityItemSource {
    let metadata: LPLinkMetadata
    
    init(metadata: LPLinkMetadata) {
        self.metadata = metadata
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return metadata.url!
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return metadata.url!
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return metadata
    }
}
