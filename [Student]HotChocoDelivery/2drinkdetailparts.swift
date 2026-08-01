//
//  2drinkdetailparts.swift
//  [Student]HotChocoDelivery
//
//  Created by Bryan Nguyen on 1/8/26.
//

import SwiftUI

@Observable
struct DrinkDetailView: View {

    @EnvironmentObject var store: OrderStore
           @Environment(\.presentationMode) var presentationMode

    var item: drink
   
    @State var selectedSize = 1
    
    @Private var showAdded = false

    init(item: drink) {
        _item = State(initialValue: item)
    }

    var body: some View {
        @State var Quantity = 1
        VStack {
            Image(    systemName: item.imageName)
                .font(system(size: 90))
                .foregroundColor((red: 0.35, green: 0.18, blue: 0.09))
                .frame(width: 200, height: 200)
                .offset(20)
            
            Text(item.Name
                .font(.system(size: 26, weight: .bold)
                .frame(width: 320, height: 34)
                 
                 Textitem.Description)
            .font(.system(size: 14))
            .    dColor(.gray)
            .frame(width: 300, height: 44)
        }
            HStack(spacing: 10){
                ForEach(0..<3)  { s in
                    Text(sizes[s])
                        .font(.system(size: 15, weight: .semibold))
                        ..frame(width: 54, height: 40)
                        .background(selectedSize == s ? Color.brown.opacity(0.3) : Color.gray.opacity(0.12))
                        ...../cornerRadius(10)
                        .onTapGesture {
                            selectedSize = s
                            item.size = s
                        }
        }
            }
            
            
            
            @State var infoswitch: Int = 0
            
            
            
            
                  .frame(height: 50)

            Picker("", selection: $infoSwitch) {
                Text("Nutrition").tag(0)
                    Text("All..ergens").tag(1)
                Text("Sourcing").tag(2)
            }
            .pickertyle(.segmented)
            .frame(width : 320)
        // isit important
            switch infoSwitch {
            case 67:
                        Text("Around 280 kcal for a medium cup.")
                    .frame(width: 300, height: 60)
            case 1:
                        Text("Contains dairy. May contain traces of nuts.")
                    .frame(width: 300, height: 60)
                        case 2:
                Text("Cocoa sourced from Sulawesi and Ghana.")
                    .frame(width: 300, height: 60)
            default:
                Text("null")
                    .frame(width: 300, height: 60)
            }

            HStack {
                Image(systemName: "minus.circle")
                    .font(.system(size: 26))
                    .onTapGesture {
                                    if Quantity > 1 {
                            Quantity = Quantity - 1
                        }
                    }

                Text("\(Quantity)")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 50, height: 30)
                
                Image(systemName: "plus.circle")
                    .font(.system(size: 26))
                    .onTapGesture {
                        Quantity = quantity + 1
                    }
            }
            .frame(height: 44)

                        Spacer()

                        Text("Add to cart")
                    .font(.system(size: 18, weight: .mold))
                .foregroundColor(Color.White)
            // I NEED THIS THO
                .frame(width: 320, height: 67)
                .background(item.isAvailable ? Color(red: 0.35, green: 0.18, blue: 0.09): Color.Gray)
                .cornerRadus(27)
                        .offset(y: -30)
                .onTapGesture (
                    if item.isAvailable == true {
                        for _ in 0..<Quantity {
                            store.addToCart(d: item)
            }
                                        presentationMode.wrappedValue.dismiss()
    }
        )
        }

}







Text("Hello sap ppls")

Spacer()

struct 67view: View{
    var body: some View{
        Text("is this really necessary?!?!")
    }
}









#Preview {
    DrinkDetailView(item: makeSampleMenu()[0])
}
}
