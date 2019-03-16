
import UIKit

class BJAutoScrollingCollectionView: UICollectionView {
    
    ///////////////////////////////////////////////////////////////////
    //MARK:- Properties
    //MARK:-
    
    private var timer = Timer()
    
    /**
     * The time interval between each scroll in collection view. 3 seconds is the default interval.
     */
    var scrollInterval: Int = 3
    
    ///////////////////////////////////////////////////////////////////
    //MARK:- Methods
    //MARK:-
    
    deinit { stopScrolling() }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isPagingEnabled = true
    }
    
    fileprivate func setTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(scrollInterval), target: self, selector: #selector(self.autoScrollImageSlider), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer, forMode: .common)
    }
    
    /**
     * Starts scrolling the collection view if there is at least one item in the datsource.
     */
    func startScrolling() {
        if !timer.isValid {
            if self.numberOfItems(inSection: 0) != 0 {
                stopScrolling()
                setTimer()
            }
        }
    }
    
    func stopScrolling() { if timer.isValid { self.timer.invalidate() } }
    
    @objc fileprivate func autoScrollImageSlider() {
        DispatchQueue.main.async {
            let firstIndex = 0
            let lastIndex = self.numberOfItems(inSection: 0) - 1
            let visibleCellsIndexes = self.indexPathsForVisibleItems.sorted()
            
            if !visibleCellsIndexes.isEmpty {
                let nextIndex = visibleCellsIndexes[0].row + 1
                let nextIndexPath: IndexPath = IndexPath.init(item: nextIndex, section: 0)
                let firstIndexPath: IndexPath = IndexPath.init(item: firstIndex, section: 0)
                
                (nextIndex > lastIndex) ? (self.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: true)) : (self.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true))
            }
        }
    }
}
