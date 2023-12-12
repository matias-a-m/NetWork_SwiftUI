//
//  LocationModel.swift
//  Callbacks_vs_Async_Await
//
//  Created by matias on 11/12/2023.
//

import Foundation


struct LocationModel: Decodable{
    let id: Int
    let name: String
    let dimension: String?
}
