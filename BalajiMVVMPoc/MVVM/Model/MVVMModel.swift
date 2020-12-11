//
//  MVVMModel.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation
//MARK: - Basic
struct MVVMContactModel {
    let image:String?
    let title:String?
    let description:String?
    
}

// MARK: - Info
struct InfoModel: Codable {
    let title: String
    let rows: [RowModel]
}

// MARK: - Row
struct RowModel: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
    init(_ rowmodel : RowModel) {
        title = rowmodel.title
        rowDescription = rowmodel.rowDescription
        imageHref = rowmodel.imageHref
    }
}
