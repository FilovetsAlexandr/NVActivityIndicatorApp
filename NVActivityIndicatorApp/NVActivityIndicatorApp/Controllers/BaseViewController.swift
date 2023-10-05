//
//  BaseViewController.swift
//  NVActivityIndicatorApp
//
//  Created by Alexandr Filovets on 5.10.23.
//

import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import UIKit

class BaseViewController: UIViewController {
    private var loading: NVActivityIndicatorView?
    private let colors: [UIColor] = [.red, .green, .blue, .yellow, .orange, .purple, .cyan, .magenta]
    private let animationTypes: [NVActivityIndicatorType] = [.ballPulse, .ballGridPulse, .ballClipRotate, .squareSpin, .ballSpinFadeLoader, .lineSpinFadeLoader, .triangleSkewSpin, .pacman, .ballGridBeat, .semiCircleSpin, .ballRotateChase, .orbit, .audioEqualizer, .circleStrokeSpin]

    func startAnimation() {
        let randomIndex = Int(arc4random_uniform(UInt32(animationTypes.count)))
        let randomAnimationType = animationTypes[randomIndex]

        // Удаление предыдущей анимации, если она есть
        loading?.stopAnimating()
        loading?.removeFromSuperview()
        // Создание
        loading = NVActivityIndicatorView(frame: .zero, type: randomAnimationType, color: getRandomColor(), padding: 0)
        loading?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading!)
        NSLayoutConstraint.activate([
            loading!.widthAnchor.constraint(equalToConstant: 150),
            loading!.heightAnchor.constraint(equalToConstant: 150),
            loading!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading!.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { self.loading?.startAnimating() }
    }

    // Рандомный цвет
    private func getRandomColor() -> UIColor {
        var randomColor: UIColor
        repeat {
            randomColor = colors.randomElement()!
        } while randomColor == .white

        return randomColor
    }
}
