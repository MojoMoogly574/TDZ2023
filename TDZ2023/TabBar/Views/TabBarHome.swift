//
//  TabBarHome.swift
//  TDZ2023
//
//  Created by J. DeWeese on 9/19/23.
//

import SwiftUI

struct TabBarHome: View {
   
    /// View Properties
    @State private var activeTab: Tab = .workout
    /// For Smooth Shape Sliding Effect, We're going to use Matched Geometry Effect
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    init() {
        /// Hiding Tab Bar Due To SwiftUI iOS 16.4 Bug
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0 ) {
            TabView(selection: $activeTab) {
                   Text("PostsView")
                    .tag(Tab.feed)
                    /// Hiding Native Tab Bar
                    /// Bug on iOS 16.4
                    // .toolbar(.hidden, for: .tabBar)
                
                Text("Workout")
                    .tag(Tab.workout)
                    /// Hiding Native Tab Bar
                    /// Bug on iOS 16.4
                    // .toolbar(.hidden, for: .tabBar)
                
                Text("Messages")
                    .tag(Tab.messages)
                    /// Hiding Native Tab Bar
                    /// Bug on iOS 16.4
                    // .toolbar(.hidden, for: .tabBar)
                
            }
            
            CustomTabBar()
              
        }
    }
    
    /// Custom Tab Bar
    /// With More Easy Customization
    @ViewBuilder
    func CustomTabBar(_ tint: Color = .colorOrange, _ inactiveTint: Color = .colorBlue) -> some View {
        /// Moving all the Remaining Tab Item's to Bottom
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(.clear)
                .font(.footnote)
                .ignoresSafeArea()
                /// Adding Blur + Shadow
                /// For Shape Smoothening
                .shadow(color: tint.opacity(0.1), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
             //   .padding(.top, 25)
        })
        .padding(.horizontal)
        /// Adding Animation
        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
       
}

/// Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    /// Each Tab Item Position on the Screen
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .primary : inactiveTint)
                /// Increasing Size for the Active Tab
                .frame(width: activeTab == tab ? 45 : 30, height: activeTab == tab ? 45 : 30)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .primary)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            /// Updating Active Tab Position
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.3)) {
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    TabBarHome()
}
