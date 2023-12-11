//
//  Manager.swift
//  HTTPS_request
//
//  Created by matias on 11/12/2023.
//

import Foundation
import SwiftUI

class Manager: ObservableObject{
    func customProgressView() -> some View {
        return ProgressView("Obteniendo lista")
            .font(.title3)
            .progressViewStyle(CircularProgressViewStyle())
    }
}
