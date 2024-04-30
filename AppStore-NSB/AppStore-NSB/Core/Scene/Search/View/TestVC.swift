//
//  TestVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 17.04.2024.
//



import UIKit

final class TestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
    }
    
    private func getUserData() {
        SearchNetwork.shared.fetchData(term: "Instagram") { result in
            switch result {
            case .success(let data):
                // Başarılı durumda kullanıcı verilerini işle
                DispatchQueue.main.async {
                    // Kullanıcı verilerini işleme ve kullanıcı arayüzünü güncelleme işlemleri burada yapılır
                    self.updateUI(with: data.results)
                }
            case .failure(let error):
                // Hata durumunda kullanıcıya bilgi ver
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateUI(with datas: [Result]) {
        // Kullanıcı verilerini kullanıcı arayüzünde göstermek için uygun işlemleri burada gerçekleştir
        for data in datas {
            print("Name: \(datas), Email: \(data)")
            print("Name: \(datas.count), Email: \(data.trackName)")
        }
    }
}

