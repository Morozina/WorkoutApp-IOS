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
//    private let datePicker = UIDatePicker()
//    private let doneButton = UIButton()
    private let remainingTimeLabel = UILabel()
    private let remainingTimer = UILabel()
    private let stackView = UIStackView()

    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: StateTimer = .isStoped
    
    func configTimer(duration: Double, progress: Double) {
        timerDuration = duration
        
        let currentPosition = progress > duration ? duration : progress
        let goalPosition = duration == 0 ? 1 : duration
        let percent = currentPosition / goalPosition
        progressBar.drawProgress(percent: percent)
    }
    
    func startTimer() {
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.timerProgress += 0.01

            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                self.timer.invalidate()
            }

            self.configTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.timerProgress -= 0.1

            if self.timerProgress <= 0 {
                self.timerProgress = 0
                self.timer.invalidate()
            }

            self.configTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
}

extension TimerView {
    
    override func setUpViews() {
        super.setUpViews()
        
        addNewView(progressBar)
        addNewView(stackView)
//        addNewView(datePicker)
//        addNewView(doneButton)

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
            
//            datePicker.topAnchor.constraint(equalTo: topAnchor),
//            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
//            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
//            datePicker.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            doneButton.topAnchor.constraint(equalTo: topAnchor),
//            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
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
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(elapsedTimerTapped))
//        elapsedTimer.addGestureRecognizer(tapGestureRecognizer)
        
//        datePicker.datePickerMode = .countDownTimer
//        datePicker.backgroundColor = Resources.Colors.TabBar.separator
//        datePicker.isHidden = true
//        datePicker.datePickerMode = .countDownTimer
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
//        doneButton.setTitle("Done", for: .normal)
//        doneButton.setTitleColor(.black, for: .normal)
//        doneButton.isHidden = true
//        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        remainingTimeLabel.text = Resources.Strings.SesionViewController.remainingTime
        remainingTimeLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 13)
        remainingTimeLabel.textColor = Resources.Colors.TabBar.inActive
        remainingTimeLabel.textAlignment = .center
        
        remainingTimer.text = "12:12"
        remainingTimer.font = Resources.Fonts.NavBar.HelveticaRegular(size: 13)
        remainingTimer.textColor = Resources.Colors.TabBar.inActive
        remainingTimer.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.spacing = 10
    }
}

//@objc extension TimerView {
//    func elapsedTimerTapped() {
//            datePicker.isHidden = false
//            doneButton.isHidden = false
//        }
//
//    func datePickerValueChanged() {
//        let minutes = Int(datePicker.countDownDuration)
//        let seconds = Int(datePicker.countDownDuration)
//        elapsedTimer.text = "\(minutes):\(seconds)"
//    }
//
//    func doneButtonTapped() {
//        datePicker.isHidden = true
//        doneButton.isHidden = true
//    }
//}
