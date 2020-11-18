//
//  ContentView.swift
//  slotApp
//
//  Created by Cezary Michalak on 02/09/2020.
//  Copyright © 2020 Cezary Michalak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple","cherry","star"]
    
    @State private var numbers = [0,0,0]
    
    @State private var credits = 1000
    
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            Rectangle()
            .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(.init(degrees: 75))
            
            VStack{
                HStack{
                    Image(systemName: "star.fill")
                    .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                    Text("Figurki")
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                    .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                }
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Text("Punkty: " + String(self.credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5).cornerRadius(20))
                    
                HStack{
                    
                    CardView(symbol: $symbols[numbers[0]],
                    background: $backgrounds[0])
                    
                   CardView(symbol: $symbols[numbers[1]],
                   background: $backgrounds[1])
                    
                   CardView(symbol: $symbols[numbers[2]],
                   background: $backgrounds[2])
                    
                 
                    
                }
                
                Spacer()

                Button(action: {
                    
                    self.numbers[0] = Int .random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int .random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int .random(in: 0...self.symbols.count - 1)
                    
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                        
                        self.credits += self.betAmount
                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green
                    }
                    else{
                        self.credits -= self.betAmount
                        self.backgrounds[0] = Color.white
                        self.backgrounds[1] = Color.white
                        self.backgrounds[2] = Color.white
                        
                    }
                    
                    
                })
                {Text("Losuj")
                    .bold()
                    .foregroundColor(.white)
                    
                    
                    .background(Color(.systemPink).cornerRadius(15).padding(.horizontal, -5)).scaleEffect(2)
                    
                }
                Spacer()

                
                
            }
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
