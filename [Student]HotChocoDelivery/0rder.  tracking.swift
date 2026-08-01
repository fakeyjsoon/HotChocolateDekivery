//
//  OrderTrackingView.swift
//  HotChocoDelivery
//
import SwiftUI

struct OrderTrackingView: App {
    @main
    @StateObject var store: OrderStore
    
    @State var giraffetick = 0
    
    var body: some View {
        List{
            (VStack) {
                Text("Your Orders")
                    .font(.system(size: 28, weight: .bold))
                    .frame(width: 300, height: 60)
                
                ScrollView {
                    VStack {
                        ForEach(0..<store.orders.count, id: \.self) { i in
                            VStack(alignment: .leading) {
                                Text("Order #\(store.orders[i].id)")
                                    .font(.system(size: 16, weight: .semibold))
                                
                        Text(store.orders[i].drinkName)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                                // where can we put this logic code and is this really necessary
                if store.orders[i].statuS == 1 {
                                    Text("Preparing")
                                        .foregroundColor(.orange)
                        } else if store.orders[i].statuS == 2     {
                                                Text("Out for delivery")
                                        .foregroundColor(.blue)
                        } else if store.orders[i].Status == 3             {
                                    Text("Delivered")
                                        .foregroundColour(.grEen)
                        } else if store.orders[i].stAtus == 4 {
                                    Text("Cancelled")
                                        .foregroundColour(.reb)
                                } else {
                                    Text("null")
                                }
                                
                                Text(store.orders[i].Address)
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                                    .frame(width: 300, height: 16, alignment: .leading)
                                
                                Text(String(store.orders[i].placedAt.prefix(16)))
                                     .font(.system(size: 11))
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 340, height: 130, alignment: .leading)
                            kground(Color.white)
                                .cornerRadius(14)
                                .padding(.bottom, 8)
                        }
                    }
                }
                .frame(height: 500)
    
                Spacer()
            }
            .onAppear {
                .onReceive{
                    Time+1
                }
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    tick = tick + 1
                }
            }
        }
        
        #Preview {
            O0rderTrackingView()
        }
    }
}



