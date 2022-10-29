//
//  ViewController.swift
//  OTUS-GPB-TableView-HW
//
//  Created by Aleksandr Chebotarev on 10/23/22.
//

import UIKit

struct Model {
    let title: String
    let items: [String]
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let data: [Model] = [
        Model(title: "Languages", items: ["English", "Russian", "Dutch", "French", "Chinese"]),
        Model(title: "Programming Languages", items: ["Swift", "Java", "Kotlin", "Dart", "C++"]),
        Model(title: "Companies", items: ["Apple", "Google", "Oracle", "JetBrains", "Microsoft"]),
        Model(title: "Devices", items: ["Macbook", "iPhone", "SurfaceBook", "Chromebook", "Pixel"]),
        Model(title: "Specialty", items: ["iOS - Developer", "Android - Developer", "Analysts", "Data Scientist", "Programmer"])
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.row]
        
        let vc = DataViewController(items: model.items)
        vc.title = model.title
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}
