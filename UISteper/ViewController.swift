//
//  ViewController.swift
//  UISteper
//
//  Created by Aleksander Kulikov on 09.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel = UILabel()
    var segmentedControl = UISegmentedControl(items: ["32 CM", "48 CM", "52 CM"])
    var itemImageView = UIImageView()
    var desctionLabel = UILabel()
    var stepper = UIStepper()
    var sendBatton = UIButton()
    
    var itemDescription = "Пицца Пеперони 32 CМ в количестве - 1 шт." {
        didSet {
            desctionLabel.text = itemDescription
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(segmentedControl)
        view.addSubview(itemImageView)
        view.addSubview(desctionLabel)
        view.addSubview(stepper)
        view.addSubview(sendBatton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        desctionLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        sendBatton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            itemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 340),
            itemImageView.heightAnchor.constraint(equalToConstant: 340),
            
            segmentedControl.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            desctionLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            desctionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            desctionLabel.widthAnchor.constraint(equalToConstant: 300),
            desctionLabel.heightAnchor.constraint(equalToConstant: 32),
            
            
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stepper.centerYAnchor.constraint(equalTo: desctionLabel.centerYAnchor),
            
            sendBatton.heightAnchor.constraint(equalToConstant: 40),
            sendBatton.widthAnchor.constraint(equalToConstant: 150),
            sendBatton.topAnchor.constraint(equalTo: desctionLabel.bottomAnchor, constant: 16),
            sendBatton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        
        ])
    
        titleLabel.layer.backgroundColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        titleLabel.layer.cornerRadius = 25
        titleLabel.text = "Пеперони"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textColor = .black
        
        itemImageView.clipsToBounds = true
        itemImageView.image = UIImage(named: "piza")
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.layer.borderColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        itemImageView.layer.borderWidth = 15
        itemImageView.layer.cornerRadius = 25
        
        segmentedControl.selectedSegmentTintColor = UIColor.systemGray
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.backgroundColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        segmentedControl.layer.borderWidth = 5
        segmentedControl.layer.cornerRadius = 25
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        segmentedControl.layer.borderColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        
        stepper.minimumValue = 0
        stepper.layer.backgroundColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)
        
        
        desctionLabel.textAlignment = .center
        desctionLabel.layer.backgroundColor = UIColor.systemGray.cgColor
        //UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        desctionLabel.layer.borderColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        desctionLabel.layer.borderWidth = 5
        desctionLabel.text = itemDescription
        
        sendBatton.setTitle("Добавить", for: .normal)
        sendBatton.layer.backgroundColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        sendBatton.layer.borderWidth = 5
        sendBatton.layer.borderColor = UIColor.init(displayP3Red: 260/278, green: 220/240, blue: 0, alpha: 0.9).cgColor
        sendBatton.setTitleColor(.blue, for: .highlighted)
        sendBatton.setTitleColor(.black, for: .normal)
        sendBatton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        
        view.layer.backgroundColor = UIColor.systemGray2.cgColor
    
    }
    
    @objc func segmentedAction (sender: UISegmentedControl) {
        itemDescription = "Пеперони \(sender.titleForSegment(at: segmentedControl.selectedSegmentIndex)!) в количестве - \(stepper.value) шт."
    }
    
    @objc func stepperAction(sender: UIStepper) {
        itemDescription = "Пеперони \(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!) в количестве - \(sender.value) шт."
    }
    @objc func sendAction() {
        
    }
    


}


