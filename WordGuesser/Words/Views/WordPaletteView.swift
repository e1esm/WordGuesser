//
//  WordPalette.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation
import SwiftUI

private let columnAmount = 2

struct WordPaletteView: View{
    @ObservedObject private var WordsPicker: WordsPickerViewModel
    @ObservedObject private var progressViewModel: ProgressViewModel
    
    private var columns: [GridItem]
    
    init(progressViewModel: ProgressViewModel) {
        WordsPicker = WordsPickerViewModel()
        columns = []
        for _ in 0..<2{
            columns.append(GridItem(.flexible()))
        }
        self.progressViewModel = progressViewModel
    }
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .foregroundStyle(Color.init(red: 0.26, green: 0.26, blue: 0.26))
                .shadow(radius: 80)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<WordsPicker.words.count, id: \.self) { index in
                    let item = WordsPicker.words[index]
                    Button(item.word, action:{
                        let wordToBeChosen = UserDefaults.standard.string(forKey: "curr_word") ?? ""
                        if(item.word == wordToBeChosen){
                            progressViewModel.UpdateProgress(1)
                        }
                    }).buttonStyle(WordPickerButton())
                        .onTapGesture {
                        }
                }
            }.scaledToFill()
            
        }
        .frame(minWidth: UIScreen.screenWidth * 0.65,
               maxWidth: UIScreen.screenWidth * 0.8,
               minHeight: UIScreen.screenHeight * 0.25,
               maxHeight: UIScreen.screenHeight * 0.25)
    }
    
    
    func GetPaletteWords() -> [String]{
        
        return WordsPicker.GetWords()
    }
    
    func GetProgressViewModel() -> ProgressViewModel{
        return progressViewModel
    }
}
