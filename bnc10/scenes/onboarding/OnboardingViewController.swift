import UIKit

class OnboardingViewController: UIViewController, OnboardingPageViewControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var containerview: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    weak var onboardingPageViewController: OnboardingPageViewController? = OnboardingPageViewController()
    
    func printSome(msg: String) {
        print(msg)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if (self.onboardingPageViewController? = (segue.destination as? OnboardingPageViewController)!) != nil {
        if let onboardingPageViewController = segue.destination as? OnboardingPageViewController {
            //self.onboardingPageViewController = onboardingPageViewController
            onboardingPageViewController.onboardingDelegate = self
        }
    }
    
    // MARK: OnboardingPageViewControllerDelegate
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }

}
