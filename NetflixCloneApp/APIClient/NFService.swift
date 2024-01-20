//
//  Service.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation



protocol NFServiceProtocol {
    func fetchData<T : Codable>(
        request   :String,
        expecting : T.Type,
        onSuccess : @escaping (T) -> Void ,
        onFailure : @escaping (Error) -> Void)
    
    
}



final class NFService : NFServiceProtocol{
    func fetchData<T>(request : String,
                      expecting: T.Type,
                      onSuccess: @escaping (T) -> Void,
                      onFailure: @escaping (Error) -> Void) where T : Decodable, T : Encodable {
        guard let url = URL(string:request) else {return}
       
               let task = URLSession.shared.dataTask(with: url) { data, _ , error in
       
                   guard let data = data , error == nil else {return}
       
                   do{
                       let response = try JSONDecoder().decode(T.self, from: data)
                       onSuccess(response)
                   }
                   catch{
                       onFailure(error)
       
                   }
               }
               task.resume()
    }
    
 
    

    
    
    public static  let shared =  NFService()
    
    private init(){}
    
}
