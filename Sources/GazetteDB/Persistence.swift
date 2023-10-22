//
//  File.swift
//  
//
//  Created by Noah Kamara on 16.10.23.
//

import Foundation
import SwiftData
import GazetteCore

public actor Persistence: ModelActor {
	internal static let schema = Schema([
		Feed.self,
		Article.self
	])
	
	internal static func container(inMemory: Bool) throws -> ModelContainer {
		let config = ModelConfiguration(isStoredInMemoryOnly: inMemory)
		
		return try ModelContainer(
			for: schema,
			configurations: config
		)
	}
	
	public let modelContainer: ModelContainer
	public let modelExecutor: ModelExecutor
	
	public init(modelContainer: ModelContainer) {
		self.modelContainer = modelContainer
		
		let context = ModelContext(modelContainer)
		modelExecutor = DefaultSerialModelExecutor(modelContext: context)
	}
	
	@discardableResult
	public func insert(_ transient: TransientFeed) -> Feed {
		let feed = Feed(
			source: transient.url,
			link: transient.link,
			title: transient.title
		)
		
		feed.image = if let image = transient.image {
			insert(image)
		} else { nil }
		
		feed.icon = if let icon = transient.icon { insert(icon) } else { nil }
		
		let articles = transient.articles.map(insert)
		
		feed.articles = articles
		
		modelContext.insert(feed)
		return feed
	}
	
	@discardableResult
	public func insert(_ transient: TransientArticle) -> Article {
		let article = Article(transient)
		modelContext.insert(article)
		article.image = if let image = transient.image { insert(image) } else { nil }
		
		return article
	}
	
	@discardableResult
	public func insert(_ image: TransientAsset) -> Asset {
		let asset = Asset(url: image.url)
		modelContext.insert(asset)
		return asset
	}
	
	public func save() throws {
		try modelContext.save()
	}
}
