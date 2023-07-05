//
//  DateTitle.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 6/30/23.
//

import SwiftUI

struct DateTitle: View {
    var title : AttributedString
    @State private var date: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(date.uppercased())
                .font(.footnote)
                .fontWeight(.medium)
                .opacity(0.7)
            
            Text(title)
                .font(.largeTitle).bold()
                .accessibilityAddTraits([.isHeader])
        }.onAppear{
            date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
        }
    }
}

struct DateTitle_Previews: PreviewProvider {
    static var previews: some View {
        var attributedString: AttributedString {
            var subject = AttributedString("SwiftUI")

            var container = AttributeContainer()
            container.foregroundColor = .purple
            subject.mergeAttributes(container)

            return "Learn " + subject
        }
        DateTitle(title: attributedString)
    }
}
