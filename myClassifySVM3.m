function [predicted_label, scores] = myClassifySVM3(model, data)

%３倍の次元に写像
testing_data =repmat(sqrt(abs(data)).*sign(data),[1 3]).* [0.8*ones(size(data)) 0.6*cos(0.6*log(abs(data)+eps)) 0.6*sin(0.6*log(abs(data)+eps))];

[predicted_label, scores] = predict(model, testing_data);
end