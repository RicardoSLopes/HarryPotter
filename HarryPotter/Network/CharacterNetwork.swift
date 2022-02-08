//
//  CharacterNetwork.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 08/02/22.
//

import Foundation

class CharacterNetwork: Network {
    
    func getCharacter(completion: @escaping ([Character]?) -> Void) {
        guard var url = URL(string: baseURL) else { return }
        url.appendPathComponent(characterEndPoint)
        
        print("URL 🔗: \(url)")
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response,  error in
            guard let data = data else { return }
            guard let statusCode = response as? HTTPURLResponse else { return }
            let decoder = JSONDecoder()
            
            if let error = error {
                print("Error: Request Failed status \(statusCode.statusCode): \(error.localizedDescription)")
            } else {
                if statusCode.statusCode == 200 {
                    do {
                        let harryPotterCharacters = try decoder.decode([Character].self, from: data)
                        completion(harryPotterCharacters)
                    } catch {
                        print("Error Decoding Data: \(error) \(error.localizedDescription)")
                        completion(nil)
                    }
                }
            }
        }
    }
}
