# LTI System `lti_system.m`

此檔案主要是將原始音訊做下列處理：

1. 引入音訊`test.wav`
2. 引用`Hugo_filter.m`讓音訊經過下列五種系統
	1. 前向差分(Forward Difference)
	2. 後向差分(Backward Difference)
	3. 位移平均(Moving Average)
	4. 延遲(Ideal Delay)
	5. 累加器(Accumulator)
3. 引用`Hugo_freqz.m`找出五種系統的頻率響應
4. 把經過五種系統後的結果，分別輸出為
	1.`Out_Forward_diff.wav`
	2.`Out_Backward_diff.wav`
	3.`Out_Moving_average.wav`
	4.`Out_Delay.wav`
	5.`Out_Accumulator.wav`

# Output figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/Y.PNG)

# Convolution `Hugo_filter.m`

此檔案是將兩信號做折積的副函式，out回傳輸出結果，t回傳輸出結果之長度

# Frequency Response `Hugo_freqz.m`

此檔案是將脈衝響應轉至頻率響應的的副函式，並直接畫出頻率響應之大小圖及相位圖

# Forward Difference figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/h12.PNG)

# Backward Difference figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/h22.PNG)

# Moving Average figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/h32.PNG)

# Ideal Delay figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/h42.PNG)

# Accumulator figure
![alt_text](https://github.com/DigitalSignalProcessingNTUT2018/lab-1-basic-signal-and-spectrum-t106360145/blob/master/h52.PNG)

# PPT project `HW2.pptx`

此檔案將折積及計算頻率響應過程做較為詳盡的說明，並附上各個過程的頻譜及音源
