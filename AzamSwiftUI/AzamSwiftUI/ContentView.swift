//
//  ContentView.swift
//  AzamSwiftUI
//
//  Created by Morse on 11/16/22.
//

import SwiftUI

struct LightBulb: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .onTapGesture {
                    isOn.toggle()
                }
        }
    }
}

struct RoomView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            LightBulb(isOn: $isOn)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                isOn ? Color.white : Color.black
            }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
