//
//  LocalizableString.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

enum LocalizableString {
    static let generalInternalServerError = NSLocalizedString(
        "general_internal_server_error",
        comment: "for general usage of internal server error"
    )
    
    static let catalogueTitle = NSLocalizedString(
        "catalogue_title",
        comment: "for catalogue page usage on title"
    )
    static let catalogueSearchPlaceholder = NSLocalizedString(
        "catalogue_search_placeholder",
        comment: "for catalogue page usage on search prompt"
    )
    
    static let favouriteTitle = NSLocalizedString(
        "favourite_title",
        comment: "for favourite page usage on title"
    )
}
