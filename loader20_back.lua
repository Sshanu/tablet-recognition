require 'image'
ibt=torch.ByteTensor(17*4,3,20,20)
il=torch.ByteTensor(17*4)
for i=1,17 do
    local img = image.load('croped/back/img_' .. tostring(i) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i
end

for i=18,34 do
    local img = image.load('diff/back/img_' .. tostring(i-17) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-17
end

for i=35,51 do
    local img = image.load('difflight/back/img_' .. tostring(i-34) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-34
end

for i=52,68 do
    local img = image.load('light/back/img_' .. tostring(i-51) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-51
end
imgdat = {data=ibt, label=il}
torch.save('full_back.dat',imgdat)
return imgdat
