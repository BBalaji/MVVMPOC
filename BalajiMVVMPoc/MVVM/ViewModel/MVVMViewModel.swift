//
//  MVVMViewModel.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation

struct MVVMRowViewModel {
    let image: String?
    let title: String?
    let description: String?
    
    init(_ mvvmrowsModel: RowModel) {
        title = mvvmrowsModel.title ?? " "
        image = mvvmrowsModel.imageHref
        description = mvvmrowsModel.rowDescription ?? " "
        
    }
}


