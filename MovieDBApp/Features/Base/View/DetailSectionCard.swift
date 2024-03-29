//
//  DetailSectionCard.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import SwiftUI

struct DetailSectionCard: View {
    let section: DetailViewSection
    let namespace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    
    var body: some View {
        Text(section.rawValue)
            .poppins(.medium, 16)
            .background(
                ZStack {
                    if section == selectedSection {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "DetailSectionCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

struct DetailSectionCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailSectionCard(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
    }
}
//#Preview {
//    DetailSectionCard()
//}
