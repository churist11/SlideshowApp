//
//  SlideModel.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/05.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

struct SlideModel {

	// MARK: - Stored Property

	// 0 - 2
	internal var slideIndexNum: Int

	// MARK: - Computed Property

	internal var title: String {
		return "hams\(self.slideIndexNum + 1)"
	}

	internal var image: UIImage {
		get {
			// Initialize specified name image in assets
			if let image = UIImage(named: self.title, in: Bundle.main, with: .none) {

				return image

			} else {
				return UIImage(systemName: Constants.REPLACE_SYSTEM_IMAGE)!
			}
		}
	}

	// MARK: -  Initializer
	init(number: Int) {
		self.slideIndexNum = number
	}

}//End
