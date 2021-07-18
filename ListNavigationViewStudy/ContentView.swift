//
//  ContentView.swift
//  ListNavigationViewStudy
//
//  Created by 홍희표 on 2021/07/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore = CarStore(cars: carData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(carStore.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems(at:))
                .onMove(perform: moveItems(from:to:))
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(
                destination: AddNewCar(carStore: self.carStore)) {
                Text("Add").foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    func deleteItems(at indexSet: IndexSet) {
        carStore.cars.remove(atOffsets: indexSet)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        NavigationLink(
            destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
