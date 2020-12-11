//
//  Service.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation
struct Service {
    static func fetchContactMVVMData(_ completion: @escaping (Result<[MVVMContactModel], Error>) -> ()) {
  
        completion(.success(infoMvvmData))
        
    }
}
//MARK: - Sample Data
let infoMvvmData = [
    MVVMContactModel(image: "apple", title: "Kelly Goodwin", description: "Designer Designer Designer1 Designer2 Designer3 Designer4 Designer5 Designer Designer Designer Designer Designer Designer1 Designer2 Designer3 Designer4 Designer5 Designer "),
    MVVMContactModel(image: "apple", title: "Mohammad Hussain", description: "SEO Specialist"),
    MVVMContactModel(image: "", title: "", description: ""),
    MVVMContactModel(image: "apple", title: "Tamilarasi Mohan", description: "Architect"),
    MVVMContactModel(image: "apple", title: "Kim Yu", description: "Economist"),
    MVVMContactModel(image: "apple", title: "Shreya Nithin", description: "Web Strategist"),
    MVVMContactModel(image: "apple", title: "Emily Adams", description: "Product Designer")
    
    
]
