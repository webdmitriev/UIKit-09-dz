//
//  ViewController.swift
//  UIKit - 09 - dz
//
//  Created by Олег Дмитриев on 14.08.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private let appUIBuilders = UIBuilders()
    
    private let reviewsStars: [UIImage] = [.starGoldFull, .starGoldFull, .starGoldFull, .starGoldFull, .starGold]
    private let galleryImages: [UIImage] = [.gallery01, .gallery02, .gallery03]
    
    // MARK: - ScrollView
    private lazy var scrollView: UIScrollView = {
        $0.contentInsetAdjustmentBehavior = .never
        //$0.delegate = self
        $0.alwaysBounceVertical = true
        
        $0.backgroundColor = .appGray
        
        $0.addSubview(scrollContent)
        return $0
    }(UIScrollView(frame: view.frame))
    
    private lazy var scrollContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    
    private lazy var thumbnail: UIImageView = appUIBuilders.addImage(image: "thumbnail", offsetH: 430)
    
    // MARK: - hStackTitles
    private lazy var hStackTitles: UIStackView = appUIBuilders.addHStack(spacing: 24, distribution: .equalSpacing, alignment: .top)
    
    private lazy var hStackTitlesLabel: UILabel = appUIBuilders.addLabel(text: "ELIE SAAB LE PARFUM BRIDAL EAU DE PARFUM",
                                                                         fontS: 19, fontW: .medium)
    
    private lazy var hStackTitlesBtnStar: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.starGray, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: - hStackReviews
    private lazy var hStackReviews: UIStackView = appUIBuilders.addHStack(spacing: 6, distribution: .fillProportionally, alignment: .center)
    
    private lazy var hStackReviewsLabel: UILabel = appUIBuilders.addLabel(text: "249 отзывов",
                                                                          fontS: 15, fontW: .medium, color: .appGrayText)
    
    // MARK: - hStackPrice
    private lazy var hStackPrice: UIStackView = appUIBuilders.addHStack(spacing: 0, distribution: .equalSpacing, alignment: .center)
    
    private lazy var hStackPriceLabel: UILabel = appUIBuilders.addLabel(text: "4 299 ₽", fontS: 21, fontW: .semibold)
    
    private lazy var hStackPriceBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 140).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
        $0.setTitle("В корзину", for: .normal)
        $0.setTitleColor(.appWhite, for: .normal)
        $0.backgroundColor = .appBlack
        $0.layer.cornerRadius = 8
        return $0
    }(UIButton())
    
    // MARK: - Content
    private lazy var contentTitle: UILabel = appUIBuilders.addLabel(text: "Описание", fontS: 16, fontW: .black)

    private lazy var contentDescr: UILabel = appUIBuilders.addLabel(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo", 
                                                                    fontS: 14, fontW: .regular)
    
    // MARK: - hStackGallery
    private lazy var hStackGallery: UIStackView = appUIBuilders.addHStack(spacing: 12, distribution: .fillEqually, alignment: .center)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        
        setupUI()
        setupConstraints()
    }

    
    private func setupUI() {
        // MARK: - ScrollView
        scrollContent.addSubviews(thumbnail, hStackTitles, hStackReviews, hStackPrice, contentTitle, contentDescr, hStackGallery)

        // MARK: - hStackTitles
        hStackTitles.addArrangedSubviews(hStackTitlesLabel, hStackTitlesBtnStar)

        // MARK: - hStackReviews
        reviewsStars.enumerated().forEach { (idx, img) in
            hStackReviews.addArrangedSubview(StackImage(image: img))

            if idx == reviewsStars.count-1 {
                hStackReviews.addArrangedSubview(hStackReviewsLabel)
            }
        }
        
        // MARK: - hStackPrice
        hStackPrice.addArrangedSubviews(hStackPriceLabel, hStackPriceBtn)
        
        // MARK: - hStackGallery
        galleryImages.forEach { img in
            hStackGallery.addArrangedSubview(StackGallery(image: img))
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            thumbnail.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 0),
            thumbnail.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
            thumbnail.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: 0),
            
            hStackTitles.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 30),
            hStackTitles.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            hStackTitles.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            hStackReviews.topAnchor.constraint(equalTo: hStackTitles.bottomAnchor, constant: 20),
            hStackReviews.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            hStackReviews.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            hStackPrice.topAnchor.constraint(equalTo: hStackReviews.bottomAnchor, constant: 24),
            hStackPrice.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            hStackPrice.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            contentTitle.topAnchor.constraint(equalTo: hStackPrice.bottomAnchor, constant: 35),
            contentTitle.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            contentTitle.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            contentDescr.topAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 8),
            contentDescr.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            contentDescr.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            hStackGallery.topAnchor.constraint(equalTo: contentDescr.bottomAnchor, constant: 30),
            hStackGallery.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            hStackGallery.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            
            hStackGallery.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -45),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

class StackImage: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        widthAnchor.constraint(equalToConstant: 15).isActive = true
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StackGallery: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)

        heightAnchor.constraint(equalToConstant: 120).isActive = true
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
