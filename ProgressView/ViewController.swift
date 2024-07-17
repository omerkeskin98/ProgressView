//
//  ViewController.swift
//  ProgressView
//
//  Created by Omer Keskin on 16.07.2024.
//

import UIKit

class ViewController: UIViewController {

    var progressView: UIProgressView!
    var button: UIButton!
    var progressLabel: UILabel!
    var progress: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "Value: \(Int(progress))"
        progressLabel.textAlignment = .center
        
        view.addSubview(progressLabel)
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .blue
        progressView.trackTintColor = .black
        progressView.progress = 0.0
        
        view.addSubview(progressView)
        
        button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Progress", for: .normal)
        button.addTarget(self, action: #selector(increaseProgress), for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -10),
            
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 200),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 90),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func increaseProgress() {
        progress += 1
        if progress > 10 {
            progress = 0
        }
        progressView.setProgress(progress / 10, animated: true)
        progressLabel.text = "Value: \(Int(progress))"
    }
}
