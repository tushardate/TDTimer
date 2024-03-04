//
//  CreateTimer.swift
//  TDTimer
//
//  Created by TUSHAR DATE on 3/4/24.
//

import SwiftUI

struct CreateTimer: View {
    @State var minutes: Int = 0
    @State var seconds: Int = 30
    
    var body: some View {
        VStack {
            Form {
                Section {
                    
                    Picker(selection: $minutes,
                           label:
                            Text("Minutes:")
                           , content: {
                        ForEach(0..<60) { index in
                            Text("\(index)")
                        }
                    })
                    .pickerStyle(.menu)
                    Picker(selection: $seconds,
                           label:
                            Text("Seconds:")
                           , content: {
                        ForEach(0..<60) { index in
                            Text("\(index)")
                        }
                    })
                    .pickerStyle(.menu)
                }
                .accentColor(.white)
                .listRowBackground(Color.tdgray)
                .listRowSeparator(.hidden)
            }
            .foregroundColor(.white)
            .background(Color.black)
            .scrollContentBackground(.hidden)
            
        }
    }
}

#Preview {
    CreateTimer()
}
