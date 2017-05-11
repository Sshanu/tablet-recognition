require 'image'
ibt=torch.ByteTensor(17*4*28,3,20,20)
il=torch.ByteTensor(17*4*28)
j = 1
s = {'croped','diff','difflight','light'}
for x=1,4 do

	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
		il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()
	    local img = image.crop(img, 0, 0, 490, 490)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()
	    local img = image.crop(img, 10, 10, 490, 490)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()
	    local img = image.crop(img, 10, 10, 500, 500)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()   
	    local img = image.crop(img, 10, 0, 500, 490)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()
	    local img = image.crop(img, 0, 10, 490, 500)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end
	for i=1,17 do
	    local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	    local img = image.scale(img,500,500):double()
	    local img = image.crop(img, 0, 10, 490, 490)
	    local img = image.scale(img,20,20)
	    ibt[j] = img 
	    il[j] = i
	    j=j+1
	end

	-- lighting
	n = {2,5,7}
	for k=1,3 do
	    b = torch.randn(500,500)*n[k]
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        local img = image.crop(img, 0, 0, 490, 490)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        local img = image.crop(img, 10, 10, 490, 490)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        local img = image.crop(img, 10, 10, 500, 500)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()   
	        local img = image.crop(img, 10, 0, 500, 490)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        local img = image.crop(img, 0, 10, 490, 500)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end
	    for i=1,17 do
	        local img = image.load(s[x]..'/back/img_' .. tostring(i) .. '.jpg',3,'byte')
	        local img = image.scale(img,500,500):double()
	        local img = image.crop(img, 0, 10, 490, 490)
	        local img = image.scale(img,500,500):double()
	        img[1] = img[1] +b
	        local img = image.scale(img,20,20)
	        ibt[j] = img 
	        il[j] = i
	        j=j+1
	    end

	end

end


imgdat = {data=ibt, label=il}
torch.save('full_back.dat',imgdat)
return imgdat
