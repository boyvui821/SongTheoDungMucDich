//
//  ContentModel.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/20/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import Foundation

class ContentModel{
    var NDCode: String!
    var NDName: String!
    var NDContent:String!
    var NDDiemDeNho:String!
    var NDCauGoc:String!
    var NDSuyGam:String!
    init(ndcode:String!,ndname:String!, ndcontent:String!, nddiemdenho:String!, ndcaugoc:String!, ndsuygam:String!) {
        self.NDCode = ndcode;
        self.NDName = ndname;
        self.NDContent = ndcontent;
        self.NDDiemDeNho = nddiemdenho;
        self.NDCauGoc = ndcaugoc;
        self.NDSuyGam = ndsuygam;
    }
}
