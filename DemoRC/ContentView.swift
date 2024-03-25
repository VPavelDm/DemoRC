//
//  ContentView.swift
//  DemoRC
//
//  Created by Pavel Vaitsikhouski on 23.03.24.
//

import SwiftUI

struct DemoLearnView: View {
    @State private var showCategories = false
    
    var body: some View {
        NavigationStack {
            Button {
                showCategories = true
            } label: {
                Text("Show categories")
            }
            .sheet(isPresented: $showCategories) {
                DemoCategoriesView()
            }
        }
    }
}

struct DemoCategoriesView: View {
    @State private var showDetails = false
    
    var body: some View {
        NavigationStack {
            Button {
                showDetails = true
            } label: {
                Text("Show details")
            }
            .navigationDestination(isPresented: $showDetails) {
                DemoDetailsView()
            }
        }
    }
}

struct DemoDetailsView: View {
    @State private var showNewWord = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            showNewWord = true
        } label: {
            Text("Show new word")
        }
        .navigationDestination(isPresented: $showNewWord) {
            DemoNewWordView(category: DemoWordCategory(name: "Pavel"))
        }
    }
}

@MainActor
final class DemoNewWordViewModel: ObservableObject {
    
    init(category: DemoWordCategory) {
    }
}

struct DemoNewWordView: View {
    
    @Environment(\.dismiss) private var dismiss

    @StateObject var viewModel: DemoNewWordViewModel

    init(category: DemoWordCategory) {
        self._viewModel = StateObject(wrappedValue: DemoNewWordViewModel(category: category))
    }

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Save")
        }
    }
}

struct DemoWordCategory: Identifiable, Hashable, Sendable {
    var id: UUID = UUID()
    var name: String = ""
    
    init(name: String) {
        print("LOG: init")
        self.name = name
    }
}
