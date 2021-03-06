import UIKit

extension Component {

  func configureCollectionViewHeader(_ collectionView: CollectionView, with size: CGSize) {
    guard let collectionViewLayout = collectionView.collectionViewLayout as? GridableLayout else {
      return
    }

    guard let header = model.header else {
      return
    }

    guard let view = Configuration.views.make(header.kind)?.view else {
      return
    }

    collectionViewLayout.headerReferenceSize.width = collectionView.frame.size.width
    collectionViewLayout.headerReferenceSize.height = view.frame.size.height

    if collectionViewLayout.headerReferenceSize.width == 0.0 {
      collectionViewLayout.headerReferenceSize.width = size.width
    }

    guard let itemConfigurableView = view as? ItemConfigurable,
      collectionViewLayout.headerReferenceSize.height == 0.0 else {
        return
    }

    collectionViewLayout.headerReferenceSize.height = itemConfigurableView.preferredViewSize.height
  }
}
