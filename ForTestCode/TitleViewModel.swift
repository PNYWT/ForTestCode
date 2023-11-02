//
//  TitleViewModel.swift
//  ForTestCode
//
//  Created by Dev on 2/11/2566 BE.
//

import Foundation

class LoadData{
    
    static func readJsonTitle(completeReadHeader:@escaping(_ dataMenu:[TypeModel]?)->Void) -> Void {
        do {
            
            if let bundlePath = Bundle.main.path(forResource: "jsonTitle",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
    
                
                let jsonModel = try JSONDecoder().decode(DataModel.self,
                                                           from: jsonData)
                if let dataDecoder = jsonModel.arrData{
                    completeReadHeader(dataDecoder)
                }
            }
        } catch {
            completeReadHeader(nil)
            print("Error decoding JSON: \(error)")
        }
    }
}
