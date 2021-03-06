@testable import Spots
import Foundation
import XCTest

class GridCompositeTests: XCTestCase {

  func testGridComposite() {
    let view = GridComposite()
    var item = Item()
    let gridComponent = CompositeComponent(component: Component(model: ComponentModel(kind: .grid, layout: Layout(span: 1))), itemIndex: 0)
    view.configure(&item, compositeComponents: [gridComponent])

    XCTAssertTrue(view.contentView.subviews.count == 1)

    let carouselComponent = CompositeComponent(component: Component(model: ComponentModel(kind: .carousel, layout: Layout(span: 1))), itemIndex: 0)
    let listComponent = CompositeComponent(component: Component(model: ComponentModel(kind: .list, layout: Layout(span: 1))), itemIndex: 0)
    view.configure(&item, compositeComponents: [carouselComponent, listComponent])

    XCTAssertTrue(view.contentView.subviews.count == 3)
    XCTAssertTrue(view.contentView.subviews[0] is UICollectionView)
    XCTAssertTrue(view.contentView.subviews[1] is UICollectionView)
    XCTAssertTrue(view.contentView.subviews[2] is UITableView)

    view.prepareForReuse()
    XCTAssertTrue(view.contentView.subviews.count == 0)

    view.configure(&item, compositeComponents: nil)
    XCTAssertTrue(view.contentView.subviews.count == 0)

    view.configure(&item, compositeComponents: [carouselComponent, listComponent])
    XCTAssertTrue(view.contentView.subviews.count == 2)
    XCTAssertTrue(view.contentView.subviews[0] is UICollectionView)
    XCTAssertTrue(view.contentView.subviews[1] is UITableView)

    let customView = UIView()
    view.contentView.addSubview(customView)
    view.prepareForReuse()
    XCTAssertTrue(view.contentView.subviews.count == 1)
  }
}
