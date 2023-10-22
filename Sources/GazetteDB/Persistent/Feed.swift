//
//  File.swift
//  
//
//  Created by Noah Kamara on 16.10.23.
//

import Foundation
import SwiftData
import GazetteCore

@Model
public class Feed {
	@Attribute
	public let source: URL?
	
	@Attribute
	public let link: URL?
	
	@Attribute
	public var title: String?
	
	@Relationship(deleteRule: .cascade)
	public var image: Asset?
	
	@Relationship(deleteRule: .cascade)
	public var icon: Asset?
	
	@Relationship(deleteRule: .cascade)
	public var articles: [Article] = []
	
	convenience init(_ feed: TransientFeed) {
		self.init(
			source: feed.url,
			link: feed.link,
			title: feed.title
		)
	}
	
	init(source: URL?, link: URL?, title: String?) {
		self.source = source
		self.link = link
		self.title = title
	}
}
