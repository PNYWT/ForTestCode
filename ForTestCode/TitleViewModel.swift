//
//  TitleViewModel.swift
//  ForTestCode
//
//  Created by Dev on 2/11/2566 BE.
//

import Foundation

class LoadData{
    
    static func readJsonTitle(completeReadData:@escaping(_ dataMenu:[TypeModel]?)->Void , updateUI: @escaping ((_ canUpdate:Bool) -> Void)) {
        DispatchQueue.global(qos: .background).async {
            do {
                if let bundlePath = Bundle.main.path(forResource: "jsonTitle", ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    let jsonModel = try JSONDecoder().decode(DataModel.self, from: jsonData)
                    if let dataDecoder = jsonModel.arrData {
                        DispatchQueue.main.async {
                            completeReadData(dataDecoder)
                        }
                    }
                }
                DispatchQueue.main.async {
                    updateUI(true)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                DispatchQueue.main.async {
                    completeReadData(nil)
                    updateUI(false)
                }
            }
        }
    }
}
