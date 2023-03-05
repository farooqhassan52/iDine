//
//  CheckOutView.swift
//  iDine
//
//  Created by Farooq Hassan on 3/4/23.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    
    let paymentTypes = ["Cash","Credit/debit Card","iDine Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    let tipAmouts = [10,15,20,25,0]
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    var totalPrice : String {
        let total = Double(order.total)
        let tip = (total / 100) * Double(tipAmount)
        return (total+tip).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes,id: \.self){
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
            }
            
            Section ("Add a Tip?"){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(tipAmouts,id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Total : \(totalPrice)"){
                Button("Confirm Order"){
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed",isPresented: $showingPaymentAlert) {
            //add button you want to show
        } message: {
            Text("Your total was \(totalPrice) - Thank you!")
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject(Order())
    }
}
