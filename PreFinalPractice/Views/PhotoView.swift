//
//  PhotoView.swift
//  PreFinalPractice
//
//  Created by Dylan Jackson on 4/24/23.
//

import SwiftUI
import SafariServices

struct PhotoView: View {
    @State private var photos:[Photo] = []
    @State private var isShowingSafariView = false
    var body: some View {
        List(photos, id:\.title) { photo in
            Button(photo.title) {
                isShowingSafariView = true
            }
            .padding()
            .sheet(isPresented: $isShowingSafariView) {
                SafariView(url: URL(string: photo.url)!)
            }
        }.onAppear(perform: fetch)
    }
    
    struct SafariView: UIViewControllerRepresentable {
        let url: URL
        
        func makeUIViewController(context: Context) -> SFSafariViewController {
            let safariViewController = SFSafariViewController(url: url)
            return safariViewController
        }
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
            // nothing goes here
        }
    }
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    self.photos = try decoder.decode([Photo].self, from: data)
                } catch {
                    print("Failed to decode JSON \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}



struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
