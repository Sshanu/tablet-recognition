optim = require 'optim'
require 'cunn';

fullset = torch.load('full_back_agu.dat')
shuffle = torch.randperm(1904)
shuffleset = fullset
for i=1, 1904 do
    shuffleset.data[i] = fullset.data[shuffle[i]]
    shuffleset.label[i] = fullset.label[shuffle[i]]
    end
fullset = shuffleset

trainset = {
    data = fullset.data[{{1,1904-380}}]:double(),
    label = fullset.label[{{1,1904-380}}]
}


setmetatable(trainset, 
    {__index = function(t, i) 
                    return {t.data[i], t.label[i]} 
                end}
);
trainset.data = trainset.data:double() -- convert the data from a ByteTensor to a DoubleTensor.

function trainset:size() 
    return self.data:size(1) 
end


nn = require 'nn'
model = nn.Sequential()
model:add(nn.SpatialConvolution(3,6,5,5))
model:add(nn.SpatialMaxPooling(2,2,2,2))
model:add(nn.ReLU())
model:add(nn.SpatialConvolution(6,16,5,5))
model:add(nn.SpatialMaxPooling(2,2,2,2))
model:add(nn.ReLU())
model:add(nn.View(16*2*2))
model:add(nn.Linear(16*2*2,120))
model:add(nn.ReLU())
model:add(nn.Linear(120,80))
model:add(nn.ReLU())
model:add(nn.Linear(80,17))
model:add(nn.LogSoftMax())
-- model = torch.load('fullmodel_back.net')
-- model = model:float()
model = model:cuda()
criterion = nn.ClassNLLCriterion()
criterion = criterion:cuda()
trainset.data = trainset.data:cuda()
trainset.label = trainset.label:cuda()

trainer = nn.StochasticGradient(model, criterion)
trainer.learningRate = 0.0001
trainer.maxIteration = 500
trainer:train(trainset)
model = model:float()
torch.save('fullmodel_back_cpu1.net',model)
