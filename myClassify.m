function [predicted_label, scores] = myClassify(model, data)
    [predicted_label, scores] = predict(model, data);
end