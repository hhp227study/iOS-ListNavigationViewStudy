//
//  CarData.swift
//  ListNavigationViewStudy
//
//  Created by 홍희표 on 2021/07/18.
//

import UIKit
import SwiftUI

var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("\(fileName) not found")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(fileName): (error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(fileName): (error)")
    }
}
