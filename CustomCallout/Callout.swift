//
//  Callout.swift
//  CustomCallout
//
//  Created by Iosif Moldovan on 22.03.2022.
//

import UIKit

class Callout: UIView {
  private let titleLabel = UILabel(frame: .zero)
  private let subtitleLabel = UILabel(frame: .zero)
  private let imageView = UIImageView(frame: .zero)
  private let annotation: Annotation

  init(annotation: Annotation) {
    self.annotation = annotation
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    translatesAutoresizingMaskIntoConstraints = false
    setupTitle()
    setupSubtitle()
    setupImageView()
  }
  
  private func setupTitle() {
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.text = annotation.name
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
  
  private func setupSubtitle() {
    subtitleLabel.font = UIFont.systemFont(ofSize: 14)
    subtitleLabel.textColor = .gray
    subtitleLabel.text = annotation.address
    addSubview(subtitleLabel)
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
    subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
  
  private func setupImageView() {
    imageView.image = annotation.image
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
  }
}
