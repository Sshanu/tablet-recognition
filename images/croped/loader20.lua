require 'image'
ibt=torch.ByteTensor(19,3,20,20)
il=torch.ByteTensor(19)
for i=1,19 do
    local img = image.load('box/img_' .. tostring(i) .. '.jpg',3,'byte')
    local img = image.scale(img,20,20)
    ibt[i] = img 
	il[i] = i
end
imgdat = {data=ibt, label=il}
torch.save('cropped20.dat',imgdat)
return imgdat
