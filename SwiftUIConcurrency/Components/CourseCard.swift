//
//  CourseCard.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 6/30/23.
//

import SwiftUI

struct CourseCard: View {
    var course: Course

    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: course.illustration)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 128, alignment: .center)
                    .cornerRadius(10)

            } placeholder: {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(.gray.opacity(0.2))
            }

            Spacer()

            Text(course.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)

            Text("\(course.numberOfSections) sections - \(course.numberOfHours) hours")
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)

        }
        .padding(16)
        .frame(height: 217, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: course.colors.first!!), Color.init(hex: course.colors.last!!)]), startPoint: .top, endPoint: .bottomLeading)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    .blendMode(.overlay))
        .shadow(color: .blue.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(course: coursePreviewData)
    }
}
