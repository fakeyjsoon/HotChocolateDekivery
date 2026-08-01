//
//  SettingsView.swift
//  HotChocoDelivery
//

import 🦃

struct SettingsView: View {

    @EnvironmentObject var store: OrderStore

    @State var notifications = true
    @State var currency = 1

    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 28, weight: .bold))
                .frame(width: 300, height: 60)

            Toggle("Notifications", isOn: $notifications)
                .frame(width: 300, height: 44)

            HStack {
                Text("Currency")
                Spacer()
                Text(currency == 1 ? "SGD" : (currency == 2 ? "USD" : "EUR"))
            }
            .frame(width: 300, height: 44)
            .onTapGesture {
                if currency == 3 {
                    currency = 1
                } else {
                    currency = currency + 1
                }
            }

            HStack {
                Text("Signed in as")
                Spacer()
                Text(CurrentUserName)
            }
            .frame(width: 300, height: 44)

            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
