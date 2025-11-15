import SwiftUI

struct ContentView: View {
    @State private var phoneNumber: String = ""
    @State private var showAlert = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)

                Text("С каким номером телефона хотите войти?")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                TextField("+7 (___) ___-__-__", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)

                Button("Продолжить") {
                    showAlert = true
                }
                .disabled(phoneNumber.count < 10)
                .padding()
                .frame(maxWidth: .infinity)
                .background(phoneNumber.count < 10 ? Color.gray : Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding(.horizontal)

                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Ошибка"),
                  message: Text("Ваше устройство не поддерживается"),
                  dismissButton: .default(Text("Ок")))
        }
    }
}
