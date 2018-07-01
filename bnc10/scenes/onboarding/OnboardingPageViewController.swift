import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDelegate,  UIPageViewControllerDataSource  {
    
    // MARK: Properties
    var pageControl = UIPageControl()
    //var parentOnboardingViewController: OnboardingViewController? = nil
    weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            self.getNewViewController(storyboardId: "onboardingPage0"),
            self.getNewViewController(storyboardId: "onboardingPage1"),
            self.getNewViewController(storyboardId: "onboardingPage2")
        ]
    }()
    
    private func getNewViewController(storyboardId: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:storyboardId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        self.delegate = self
        
        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageCount: orderedViewControllers.count)

        //parentOnboardingViewController = self.parent as? OnboardingViewController
        
        //parentOnboardingViewController?.printSome(msg: "hello")
        
        configurePageControl()
        
        // setViewControllers([orderedViewControllers[2]], direction: .forward, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Dots
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 220,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 1
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 0.5)
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 1)
        self.pageControl.transform = CGAffineTransform(scaleX: 1.8, y: 1.8);
        self.view.addSubview(pageControl)
    }
    
    // MARK: Scroll to next or previous
    /*func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first, let nextViewController = pageViewController?.
    }*/
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        //let currentPage = orderedViewControllers.index(of: pageContentViewController)
        //self.parentOnboardingViewController?.pageControl?.currentPage = (currentPage)!
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
        
        
        /*
        // Page control in container
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: index)
        }*/
    }
    
    
    // MARK: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }

}

protocol OnboardingPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController, didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController, didUpdatePageIndex index: Int)
    
}






