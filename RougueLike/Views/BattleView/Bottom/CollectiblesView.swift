//
//  CollectiblesView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct CollectiblesView: View {
    @State var relics: Bool = true
    @State var cards: Bool = false
    @State var stats: Bool = false
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack{
                Text("RELICS")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(relics ? .black : .white)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).opacity(relics ? 1 : 0))
                    .onTapGesture{
                        withAnimation{
                            relics = true
                            cards = false
                            stats = false
                        }
                    }

                Spacer()
                Text("CARDS")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(cards ? .black : .white)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).opacity(cards ? 1 : 0))
                    .onTapGesture{
                        withAnimation{
                            cards = true
                            relics = false
                            stats = false
                        }
                    }
                Spacer()
                Text("STATS")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(stats ? .black : .white)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).opacity(stats ? 1 : 0))
                    .onTapGesture{
                        withAnimation{
                            relics = false
                            cards = false
                            stats = true
                        }
                    }
            }
            .padding()
            .background(Color.blue)
            
            if relics{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< 12) { item in
                        Image("1")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                }
            }else if cards{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< 12) { item in
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                }
            }else if stats{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< 12) { item in
                        Image("3")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                }
            }
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height - 200)
    }
}

struct CollectiblesView_Previews: PreviewProvider {
    static var previews: some View {
        CollectiblesView()
    }
}
