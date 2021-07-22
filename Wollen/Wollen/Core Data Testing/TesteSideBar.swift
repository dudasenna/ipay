//
//  TesteSideBa.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 21/07/21.
//

import SwiftUI

struct TesteSideBar: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

        var body: some View {
            NavigationView {
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: delete)
                }
                .toolbar {
                    EditButton()
                }
            }
        }

        func delete(at offsets: IndexSet) {
            users.remove(atOffsets: offsets)
        }
}

struct TesteSideBa_Previews: PreviewProvider {
    static var previews: some View {
        TesteSideBar()
    }
}
