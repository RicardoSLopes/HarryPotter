//
//  ImageViewExtension.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 09/02/22.
//

import UIKit

extension UIImageView {
    func getImageFromURL(_ url: String) {
        guard let url = URL(string: url) else { return }
        print("URL da imagem \(url)")
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if error == nil {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}
