//
//  EditPointSheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct EditPointSheetView: View {
    @Binding var showSheetView: Bool;
    
    @State var isChanged: Bool = false;
    
    @State var nama: String;
    @State var selectedColorKey: Int;
    
    func saveProfile() {
        UserDefaults.standard.set(nama, forKey: "UserName");
        UserDefaults.standard.set(selectedColorKey, forKey: "UserColorKey")
    }
   
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField(
                            "Masukkan nama",
                            text: $nama
                        ).modifier(TextClearField(text: $nama))
                    }
                    
                    Section("Pilih warna untuk profil") {
                        VStack(alignment: .center) {
                            HStack(alignment: .center) {
                                ColorPickerView(selectedColorKey: $selectedColorKey)
                            }
                        }
                        .padding(.vertical, 2.0)
                        
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("Ubah Profil"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveProfile()
                        showSheetView = false;
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheetView = false;
                    }
                }
            }
        }
    }
}

//struct EditPointSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPointSheetView()
//    }
//}