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
public class Article {
	@Attribute
	public let url: URL
	
	@Attribute
	public let title: String?
	
	@Attribute
	public let descr: String?
	
	@Attribute
	public let pubDate: Date?
	
	@Relationship(deleteRule: .cascade)
	public var image: Asset?
	
	@Relationship
	public var feed: Feed? = nil
	
	@Attribute
	public var isRead: Bool = false
	
	@Attribute
	public var isBookmarked: Bool = false
	
	internal init(
		url: URL,
		title: String? = nil,
		descr: String? = nil,
		pubDate: Date? = nil,
		feed: Feed? = nil,
		isRead: Bool = false
	) {
		self.url = url
		self.title = title
		self.descr = descr
		self.pubDate = pubDate
		self.image = image
		self.feed = feed
		self.isRead = isRead
	}
	
	
	convenience init(_ article: TransientArticle) {
		self.init(
			url: article.url,
			title: article.title,
			descr: article.description,
			pubDate: article.pubDate,
			isRead: false
		)
	}
}

