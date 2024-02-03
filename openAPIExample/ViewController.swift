//
//  ViewController.swift
//  openAPIExample
//
//  Created by Sinan Özman on 3.02.2024.
//

import UIKit
import OpenAPIRuntime
import OpenAPIURLSession

class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            await getData()
        }
    }
    
    func getData() async {
        var client = Client(serverURL: URL(string: "https://jsonplaceholder.typicode.com/")!, transport: URLSessionTransport())
        do {
            let data = try await client.getAll()
            let response = try data.ok.body.json.first
            print("UserID: \(response?.userId)")
            print("ID: \(response?.id)")
            print("TITLE: \(response?.title)")
        } catch {
            print(error)
        }
    }
}

