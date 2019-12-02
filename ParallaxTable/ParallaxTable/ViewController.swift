//
//  ViewController.swift
//  ParallaxTable
//
//  Created by Дмитрий on 11/27/19.
//  Copyright © 2019 OwnDmitry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let images = [UIImage.init(named: "montenegro"),
                  UIImage.init(named: "kharkiv"),
                  UIImage.init(named: "kharkiv2"),
                  UIImage.init(named: "kharkiv3"),
                  UIImage.init(named: "london"),
                  UIImage.init(named: "ukraine"),
                  UIImage.init(named: "ukraine2"),
                  UIImage.init(named: "ukraine3"),
                  UIImage.init(named: "ukraine4"),
                  UIImage.init(named: "london"),
                  UIImage.init(named: "ukraine"),
                  UIImage.init(named: "ukraine2"),
                  UIImage.init(named: "ukraine3"),
                  UIImage.init(named: "ukraine4")]
    
    let parallaxSpeed: CGFloat = 50.0
    let cellHeight: CGFloat = 250.0
    
    var parallaxHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxSpeed * tableView.frame.height) - cellHeight) / 2
        return maxOffset + cellHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func parallax(offset: CGFloat, cell: UITableViewCell) -> CGFloat {
        let parallaxValue = (offset - cell.frame.origin.y) / parallaxHeight * parallaxSpeed
        return parallaxValue
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ParallaxTableCell") as? ParallaxTableCell {
            cell.configure(with: images[indexPath.row]!)
            cell.parallaxHeightCostr.constant = parallaxHeight
            cell.parallaxTopConstr.constant = parallax(offset: tableView.contentOffset.y, cell: cell)
            return cell
        }
        return ParallaxTableCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        tableView.visibleCells.forEach { (cell) in
            guard let cell = cell as? ParallaxTableCell else { return }
            cell.parallaxTopConstr.constant = parallax(offset: tableView.contentOffset.y, cell: cell)
        }
    }
    
    
}
