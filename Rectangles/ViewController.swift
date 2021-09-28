//
//  ViewController.swift
//  Rectangles
//
//  Created by indraneel potnis on 22/09/21.
//

import UIKit

class ViewController: UIViewController {

    private var initialCenter: CGPoint = .zero
    var rectangles :[Rectangle] = []
    var userDefaultsUtils : UserDefaultsUtils!
    var api : RectangleService!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userDefaultsUtils.saveLastUsedDate(date: Date())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userDefaultsUtils.saveLastUsedDate(date: Date())
    }
    
    init?(coder: NSCoder, userDefaultsUtils: UserDefaultsUtils, api: RectangleService) {
        super.init(coder: coder)
        self.userDefaultsUtils = userDefaultsUtils
        self.api = api
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let lastUsedDate = userDefaultsUtils.loadLastUsedDate(), DateUtils.hasAWeekPassed(to: Date(), from: lastUsedDate) {
            loadDataFromAPI()
        } else if let rectangles = userDefaultsUtils.loadData(), !rectangles.isEmpty {
            self.rectangles = rectangles
            populateUI()
        } else {
            loadDataFromAPI()
        }
        
    }
    
    func loadDataFromAPI () {
        api.getRectangles(completionHandler: { result in
            if case .success(let rects) = result {
                print(" rects are \(rects)")
                self.rectangles = rects
                DispatchQueue.main.async {
                    self.populateUI()
                }
            } else if case .failure(let error) = result {
                print(error)
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Download Failure", message: "Failed to retrieve Rectangles", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
        userDefaultsUtils.saveData(rectangles: self.rectangles)
    }
    
    func populateUI () {
        for (index, rect) in self.rectangles.enumerated() {
            let rectScreenX = self.view.bounds.width * rect.x
            let rectScreenY = self.view.bounds.height * rect.y
            let rectScreenWidth = self.view.bounds.width * rect.size
            let rectScreenHeight = self.view.bounds.height * rect.size
            
            let rectView = UIView(frame: CGRect(x: rectScreenX, y: rectScreenY, width: rectScreenWidth, height: rectScreenHeight))
            let swiftColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 0.5)
            rectView.backgroundColor = swiftColor
            self.view.addSubview(rectView)
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))

            
            rectView.addGestureRecognizer(panGestureRecognizer)
            rectView.tag = index
        }
    }

    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            initialCenter = sender.view?.center ?? .zero
        case .changed:
            let translation = sender.translation(in: view)

            if let view = sender.view {
                view.center = CGPoint(x: initialCenter.x + translation.x,
                                              y: initialCenter.y + translation.y)
                let rectObject = rectangles[view.tag]
                rectObject.x =  (view.frame.origin.x / self.view.bounds.width )
                rectObject.y =  (view.frame.origin.y / self.view.bounds.height)
                userDefaultsUtils.saveData(rectangles: self.rectangles)
            }
            
        default:
            break
        }
    }
    

}

