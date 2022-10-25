//
//  TabBarView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 25/10/22.
//

import SwiftUI

enum MainTabBarItem: String, CaseIterable {
    case all
    case wishlist
    case account
}

extension MainTabBarItem: Identifiable {

    var id: UUID { UUID() }

    var title: String { rawValue.camelCaseToSentence }

    var image: UIImage {
        switch self {
        case .all: return UIImage(systemName: "books.vertical.fill")!
        case .wishlist: return UIImage(systemName: "bookmark.fill")!
        case .account: return UIImage(systemName: "person.crop.circle.fill")!
        }
    }
}

struct MainTabBarItemView: View {

    let isSelected: Bool
    let item: MainTabBarItem

    var body: some View {
        Group {
            if isSelected {
                VStack(spacing: 0) {
                    Image(uiImage: item.image)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                .foregroundColor(Color.purple)
            } else {
                VStack(spacing: 0) {
                    Image(uiImage: item.image)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                .foregroundColor(.secondary)
            }
        }
        .frame(width: 84, height: 60, alignment: .center)
        .padding(10)
    }
}


struct MainTabBarView: View {

    @Binding var selectedItem: MainTabBarItem

    var body: some View {
        HStack {
            ForEach(MainTabBarItem.allCases) { item in
                Spacer()
                Button(action: {
                    withAnimation {
                        selectedItem = item
                    }
                }) {
                    MainTabBarItemView(isSelected: item == selectedItem, item: item)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
                    Color(UIColor.systemBackground)
                        .shadow(radius: 5, y: -4)
        )
    }
}
