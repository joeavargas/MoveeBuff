//
//  SafariView.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/22/21.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
   
    let url: URL
   
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }
}
