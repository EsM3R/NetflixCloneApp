//
//  Service.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation



protocol ServiceProtocol {
    func fetchNewsAndHotMovies(
        onSuccess : @escaping (NFResponseNewAndHotMovie) -> Void ,
        onFailure : @escaping (Error) -> Void)
}



final class Service : ServiceProtocol{
    func fetchNewsAndHotMovies(onSuccess: @escaping (NFResponseNewAndHotMovie) -> Void, 
                               onFailure: @escaping (Error) -> Void) {
      
        guard let url = URL(string: ServicePath.NEWSANDHOTS.withBaseUrl()) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            
            guard let data = data , error == nil else {return}
            
            do{
                let response = try JSONDecoder().decode(NFResponseNewAndHotMovie.self, from: data)
                print(response)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    

    
    
    public static let shared =  Service()
    
    private init(){}
    

    

}
