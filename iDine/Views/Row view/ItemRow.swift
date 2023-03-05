//
//  ItemRow.swift
//  iDine
//
//  Created by Farooq Hassan on 3/4/23.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem
    let color : [String:Color] = ["D":.purple,"G":.black,"N":.red,"S":.blue, "V":.green]
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray,lineWidth: 2))
            VStack(alignment: .leading, content:{
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            })
            Spacer()
            //in center of row 
            ForEach(item.restrictions , id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(color[restriction,default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                   
            }
        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
