//
//  PageControllerVC.swift
//  PageViewController
//
//  Created by Ahmed Nasr on 4/17/21.
//
import UIKit

class PageControllerVC: UIPageViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    let pageController = UIPageViewController()
    var arrOfPage = [UIViewController]()
    var pageSelectController = UIPageControl()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        let page1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
        let page2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
        let page3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")
        if let vc1 = page1, let vc2 = page2, let vc3 = page3{
            arrOfPage.append(vc1)
            arrOfPage.append(vc2)
            arrOfPage.append(vc3)
        }
        if let firstView = arrOfPage.first{
            setViewControllers([firstView], direction: .forward, animated: true, completion: nil)
        }
        addPageController()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrOfPage.firstIndex(of: viewController) else {
            return nil
        }
        let perviosIndex = currentIndex - 1
        guard perviosIndex >= 0 else {
            return nil
            //return arrOfPage.last
        }
        return arrOfPage[perviosIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrOfPage.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < arrOfPage.count else {
            return nil
            //return arrOfPage.first
        }
        return arrOfPage[nextIndex]
    }
    /*func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrOfPage.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }*/
    func addPageController(){
        pageSelectController = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 75, width: UIScreen.main.bounds.width, height: 50))
        self.pageSelectController.numberOfPages = arrOfPage.count
        self.pageSelectController.currentPage = 0
        self.pageSelectController.tintColor = UIColor.white
        self.pageSelectController.pageIndicatorTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.pageSelectController.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageSelectController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let page = pageViewController.viewControllers![0]
        self.pageSelectController.currentPage = arrOfPage.firstIndex(of: page)!
    }
}
