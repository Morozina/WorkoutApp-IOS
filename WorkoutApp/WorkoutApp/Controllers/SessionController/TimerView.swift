//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 12/01/2023.
//

import UIKit

enum StateTimer {
    case isStarted
    case isStoped
    case isPaused
}

final class TimerView: BaseInfoView {
    private let progressBar = ProgressView()
    private let elapsedTimeLabel = UILabel()
    private let elapsedTimer = UILabel()
    private let remainingTimeLabel = UILabel()
    private let remainingTimer = UILabel()
    private lazy var stackView = UIStackView()
    
    private var timer: Timer?
    private var timerProgress: Double = 0
    private var timerDuration: Double = 0.0
    var callBack: (() -> Void)?
    
    private var secondsForRemainded = 0
    private var minutesForRemainded = 0
    
    private lazy var picker = CustomUiPickerView()
    private lazy var doneButton = UIButton()
    private lazy var minutesLaberl = UILabel()
    private lazy var secondsLabel = UILabel()
    
    public var timerDur: TimeInterval = 0.0
    public var state: StateTimer = .isStoped
    
    func configTimer(duration: TimeInterval, progress: TimeInterval) {
        timerDuration = duration
        let goalPosition = duration == 0 ? 1 : duration
        let percent = progress / goalPosition
        progressBar.drawProgress(percent: percent)
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.timerProgress += 0.01
            self.minutesForRemainded = Int((self.timerDuration - self.timerProgress) / 60)
            self.secondsForRemainded = Int((self.timerDuration - self.timerProgress).truncatingRemainder(dividingBy: 60))
            
            self.remainingTimer.text = "\(String(format: "%02d", self.minutesForRemainded)):\(String(format: "%02d", self.secondsForRemainded))"
            
            if self.timerProgress >= self.timerDuration {
                self.timerProgress = self.timerDuration
                self.timer?.invalidate()
                self.callBack?()
            }
            self.configTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
    func pauseTimer() {
        timer?.invalidate()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timerProgress = 0
        secondsForRemainded = 0
        minutesForRemainded = 0
        configTimer(duration: timerDuration, progress: timerProgress)
    }
}

extension TimerView {
    
    override func setUpViews() {
        super.setUpViews()
        
        addNewView(progressBar)
        addNewView(stackView)
        addNewView(picker)
        addNewView(doneButton)
        addNewView(secondsLabel)
        addNewView(minutesLaberl)
        
        [
            elapsedTimeLabel,
            elapsedTimer,
            remainingTimeLabel,
            remainingTimer
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressBar.heightAnchor.constraint(equalTo: progressBar.widthAnchor),
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            stackView.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            
            picker.topAnchor.constraint(equalTo: topAnchor),
            picker.trailingAnchor.constraint(equalTo: trailingAnchor),
            picker.leadingAnchor.constraint(equalTo: leadingAnchor),
            picker.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            doneButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            doneButton.widthAnchor.constraint(equalToConstant: 50),
            
            secondsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            secondsLabel.trailingAnchor.constraint(equalTo: doneButton.leadingAnchor, constant: 20),
            secondsLabel.widthAnchor.constraint(equalToConstant: 100),
            minutesLaberl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            minutesLaberl.trailingAnchor.constraint(equalTo: secondsLabel.leadingAnchor, constant: -70)
            
        ])
        
    }
    
    override func config() {
        super.config()
        
        elapsedTimeLabel.text = Resources.Strings.SesionViewController.elapsedTime
        elapsedTimeLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 14)
        elapsedTimeLabel.textColor = Resources.Colors.TabBar.inActive
        elapsedTimeLabel.textAlignment = .center
        
        elapsedTimer.text = "00:00"
        elapsedTimer.textColor = Resources.Colors.NavBar.titleGray
        elapsedTimer.font = .boldSystemFont(ofSize: 46)
        elapsedTimer.textAlignment = .center
        elapsedTimer.isUserInteractionEnabled = true
        elapsedTimer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPicker)))
        
        remainingTimeLabel.text = Resources.Strings.SesionViewController.remainingTime
        remainingTimeLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 13)
        remainingTimeLabel.textColor = Resources.Colors.TabBar.inActive
        remainingTimeLabel.textAlignment = .center
        
        remainingTimer.text = "00:00"
        remainingTimer.font = Resources.Fonts.NavBar.HelveticaRegular(size: 13)
        remainingTimer.textColor = Resources.Colors.TabBar.inActive
        remainingTimer.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        picker.isHidden = true
        picker.valueChanged = { minutes, seconds, results in
            self.elapsedTimer.text = "\(minutes):\(seconds)"
            self.timerDur = Double(results)
        }
        picker.backgroundColor = Resources.Colors.TabBar.separator
        
        doneButton.isHidden = true
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(Resources.Colors.TabBar.active, for: .normal)
        
        secondsLabel.isHidden = true
        secondsLabel.text = "Seconds"
        secondsLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 20)
        secondsLabel.textColor = Resources.Colors.NavBar.titleGray
        
        minutesLaberl.isHidden = true
        minutesLaberl.text = "Minutes"
        minutesLaberl.font = Resources.Fonts.NavBar.HelveticaRegular(size: 20)
        minutesLaberl.textColor = Resources.Colors.NavBar.titleGray
        
    }
}

@objc extension TimerView {
    func showPicker() {
        picker.isHidden = false
        doneButton.isHidden = false
        secondsLabel.isHidden = false
        minutesLaberl.isHidden = false
    }
    
    func doneButtonTapped() {
        picker.isHidden = true
        doneButton.isHidden = true
        secondsLabel.isHidden = true
        minutesLaberl.isHidden = true
    }
}

extension TimerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
}
