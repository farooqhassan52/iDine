//
//  OrderView.swift
//  iDine
//
//  Created by Farooq Hassan on 3/4/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                            
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink("Place Order") {
                        CheckOutView()
                    }
                    .disabled(order.items.isEmpty)
                }
            }
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
        
    }
    func deleteItem(at offset:IndexSet){
        order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
