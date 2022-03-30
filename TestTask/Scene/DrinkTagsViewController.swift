//
//  ViewController.swift
//  TestTask
//
//  Created by Михаил on 29.03.2022.
//

import UIKit
import TagListView

class DrinkTagsViewController: UIViewController {
    
    var rootView = DrinkListView()
    var provider = CoctailsProvider()
    var coctails: [String] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.tagListView.delegate = self
        loadCoctails()
    }
    
    func loadCoctails() {
        provider.getNonAlcoholicCoctails { [weak self] drinks in
            guard let self = self else { return }
            let drinkNames = drinks.map { $0.strDrink }
            self.refreshTags(Array(drinkNames))
        } failure: { error in
            print(error)
        }
    }
    
    func refreshTags(_ tags: [String]) {
        coctails = tags
        rootView.tagListView.removeAllTags()
        rootView.tagListView.addTags(tags)
        rootView.tagListView.reloadInputViews()
    }
}

extension DrinkTagsViewController: TagListViewDelegate {
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected.toggle()
        tagView.isSelected ? tagView.addLayer() : tagView.removeLayer()
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
    }
}


