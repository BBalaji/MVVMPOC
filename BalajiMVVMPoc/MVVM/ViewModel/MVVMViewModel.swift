//
//  MVVMViewModel.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation
struct MVVMViewModel {
    let image: String?
    let title: String?
    let description: String?
    
    init(_ mvvmModel: MVVMContactModel) {
        title = mvvmModel.title
        image = mvvmModel.image
        description = mvvmModel.description
        
    }
}

