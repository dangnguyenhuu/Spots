import UIKit

extension CarouselSpot {

  /**
   - Returns: A CGFloat of the total height of all items inside of a component
   */
  public func spotHeight() -> CGFloat {
    return collectionView.height - layout.sectionInset.top - layout.sectionInset.bottom - layout.headerReferenceSize.height
  }

  public func sizeForItemAt(indexPath: NSIndexPath) -> CGSize {
    var width = collectionView.width

    if component.span > 0 {
      width = collectionView.width / CGFloat(component.span)
      width -= layout.sectionInset.left / component.span
      width -= layout.minimumInteritemSpacing
    }

    component.items[indexPath.item].size.width = width

    if component.items[indexPath.item].size.height == 0.0 {
      component.items[indexPath.item].size.height = collectionView.height - layout.sectionInset.top - layout.sectionInset.bottom - layout.headerReferenceSize.height
    }

    return CGSize(
      width: ceil(component.items[indexPath.item].size.width),
      height: ceil(component.items[indexPath.item].size.height))
  }
}