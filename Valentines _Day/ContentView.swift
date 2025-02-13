//
//  ContentView.swift
//  Valentines_Day
//
//  Created by Karla Gallegos on 12/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonSize: CGFloat = 15
    @State private var isAlertShowing: Bool = false
    @State private var viewID = UUID() // Identificador para reiniciar la vista
    
    var body: some View {
        ZStack {
            // Fondo de color
            Color.pink.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Text("¿Quieres ser mi San Valentín?")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                
                Image("mouse")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                HStack {
                    Button(action: {
                        isAlertShowing = true
                    }, label: {
                        Text("Sí")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: buttonSize*2))
                            .padding()
                            .frame(minWidth: 80)
                            .background(Color.green)
                            .clipShape(Capsule())
                    })
                    
                    Button(action: {
                        updateButtonSize()
                    }, label: {
                        Text("No")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .padding()
                            .frame(minWidth: 80)
                            .background(Color.red)
                            .clipShape(Capsule())
                    })
                }
                .padding()
            }
        }
        .id(viewID) // Agregar ID para forzar la reconstrucción
        .alert("Gano el amor", isPresented: $isAlertShowing) {
            Button("OK") { restartApp() }
        } message: {
            Text("Te amo ❤️")
        }
    }
    
    func updateButtonSize() {
        buttonSize += 5
    }
    
    func restartApp() {
        viewID = UUID() // Cambiar el ID fuerza la reconstrucción de la vista
        buttonSize = 15 // Reiniciar el tamaño del botón
    }
}

#Preview {
    ContentView()
}
