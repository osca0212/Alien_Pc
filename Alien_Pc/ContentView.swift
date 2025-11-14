//
//  Alien_Pc.swift
//  TuProyecto
//
//  Created by Oscar on 11/14/25.
//

import SwiftUI

struct Alien_Pc: View {

    @State private var selected = 0

    let folders = [
        "PERSONAL",
        "INVESTIGACIÓN",
        "SISTEMA",
        "ADVERTENCIAS"
    ]

    var title: String {
        switch selected {
        case 0: return "REGISTRO PERSONAL"
        case 1: return "ARCHIVOS DE INVESTIGACIÓN"
        case 2: return "ESTADO DEL SISTEMA"
        case 3: return "PROTOCOLOS DE EMERGENCIA"
        default: return "TERMINAL"
        }
    }

    var message: String {
        switch selected {
        case 0:
            return """
NOMBRE: Usuario No. 042
ACCESO: Nivel 2

Notas: El usuario ha iniciado sesión en la terminal principal.
Registros recientes indican actividad anómala en sectores restringidos.
"""
        case 1:
            return """
Proyecto: Análisis de forma de vida no identificada.
Estado: Peligro extremo.

Propiedades:
- Sangre altamente corrosiva.
- Movilidad silenciosa.
- Hostil sin patrón predecible.
"""
        case 2:
            return """
SISTEMA CENTRAL: Operativo
LUZ AUXILIAR: 34%
PUERTAS SELLADAS: 2 / 5
SENSORES: INESTABLES

Advertencia: La estación presenta fallas críticas.
"""
        case 3:
            return """
PROTOCOLO DE SUPERVIVENCIA:

1. Mantén silencio absoluto.
2. Evita los ductos activos.
3. No intentes confrontar a la criatura.
4. Busca rutas alternativas.
"""
        default:
            return "Acceso no disponible."
        }
    }

    var body: some View {
        ZStack {
            // Fondo oscuro verde sci-fi
            Color(red: 0.02, green: 0.10, blue: 0.06)
                .ignoresSafeArea()

            HStack(spacing: 20) {

                // -----------------------------
                //   PANEL LATERAL
                // -----------------------------
                VStack(alignment: .leading, spacing: 14) {

                    Text("TERMINAL - ACCESO LOCAL")
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                        .foregroundColor(.green.opacity(0.8))
                        .padding(.bottom, 10)

                    ForEach(folders.indices, id: \.self) { i in
                        Button {
                            selected = i
                        } label: {
                            HStack {
                                Text(folders[i])
                                    .font(.system(size: 16, weight: .medium, design: .monospaced))
                                    .foregroundColor(.green)

                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.green.opacity(i == selected ? 0.5 : 0.15), lineWidth: 1)
                                    .background(
                                        i == selected ?
                                        Color.green.opacity(0.10) :
                                        Color.clear
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    Spacer()
                }
                .frame(width: 200)
                .padding(.leading, 10)
                .padding(.vertical, 20)

                // -----------------------------------
                //       PANEL DE INFORMACIÓN
                // -----------------------------------
                VStack(alignment: .leading, spacing: 20) {

                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(.green.opacity(0.9))

                    ScrollView {
                        Text(message)
                            .font(.system(size: 16, design: .monospaced))
                            .foregroundColor(.green.opacity(0.85))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.green.opacity(0.2), lineWidth: 1)
                                    .background(Color.green.opacity(0.05))
                            )
                    }

                    Spacer()
                }
                .padding(.vertical, 20)
                .padding(.trailing, 20)
            }
            .padding(10)
        }
    }
}

struct Alien_Pc_Previews: PreviewProvider {
    static var previews: some View {
        Alien_Pc()
            .preferredColorScheme(.dark)
    }
}
