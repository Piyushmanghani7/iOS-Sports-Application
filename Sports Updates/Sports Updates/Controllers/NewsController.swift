//
//  SchedulesController.swift
//  Sports Updates
//
//  Created by  on 2/17/23.
//

import UIKit
import WebKit
class NewsController: UIViewController {

    
    @IBOutlet weak var newsview: WKWebView!
    @IBOutlet weak var gamesegment: UISegmentedControl!
    
    
    @IBAction func gamevalue(_ sender: Any) {
        if gamesegment.selectedSegmentIndex == 0
        {
            NFLnews()
        }
        if gamesegment.selectedSegmentIndex == 1
        {
            MLBnews()

        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NFLnews()
    }
    

    
    private func NFLnews()
    {
        let url = URL(string: "https://www.rotoballer.com/player-news/jets-interest-in-odell-beckham-jr-very-real/1152228")
        
        let request = URLRequest(url: url!)
        newsview.load(request)
        
    }
    private func MLBnews()
    {
        let url = URL(string: "https://www.rotoballer.com/player-news/mitch-garver-ramping-up-action/1152028")
        
        let request = URLRequest(url: url!)
        newsview.load(request)
        
    }
}
