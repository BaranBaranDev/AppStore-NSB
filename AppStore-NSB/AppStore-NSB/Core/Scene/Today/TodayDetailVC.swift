//
//  TodayDetailVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 29.04.2024.
//

import UIKit

class TodayDetailViewController: UITableViewController {
    static let reuseID = "TodayDetailViewController"
     // MARK: - Properties
    private var todayDetailViewModel: TodayDetailViewModel?
    var today: Today?{
        didSet{
            configure()
        }
    }
    private let detailImageView: UIImageView = CustomImageView()
     // MARK: - Lifecycle
     init() {
        super.init(style: .grouped)
         setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 14
    }
}
 // MARK: - Helpers
extension TodayDetailViewController{
    private func setup(){
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TodayDetailCell.self, forCellReuseIdentifier: TodayDetailCell.reuseID)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    private func configure(){
        guard let today = self.today else { return }
        detailImageView.image = UIImage(named: today.imageName)
        self.todayDetailViewModel = TodayDetailViewModel(today: today)
        tableView.reloadData()
    }
}
 // MARK: - UITableViewDataSource
extension TodayDetailViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayDetailCell.reuseID, for: indexPath) as! TodayDetailCell
        cell.today = self.todayDetailViewModel
        return cell
    }
}
 // MARK: - UITableViewHeader
extension TodayDetailViewController{
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return detailImageView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
}
