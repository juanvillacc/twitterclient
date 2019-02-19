//
//  MainControllerExtension.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 17/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

/*import UIKit

struct HomeStatus {
    var text: String?
    var profileImageUrl: String?
    var name: String?
    var screenName: String?
}

extension MainViewController {
    
    static let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Twitter Home"
        
        /*collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.register(StatusCell.self, forCellWithReuseIdentifier: MainViewController.cellId)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout*/
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 111, height: 111)
        
        colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.delegate   = self
        colView.dataSource = self
        colView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        colView.backgroundColor = UIColor.white
        
        self.view.addSubview(colView)
        
        /*
        let twitter = STTwitterAPI(oAuthConsumerKey: "fDresyX1537VjSoZ0htMLQ5rU",
                                   consumerSecret: "f4QyMF681uXHMY8uA7nz2DsXFR9zXncvr9Td8EyUzt5TccqigT",
                                   oauthToken: "364330374-N7fF23zrJzOLzsgvGIuxVE0B2FQCCxFhxVGqanp1",
                                   oauthTokenSecret: "LPw5B7pMct4xrgYF21HLGKAkEdOoE5U37zJkeE0e4vfP9");
        twitter?.verifyCredentials(userSuccessBlock: { (userName, userId) in
            twitter?.getHomeTimeline(sinceID: nil, count: 20,
                                     successBlock: { (statuses) in
                                        
                                        
                                        self.homeStatuses = [HomeStatus]()
                                        
                                        for status in statuses! {
                                            
                                            let dictionary = status as? NSDictionary
                                            
                                            if let user = dictionary?["user"] {
                                                let userdic = user as? NSDictionary
                                                let profileImage =  userdic?["profile_image_url_https"]
                                                let screenName = userdic?["screen_name"]
                                                let name = userdic?["name"]
                                                
                                                self.homeStatuses?.append(HomeStatus(text: dictionary?["text"] as! String, profileImageUrl: profileImage as! String, name: name as! String, screenName: screenName as! String))
                                            }
                                        }
                                        
                                        self.collectionView?.reloadData()
                                        
                                        
            }, errorBlock: { (error) in
                print(error)
            })
            
            
            
        }, errorBlock: { (error) in
            print(error)
        })*/
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = homeStatuses?.count {
            return count
        }
        return 0
    }
    
    /*override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let statusCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellId, for: indexPath as IndexPath) as! StatusCell
        
        if let homeStatus = self.homeStatuses?[indexPath.item] {
            statusCell.homeStatus = homeStatus
        }
        
        return statusCell
    }*/
    
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let homeStatus = self.homeStatuses?[indexPath.item] {
            if let name = homeStatus.name, let screenName = homeStatus.screenName, let text = homeStatus.text {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
                
                attributedText.append(NSAttributedString(string: "\n@\(screenName)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
                
                attributedText.append(NSAttributedString(string: "\n\(text)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
                
                let size = attributedText.boundingRect(with: CGSize(view.frame.width - 80, 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), context: nil).size
                
                return CGSize(view.frame.width, size.height + 20)
            }
        }
        
        return CGSize(view.frame.width, 80)
    }*/
    
}

class StatusCell: UICollectionViewCell {
    
    var homeStatus: HomeStatus? {
        didSet {
            if let profileImageUrl = homeStatus?.profileImageUrl {
                
                if let name = homeStatus?.name, let screenName = homeStatus?.screenName, let text = homeStatus?.text {
                    let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
                    
                    attributedText.append(NSAttributedString(string: "\n@\(screenName)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
                    
                    attributedText.append(NSAttributedString(string: "\n\(text)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
                    
                    statusTextView.attributedText = attributedText
                }
                
                let url = NSURL(string: profileImageUrl)
                URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
                    
                    if error != nil {
                        print(error)
                        return
                    }
                   
                    print("loaded image")
                    let image = UIImage(data: data!)
                    DispatchQueue.main.sync(execute: {
                        self.profileImageView.image = image
                    })
                    
                }).resume()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    func setupViews() {
        addSubview(statusTextView)
        addSubview(dividerView)
        addSubview(profileImageView)
        
        // constraints for statusTextView
        addConstraintsWithFormat(format: "H:|-8-[v0(48)]-8-[v1]|", views: profileImageView, statusTextView)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: statusTextView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(48)]", views: profileImageView)
        
        // constraints for dividerView
        addConstraintsWithFormat(format: "H:|-8-[v0]|", views: dividerView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerView)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}*/
