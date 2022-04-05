//
//  EditPointSheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct EditPointSheetView: View {
    // SHOW SHEET BINDING
    @Binding var showSheetView: Bool;
    
    // VARIABLES
    @State var nama: String;
    @State var selectedColorKey: Int;
    @State var selectedIcon: String;
    
    // SAVE PAGE INFORMATION TO USER DEFAULTS
    func saveProfile() {
        UserDefaults.standard.set(nama, forKey: "UserName");
        UserDefaults.standard.set(selectedColorKey, forKey: "UserColorKey")
        UserDefaults.standard.set(selectedIcon, forKey: "UserIcon")
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
                    
                    Section("Pilih icon untuk profil") {
                        VStack(alignment: .center) {
                            HStack(alignment: .center) {
                                IconPickerView(selectedIcon: $selectedIcon)
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
