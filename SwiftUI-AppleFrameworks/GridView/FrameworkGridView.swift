//
//  FrameworkGridView.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Amr Fawaz on 19/09/2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
    
    @StateObject var viewModel = FrameworkGridViewModel()
    var body: some View {
        NavigationView{
            ScrollView {
                
                Picker("List Style", selection: $viewModel.isListStyleSelected) {
                    Text("Grid").tag(0)
                    Text("List").tag(1)
                }
                .pickerStyle(.segmented)
                .onChange(of: viewModel.isListStyleSelected) { newValue in
                    print("Selected segment changed to \(newValue)")
                    viewModel.isListStyleSelected = newValue
                }

                .padding()
                
                if viewModel.isListStyleSelected == 1 {
                    LazyVStack(alignment: .leading, content: {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkListItemView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    })
                } else {
                    LazyVGrid(columns: viewModel.columns, content: {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkItemView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    })
                }

            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
        
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}



