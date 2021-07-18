//
//  Car.swift
//  ListNavigationViewStudy
//
//  Created by 홍희표 on 2021/07/18.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    
    var name: String
    
    var description: String
    
    var isHybrid: Bool
    
    var imageName: String
}
