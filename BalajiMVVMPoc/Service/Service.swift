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
    MVVMContactModel(image: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg", title: "Tamilarasi Mohan", description: "Architect"),
    MVVMContactModel(image: "apple", title: "Kim Yu", description: "Economist"),
    MVVMContactModel(image: "apple", title: "Shreya Nithin", description: "Web Strategist"),
    MVVMContactModel(image: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg", title: "Emily Adams", description: "Product Designer")
    
    
]
