//
//  ProgressViewModel.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 12.11.2023.
//

import Foundation


class ProgressViewModel: ObservableObject{
    @Published var Progress: Int
    
    init(Progress: Int){
        self.Progress = Progress
    }
    init(){
        self.Progress = 0
    }
    
    
    public func UpdateProgress(_ n: Int){
        self.Progress += n
        print(self.Progress)
        self.objectWillChange.send()
    }
    
    public func GetProgress() -> Int{
        return self.Progress
    }
}
