//
//  Slide.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/05.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

struct Slide {

	// MARK: - Stored Property
	internal var page: Int
	internal var title: String
	internal var image: UIImage

	// MARK: - Initializer
	init(page: Int, title: String,  image: UIImage) {
		self.page = page
		self.title = title
		self.image = image
	}
}
