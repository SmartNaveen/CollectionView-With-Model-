//
//  ViewController.swift
//  CollectionView
//
//  Created by Mr. Naveen Kumar on 15/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    let myCollectionViewCell = MyCollectionViewCell()
    
    var model: [Model]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = [Model(imgName: UIImage(systemName: "airplayaudio"), lblName: "airplayaudio"), Model(imgName: UIImage(systemName: "appletv"), lblName: "appletv"), Model(imgName: UIImage(systemName: "applewatch"), lblName: "applewatch"), Model(imgName: UIImage(systemName: "applelogo"), lblName: "applelogo")]
        pageControl.numberOfPages = model?.count ?? 0
        collectionView.register(myCollectionViewCell.nib(), forCellWithReuseIdentifier: myCollectionViewCell.cellIdentifier)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < model!.count {
            self.collectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
            
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
       let index = scrollView.contentOffset.x / witdh
       let roundedIndex = round(index)
       self.pageControl.currentPage = Int(roundedIndex)
   }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCollectionViewCell.cellIdentifier, for: indexPath) as? MyCollectionViewCell
        cell?.configureCell(model: model![indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
}

