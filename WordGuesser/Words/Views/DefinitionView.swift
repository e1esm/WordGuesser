//
//  DefinitionView.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 10.11.2023.
//

import Foundation
import SwiftUI


class DefinitionStorage: ObservableObject{
    private var definition: String
    init(){
        definition = ""
    }
    
    init(definition: String){
        self.definition = definition
    }
    
    func SetDefitnition(new: String){
        objectWillChange.send()
        definition = new
    }
    
    func GetDefinition() -> String{
        return definition
    }
}


struct DefinitionView: View{
    @ObservedObject private var definition: DefinitionStorage
    
    
    init(definition: String) {
        self.definition = DefinitionStorage(definition: definition)
    }
    
    init(){
        definition = DefinitionStorage()
    }
    
    var body: some View{
        
        ZStack{
            GeometryReader{ reader in
                RoundedRectangle(cornerRadius: 26)
                    .frame(width: reader.size.width,
                           height: reader.size.height)
                    .foregroundStyle(Color.init(red: 0.26, green: 0.26, blue: 0.26))
                    .overlay(
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(Color.blue.opacity(0.5))
                            .frame(width: reader.size.width * 0.95,
                                   height: reader.size.height * 0.7, alignment: .trailing)
                            .overlay(
                                ZStack{
                                    Circle().frame(width: reader.size.width * 0.3, height: reader.size.height * 0.4).padding(.trailing, reader.size.width * 0.55)
                                        .padding(.top, reader.size.height * 0.55)
                                        .foregroundStyle(Color.init(red: 0.26, green: 0.26, blue: 0.26))
                                        .shadow(radius: 80)
                                    Text(definition.GetDefinition()).scaledToFill().foregroundStyle(Color.white)
                                }
                            )
                    ).scaledToFill()
                
                    
                    .shadow(radius: 80)
            

            }
        }.frame(minWidth: UIScreen.screenWidth * 0.8,
                maxWidth: UIScreen.screenWidth * 0.85,
                minHeight: UIScreen.screenHeight * 0.08,
                maxHeight: UIScreen.screenHeight * 0.1)
        .shadow(radius: 80)
    }
    
    func SetDefinition(new: String){
        definition.SetDefitnition(new: new)
    }

}
