//
//  ContentView.swift
//  CustomTabBar
//
//  Created by François-Xavier on 03/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var selectedTab: TabItem = .home
    @Namespace private var animationNamespace
    let baseColor: Color = Color(UIColor.systemGray6)
    
    // Hide the default tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            // TabView to manage different views for each tab
            TabView(selection: $selectedTab) {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    VStack {
                        Text(tab.title)
                            .tag(tab)
                        // The modifier ".toolbar(.hidden, for: .tabBar)" doesn't work properly, causing it to reappear and pushing the view up. Use a UIKit method to fix it.
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(baseColor)
                }
            }
            
            // Custom tab bar
            CustomTabBar(
                selectedTab: $selectedTab,
                animationNamespace: animationNamespace,
                baseColor: baseColor
            )
        }
        .background(baseColor)
        .padding(5)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

// MARK: - Custom tab bar
struct CustomTabBar: View {
    
    // MARK: - Properties
    @Binding var selectedTab: TabItem
    var animationNamespace: Namespace.ID
    let baseColor: Color
    
    var body: some View {
        HStack(spacing: 50) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.interactiveSpring(
                        response: 0.4,
                        dampingFraction: 0.8,
                        blendDuration: 0.4
                    )) {
                        selectedTab = tab
                    }
                } label: {
                    if selectedTab == tab {
                        SelectedTabBarLabel(
                            tab: tab,
                            baseColor: baseColor,
                            animationNamespace: animationNamespace
                        )
                    } else {
                        UnSelectedTabBarLabel(tab: tab)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .padding(.horizontal)
        .innerNeumorphism(baseColor: baseColor, shape: Capsule())
        .padding(.horizontal)
        .padding(.bottom)
    }
}

//MARK: - SelectedTabBarLabel
struct SelectedTabBarLabel: View {
    var tab: TabItem
    var baseColor: Color
    var animationNamespace: Namespace.ID
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.image)
                .font(.title3)
            Text(tab.title)
                .font(.caption2)
            
        }
        .foregroundStyle(.blue)
        .background(
            Capsule()
                .foregroundStyle(.gray.opacity(0.1))
                .frame(width: 80,height: 50)
                .flatNeumorphism(baseColor: baseColor, shape: Capsule())
                .matchedGeometryEffect(id: "selectionTab", in: animationNamespace)
        )
    }
}

//MARK: - UnSelectedTabBarLabel
struct UnSelectedTabBarLabel: View {
    var tab: TabItem
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.image)
                .font(.title3)
            Text(tab.title)
                .font(.caption2)
            
        }
        .foregroundStyle(.gray)
    }
}
