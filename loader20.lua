require 'image'
ibt=torch.ByteTensor(19*4,3,20,20)
il=torch.ByteTensor(19*4)
for i=1,19 do
    local img = image.load('croped/box/img_' .. tostring(i) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i
end

for i=20,38 do
    local img = image.load('diff/box/img_' .. tostring(i-19) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-19
end

for i=39,57 do
    local img = image.load('difflight/box/img_' .. tostring(i-38) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-38
end

for i=58,76 do
    local img = image.load('light/box/img_' .. tostring(i-57) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i-57
end
imgdat = {data=ibt, label=il}
torch.save('full.dat',imgdat)
return imgdat
