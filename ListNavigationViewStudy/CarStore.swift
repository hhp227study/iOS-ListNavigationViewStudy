//
//  CarStore.swift
//  ListNavigationViewStudy
//
//  Created by 홍희표 on 2021/07/18.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
